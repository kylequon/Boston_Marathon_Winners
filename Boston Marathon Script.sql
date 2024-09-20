Tableau Dashboard: https://public.tableau.com/app/profile/kyle8025/viz/BostonMarathonWinners_17193772368660/BostonMarathonWinnersStatistics
 
 --- Men's Boston Marathon Winners

--Remove null rows from Mens Marathon Winner table
delete from Mens_Boston_Marathon_Winners
where Mens_Boston_Marathon_Winners.Year is null;

-- Add Gender, Calculate Total Minutes, Minutes per Mile (Speed) for Each Winner
select *,
(
(DATEPART(hour,Time) * 60) + 
DATEPART(MINUTE,Time) + 
(DATEPART(SECOND,Time)/60)
)
 as Minutes,
round(((
(DATEPART(hour,Time) * 60) + 
DATEPART(MINUTE,Time) + 
(DATEPART(SECOND,Time)/60)
)
/ Distance_Miles),2) as Speed_Per_Mile,'Male' as Gender
from Mens_Boston_Marathon_Winners;

-- Top 10 Countries by Number of Male Winners
select top (10) Country,count(Country) as Number_of_Winners
from Mens_Boston_Marathon_Winners
group by country
order by count(Country) desc;

--- Women's Boston Marathon Winners

--Remove null rows from Women's Marathon Winner table
delete from Womens_Boston_Marathon_Winners
where Womens_Boston_Marathon_Winners.Year is null;

select *,
(
(DATEPART(hour,Time) * 60) + 
DATEPART(MINUTE,Time) + 
(DATEPART(SECOND,Time)/60)
)
 as Minutes,
round(((
(DATEPART(hour,Time) * 60) + 
DATEPART(MINUTE,Time) + 
(DATEPART(SECOND,Time)/60)
)
/ Distance_Miles),2) as Speed_Per_Mile,'Female' as Gender
from Womens_Boston_Marathon_Winners;

-- Top 10 Countries by Number of Female Winners
select Country,count(Country) as Number_of_Winners
from Womens_Boston_Marathon_Winners
group by country
order by count(Country) desc;


-- Countries that have at least 1 Female and 1 Male Winner
select Mens_Boston_Marathon_Winners.Country
from Mens_Boston_Marathon_Winners
join Womens_Boston_Marathon_Winners on Mens_Boston_Marathon_Winners.Country = Womens_Boston_Marathon_Winners.Country
group by Mens_Boston_Marathon_Winners.Country

-- Countries that have 1 Male Winner but No Female Winner
select Mens_Boston_Marathon_Winners.Country
from Mens_Boston_Marathon_Winners
left join Womens_Boston_Marathon_Winners on Mens_Boston_Marathon_Winners.Country = Womens_Boston_Marathon_Winners.Country
group by Mens_Boston_Marathon_Winners.Country

-- Countries that have 1 Female Winner but No Male Winner 
select Womens_Boston_Marathon_Winners.Country
from Womens_Boston_Marathon_Winners
left join Mens_Boston_Marathon_Winners on Mens_Boston_Marathon_Winners.Country = Womens_Boston_Marathon_Winners.Country
group by Womens_Boston_Marathon_Winners.Country


 
