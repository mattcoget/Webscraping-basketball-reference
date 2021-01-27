# Webscraping-basketball-reference


![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Project: Web Data Scraping on Basketball-Reference.com



## Content
- [Presentation of the project](https://docs.google.com/presentation/d/1Ai-mZfTvXBwPrxQzoZmWBExR1j0E8oJikONONBjCgnA/)
- [Project Description](#project-description)
- [Collect Datas](#collect-datas)
- [Clean DataFrame](#clean-dataFrame)
- [Export to CSV](#export-to-csv)
- [Data Analysis](#data-analysis)
- [Lessons Learnt](#lessons_learnt)
- [Files](#files)

## Project Description

The goal of this project was to collect data from one of most complete website on datas in basketball and try to have some clues about the statistics that make a champion in the NBA (North American Basket Association).

### Collect Datas
At first, the challenge was to select which data will be useful or not. Then how to select it the CSS code of the website and collect data from one test team. After selecting those datas, the second step was create a dictionnary with the informations and create a DataFrame where every data will be in its dedicated rows and columns.

After achieving these first two steps, the amount of datas was important, but not enough to have a deep understanding of the problem. For example, the statistics of points, field goals, rebounds, assists, blocks and turnovers which are essential to NBA. So a new page containing these stats have been selected for the test team.

Two dataframes were created for this one team, with one important information about the second: as rebounds, steals, blocks and turnovers are not complete columns (those statistics weren't counted before the 70's), the creation was a litte bit more complicated with the modification during the dataframe creation with `df=pd.DataFrame.from_dict(data, orient='index').transpose()`.

But as the goal is to scrap all team, it was necessary to loop into all the teams and so understand how the select all the active franchises (around 20 are defunct since the creation of the NBA).
After creating the two loops, all the datas have been scraped for the active teams.

### Clean DataFrame
The datas scrapped had a few problems : 
1. Need to drop the rows 2020-21 for each team: the season didn't even start.
2. Problem with the values, because it's objects and not int or float. 
3. The rank_team_playoffs column must be normalized to help the data analysis with something less specific to each season: as the league changed many times, different names have been used for the same stages.
4. The teams' names for the second DataFrame had to be changed too : it's necessary that the columns correspond to the column team of the other DataFrame for the data analysis.

### Export to CSV
When datas have been cleaned, they were exported to two csv files used later for the data analysis on MySQL.

### Data Analysis
Three questions were the basis of the analysis:
* What makes a team win championship? Except win the last game of the playoffs.
* Which are the best teams of all time ? The worst?
* Is there a data showing which teams have the most chances to become a champion?

## Lessons Learnt
* Scrap datas : Select the right elements in CSS
* Create a DataFrame from datas scraped :Create loops to collect datas through website pages
* Use the map function: And it makes the other steps easier.
* Data must be normalized: Before any data analysis on MySQL, the datas must have a useful format


## Files
* [Presentation of the project](https://docs.google.com/presentation/d/1Ai-mZfTvXBwPrxQzoZmWBExR1j0E8oJikONONBjCgnA/)
* [Jupyter Notebook with the code](https://github.com/mattcoget/Webscraping-basketball-reference/blob/main/WebScraping%20basketball-reference.com%2C%20Data%20Cleaning%20and%20Export%20to%20MySQL.ipynb)
* [CSV File: Teams Performances per Year](https://github.com/mattcoget/Webscraping-basketball-reference/blob/main/output/performances.csv)
* [CSV File: Teams Stats per Year](https://github.com/mattcoget/Webscraping-basketball-reference/blob/main/output/stats.csv)
* [SQL File for the analysis](https://github.com/mattcoget/Webscraping-basketball-reference/blob/main/output/basket-reference.sql)
