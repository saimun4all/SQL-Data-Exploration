SELECT * FROM PortfolioProject.dbo.CovidDeaths
order BY 3,4

--SELECT * FROM dbo.CovidVaccinations
--ORDER BY 3,4

SELECT location, date,total_cases,new_cases, total_deaths, population
FROM PortfolioProject.dbo.CovidDeaths
order BY 1,2

-- Looking into Total Cases vs Total Deaths in different countries

SELECT 
	Location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 AS Death_Percentage
FROM
	PortfolioProject.dbo.CovidDeaths
WHERE location LIKE '%states%'
ORDER BY 1,2


-- Looking into Total Cases vs Population
-- Shows what percentage of population got Covid

SELECT 
	Location,
	date,
	total_cases,
	population,
	(total_cases/population)*100 AS DeathPercentage
FROM
	PortfolioProject.dbo.CovidDeaths
WHERE location LIKE '%states%'
ORDER BY 1,2
