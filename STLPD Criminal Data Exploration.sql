select *
from criminaldata

select value, forjuris, ucrcasestatus,district, dtcalledintocad
from criminaldata
where ucrcasestatus = 'Cleared by arrest' and district is not NULL 
order by district asc

--Looking at the count and sum of case statuses 

SELECT ucrcasestatus, COUNT(*) AS ReportCount
FROM CriminalData
GROUP BY Ucrcasestatus

UNION ALL

SELECT 'SUM' Ucrcasestatus, COUNT(*)
FROM criminaldata;

--We are going to be looking at which district reports the most 'Motor Vehicle Thefts'

select Value, district, count(district)
from criminaldata
where value = 'MOTOR VEHICLE THEFT, AUTO'
group by value, district;


--Looking at which disctrict overall has the most reported crimes

Select district, count(district)
from criminaldata
Where district is not NULL
group by district;

--Quick count of crimes per year and crimes per day 

Select Datepart(year, dtcalledintocad) AS Year, count(*)
from criminaldata
--WHERE dtcalledintocad ='2021' and dtcalledintocad = '2020'
group by dtcalledintocad;

SELECT 'SUM' dtcalledintocad, COUNT(*)
FROM criminaldata;



SELECT datename(weekday,dtcalledintocad) AS Weekday
FROM criminaldata;

Select Datepart(hour,dtcalledintocad) as Time
From CriminalData;


--Creating Views for later visualizations 

Create View WeekdayData as
SELECT datename(weekday,dtcalledintocad) AS Weekday
FROM criminaldata;

Create View ReportTime as
Select Datepart(hour,dtcalledintocad) as Time
From CriminalData;

Create View ClearedCases as
select value, forjuris, ucrcasestatus,district, dtcalledintocad
from criminaldata
where ucrcasestatus = 'Cleared by arrest' and district is not NULL 


Create View CaseStatus as 
SELECT ucrcasestatus, COUNT(*) AS ReportCount
FROM CriminalData
GROUP BY Ucrcasestatus

UNION ALL

SELECT 'SUM' Ucrcasestatus, COUNT(*)
FROM criminaldata;

Create View MotorTheft as
select Value, district, count(district)
from CriminalData
where value = 'MOTOR VEHICLE THEFT, AUTO'
group by value, district;

