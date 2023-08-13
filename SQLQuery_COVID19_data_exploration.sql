SELECT * FROM dbo.CovidDeaths
order BY 3,4

--SELECT * FROM dbo.CovidVaccinations
--ORDER BY 3,4

SELECT location, date,total_cases,new_cases, total_deaths, population
FROM dbo.CovidDeaths
order BY 1,2

-- Looking into Total Cases vs Total Deaths

SELECT 
	Location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 AS Death_Percentage
FROM
	dbo.CovidDeaths
ORDER BY 1,2