from requests.exceptions import SSLError, Timeout, TooManyRedirects, RequestException
from contextlib import closing
from IPython.display import Markdown, display
import warnings

warnings.filterwarnings('ignore')
timeout_glob=0.2
verify_glob=True
allow_glob=True
def printmd(string):
    display(Markdown('**'+string+'**'))
def is_good_response(x):
    """
    Returns True if response seems to be an HTML and False otherwise
    x - response from request
    """
    content_type = x.headers['Content-Type'].lower()
    return ((x.status_code==200 and content_type is not None and content_type.find('html')>1), x.status_code)
def status_handler(status):
    """
    This function will check whether our status is 200. 
    It will print the verification message to let us know if everything is good
    status - status code, integer
    """
    if status<300:
        print('Everything is okay!')
    elif 400<=status<500:
        print('request has failed due to your mistake. Think about it. ')
    else:
        print('Yooooo, I have no clue what has happened. Something is wrong with the website bro')
    return None
def adaptive_scrapping(url, timeout=timeout_glob, verify=verify_glob):
    global verify_glob
    global timeout_glob
    global allow_glob
    import requests as r
    try:
        resp=r.get(url, stream=True, timeout=timeout_glob, verify=verify_glob, allow_redirects=allow_glob)
        test1=is_good_response(resp)
        print(resp)
        if test1[0]:
            return resp.content
        else:
            return status_handler(test[1])
    except Timeout as e:
        print('Error during request to',url)
        printmd("We can increase the response waiting time. Should we do that?")
        ans = input("y/n")
        if ans.lower()=='y':
            timeout_glob*=2
            return adaptive_scrapping(url)
        else:
            return None
    except SSLError as e:
        print('Error during request to',url)
        printmd("We can skip verification of SSL. Should we do that?")
        ans = input("y/n")
        if ans.lower()=='y':
            verify_glob=False
            return adaptive_scrapping(url)
        else:
            return None
    except TooManyRedirects as e:
        print('Error during request to',url)
        printmd("We can increase the number of allowed redirects. Should we do that?")
        ans = input("y/n")
        if ans.lower()=='y':
            allow_glob=True
            return adaptive_scrapping(url)
        else:
            return None
    except RequestException as e:
        print('Error during request to',url)
        printmd("Sorry, we have no clue what has happened. Therefore we cant help you. Please try again later")
        return None