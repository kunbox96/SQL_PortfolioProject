USE PortfolioProject
GO

-- Select all the data from Covid Death Table
SELECT * FROM CovidDeaths
WHERE location LIKE 'Vanua%'

-- Select the data we need only
SELECT continent, location, date, total_cases, total_deaths, population FROM CovidDeaths

-- Looking at Death Percentage by Date
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS 'Death Percentage' FROM CovidDeaths 

-- Looking at Total Death Percentage location
SELECT location, MAX(total_deaths) 'Highest Deaths', MAX(total_cases) 'Highest Cases', MAX(total_deaths)/MAX(total_cases)*100 AS 'Total Death Percentage' FROM CovidDeaths
GROUP BY location
ORDER BY [Total Death Percentage] DESC

-- LOOKING AT THE HIGHEST DEATH COUNT BY COUNTRIES
SELECT location, MAX(CAST(total_deaths AS INT)) AS 'Highest Death'
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 2 DESC

-- LOOKING AT THE HIGHEST DEATH COUNT BY CONTINENT
SELECT location, MAX(CAST(total_deaths AS INT)) AS 'Highest Death'
FROM CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY 2 DESC