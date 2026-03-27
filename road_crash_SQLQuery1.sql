create database RoadACident


-- Quick Data Check



SELECT TOP 10 *
FROM Crash_Data;

--Just confirm everything looks good

-- CORE ANALYSIS (MUST DO)
--Total Accidents
SELECT COUNT(*) AS Total_Accidents
FROM Crash_Data;

--Accidents by State
SELECT State, COUNT(*) AS Total
FROM Crash_Data
GROUP BY State
ORDER BY Total DESC;

-- Insight: Which state is most risky

-- Accidents by Time of Day
SELECT Time_of_day, COUNT(*) AS Total
FROM Crash_Data
GROUP BY Time_of_day
ORDER BY Total DESC;

-- VERY IMPORTANT insight

-- Speed Limit Risk
SELECT Speed_Limit, COUNT(*) AS Total
FROM Crash_Data
GROUP BY Speed_Limit
ORDER BY Total DESC;
--Shows dangerous speed zones

--Crash Type Analysis

SELECT Crash_Type, COUNT(*) AS Total
FROM Crash_Data
GROUP BY Crash_Type
ORDER BY Total DESC;

-- Gender Analysis
SELECT Gender, COUNT(*) AS Total
FROM Crash_Data
Group by Gender
ORDER BY Total DESC;

-- Age Group Risk
SELECT Age_Group, COUNT(*) AS Total
FROM Crash_Data
GROUP BY Age_Group
ORDER BY Total DESC;


-- INTERMEDIATE (THIS MAKES YOU STAND OUT)
--Weekend vs Weekday
SELECT 
    CASE 
        WHEN Day_of_week IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    COUNT(*) AS Total
FROM Crash_Data
GROUP BY 
    CASE 
        WHEN Day_of_week IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END;

--OR

SELECT 
Day_of_week,COUNT(*) AS Total
FROM Crash_Data
GROUP BY Day_of_week

-- Night vs Day Risk
SELECT 
    CASE 
        WHEN Time_of_day = 'Night' THEN 'Night'
        ELSE 'Day'
    END AS Period,
    COUNT(*) AS Total
FROM Crash_Data
GROUP BY 
    CASE 
        WHEN Time_of_day = 'Night' THEN 'Night'
        ELSE 'Day'
    END;

-- Holiday Effect 
SELECT 
    Christmas_Period,
    COUNT(*) AS Total
FROM Crash_Data
GROUP BY Christmas_Period;


CREATE VIEW vw_Crash_Master AS
SELECT
    Crash_ID,
    State,
    Year,
    Month,
    
    -- Clean Day Type
    Day_of_week,
    CASE 
        WHEN Day_of_week IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,

    -- Time Analysis
    Time,
    Time_of_day,
    CASE 
        WHEN Time_of_day = 'Night' THEN 'Night'
        ELSE 'Day'
    END AS Day_Night,

    -- Crash Info
    Crash_Type,
    Road_User,

    -- Vehicle Involvement
    Bus_Involvement,
    Heavy_Rigid_Truck_Involvement,
    Articulated_Truck_Involvement,

    -- Speed Analysis
    Speed_Limit,
    CASE 
        WHEN Speed_Limit < 60 THEN 'Low Speed'
        WHEN Speed_Limit BETWEEN 60 AND 90 THEN 'Medium Speed'
        ELSE 'High Speed'
    END AS Speed_Category,

    -- Demographics
    Gender,
    Age,
    Age_Group,

    -- Holiday Impact
    Christmas_Period,
    Easter_Period

FROM Crash_Data;