use project_3;

select *
from performances;

# Teams with the most seasons played
select team, count(*)
from performances
group by team
order by 2 desc;

# Last title for teams
select team, year
from performances
where playoffs = 'Won Finals'
group by 1
order by Year desc;

# Teams with the most wins
select distinct team, count(distinct wins)
from performances
order by 2 desc;

# Teams with the greatest wins percentage
select team, year, wins_pct as 'Wins percentage'
from performances
order by 3 desc
limit 5;

# Teams with the lowest wins percentage
select team, year, wins, losses, wins_pct as 'Wins percentage'
from performances
order by 3
limit 5;

# Teams with the greatest wins percentage but didn't win the title
select team, year, wins, losses, wins_pct as 'Wins percentage', playoffs
from performances
where playoffs not in ('Won Finals')
order by 3 desc
limit 10;

# Teams with the lowest wins percentage and win the title 
select team, year, wins, losses, wins_pct as 'Wins percentage', playoffs
from performances
where playoffs ='Won Finals'
order by 5
limit 5;

# Overview of stats
select *
from stats;

#Teams with the most points in a season
select stats.team, stats.year, stats.points, performances.playoffs, round(offensive_rating-defensive_rating, 2)
from stats
inner join performances
on stats.team = performances.team and stats.year = performances.year
order by 3 desc
limit 10;

# Teams with the best field goal percentage
select team, year, points, field_goal, fg_pct
from stats
order by 5 desc
limit 10;

# Champions, offensive rating and defensive rating
SELECT 
    team,
    year,
    offensive_rating,
    defensive_rating,
    ROUND((offensive_rating - defensive_rating), 2) AS 'offense/defense'
FROM
    performances
WHERE
    playoffs = 'Won Finals'
ORDER BY year DESC;

# points for a champion
select performances.team, performances.year, stats.points, stats.assists, stats.rebounds
from performances
inner join stats
on performances.team = stats.team and performances.year = stats.year
where performances.playoffs = 'Won Finals'
ORDER BY 3 desc;

# Stats for a champ in the 2010's
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs = 'Won Finals'
        AND performances.year IN ('2010-11' , '2011-12',
        '2012-13',
        '2013-14',
        '2014-15',
        '2015-16',
        '2016-17',
        '2017-18',
        '2018-19',
        '2019-20');

# Stats for a non-champ team but makes the playoffs in the 2010's
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs not in ('Won Finals', 'No Playoffs')
        AND performances.year IN ('2010-11' , '2011-12',
        '2012-13',
        '2013-14',
        '2014-15',
        '2015-16',
        '2016-17',
        '2017-18',
        '2018-19',
        '2019-20');

# Stats for a champ in the 2000's
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs = 'Won Finals'
        AND performances.year IN ('2000-01' , '2001-02',
        '2002-03',
        '2003-04',
        '2004-05',
        '2005-06',
        '2006-07',
        '2007-08',
        '2008-09',
        '2009-10'); 
        

# Stats for a non-champ team but make the playoffs in the 2000's
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs not in ('Won Finals', 'No Playoffs')
        AND performances.year IN ('2000-01' , '2001-02',
        '2002-03',
        '2003-04',
        '2004-05',
        '2005-06',
        '2006-07',
        '2007-08',
        '2008-09',
        '2009-10'); 


        
# Stats for a champ in the 1990
SELECT
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs = 'Won Finals'
        AND performances.year in ('1990-91', '1991-92', '1992-93', '1993-94', '1994-95', '1995-96', '1996-97', '1997-98', '1998-99', '1999-00');


# Stats for a non-champ team but makes the playoffs the in the 1990
SELECT
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs not in ('Won Finals', 'No Playoffs')
        AND performances.year in ('1990-91', '1991-92', '1992-93', '1993-94', '1994-95', '1995-96', '1996-97', '1997-98', '1998-99', '1999-00');

# Stats for a champ in the 1980
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs = 'Won Finals'
        AND performances.year in ('1980-81', '1981-82', '1982-83', '1983-84', '1984-85', '1985-86', '1986-87', '1987-88', '1989-89', '1989-90');
        
# Stats for a non-champ team but makes the playoffs in the 1980
SELECT 
    ROUND(AVG(offensive_rating), 2) AS 'AVG OFF',
    ROUND(AVG(defensive_rating), 2) AS 'AVG DEF',
    ROUND(AVG(offensive_rating - defensive_rating),
            2) AS 'AVG OFF/DEF',
    ROUND(AVG(stats.points), 2) AS 'AVG PTS',
    ROUND(AVG(stats.fg_pct), 2) AS 'AVG FG PERCENTAGE'
FROM
    performances
        INNER JOIN
    stats ON performances.team = stats.team
        AND performances.year = stats.year
WHERE
    playoffs not in ('Won Finals', 'No Playoffs')
        AND performances.year in ('1980-81', '1981-82', '1982-83', '1983-84', '1984-85', '1985-86', '1986-87', '1987-88', '1989-89', '1989-90');
        

#Teams with the most points in a season
select stats.team, stats.year, stats.points, performances.playoffs, round(offensive_rating-defensive_rating, 2)
from stats
inner join performances
on stats.team = performances.team and stats.year = performances.year
order by 5 desc
limit 10;