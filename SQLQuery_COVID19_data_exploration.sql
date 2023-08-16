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

-- Countries with highest infection rates compared to population
SELECT 
	Location,
	population,
	MAX(total_cases) AS HighestInfectionCount,
	MAX(total_cases/population)*100 AS PercentPopulationInfected
FROM
	PortfolioProject.dbo.CovidDeaths
	GROUP BY location, population
	ORDER BY PercentPopulationInfected DESC

-- Finding the countries with the highest death counts per population
SELECT 
	Location,
	MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM
	PortfolioProject.dbo.CovidDeaths
	WHERE continent IS NOT NULL
	GROUP BY location
	ORDER BY TotalDeathCount DESC

-- Analyzing the data by continent
-- Showing continents with the highest death counts

SELECT
	location,
	MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM
	PortfolioProject.dbo.CovidDeaths
	WHERE continent IS NULL
	GROUP BY location
	ORDER BY TotalDeathCount DESC

-- Global numbers across the world
SELECT 
	date,
	SUM(new_cases) AS total_cases,
	SUM(CAST(new_deaths AS INT)) AS total_deaths,
	SUM(cast(new_deaths AS INT))/SUM(New_Cases)*100 AS DeathPercentage 
FROM
	PortfolioProject.dbo.CovidDeaths
	WHERE continent IS NOT null
	GROUP BY DATE
	ORDER BY 1,2
