
-- Confirm data imported

SELECT * FROM Covidata1;

--- Select fields of interest
SELECT  location, date, population, life_expectancy, gdp_per_capita, total_cases, total_deaths, new_cases, hosp_patients, icu_patients 
FROM Covidata1 ORDER BY 1,2;

--  Likelyhood of dying from Covid-19 infection
SELECT  location, date, total_cases, total_deaths, (total_deaths/total_cases)*100  AS Death_cases  FROM Covidata1;

-- Likelyhood of dying from Covid-19 infection across the G7 nations starting with highest percentage death
SELECT  location, AVG(total_deaths/total_cases)*100  AS Death_cases FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Death_cases) DESC;


-- Percentage of population that died of Covid  across G7 nations
SELECT  location, AVG(total_deaths/population)*100  AS Population_death  FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Population_death) DESC;

--Percentage of population infected with Covid across G7 nations
SELECT  location, AVG(total_cases/population)*100  AS Population_cases  FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Population_cases) DESC;

--Total covid cases recorded across G7 nations
SELECT  location, AVG(total_cases)  AS Covid_infections FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Covid_infections) DESC;

--Total covid related deaths recorded across G7 nations
SELECT  location, AVG(total_deaths)  AS Covid_deaths FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Covid_deaths) DESC;

--Percentage of Fully vaccinated population across G7 nations
SELECT  location, AVG(people_fully_vaccinated/population)*100  AS Fully_vacinated  FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Fully_vacinated) DESC;


--Percentage of vaccinated population across G7 nations
SELECT  location, AVG(people_vaccinated/population)*100  AS Vaccinated  FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Vaccinated) DESC;

--Percentage of vaccinated population not fully vacinated
SELECT  location, AVG((people_vaccinated - people_fully_vaccinated)/people_vaccinated)*100  AS Not_fully_vaccinated  FROM Covidata1 
WHERE location IN ('France', 'Germany', 'Italy', 'Japan', 'Canada', 'United Kingdom', 'United States') GROUP BY location
ORDER BY (Not_fully_vaccinated) DESC;


