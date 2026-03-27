Australia Road Accident Analysis Dashboard

This project analyzes road accident data in Australia using Excel, SQL Server, and Power BI. 

Overview
- Dataset: Australian road accidents, 2016–2023
- Tools: Power Query, SQL Server, Power BI
- Objective: Clean, analyze, and visualize accident trends to identify risk patterns

Data Cleaning & Transformation
- Handled missing values in Speed_Limit and Age columns
- Standardized column names and formats
- Categorized age groups, day types (Weekday/Weekend), and speed risk

SQL
- Loaded cleaned data into SQL Server (`Crash_Data` table)
- Created a master view (`vw_Crash_Master`) for Power BI
- Used SQL queries to explore accident patterns

Power BI Dashboard
- Visuals include:
  - Accidents by State
  - Accidents by Time of Day
  - Speed Limit Risk
  - Age Group & Gender Analysis
  - Crash Type Distribution
- Added KPIs and interactive slicers for State, Year, Gender, and Time of Day
- Key insights highlighted with Smart Narratives and Cards

Key Insights
- Evening hours show highest accident frequency
- High speed zones have increased accident risk
- Younger age groups are more involved in crashes
- Certain states have higher accident counts, suggesting regional risk differences

How to Use
1. Open `Road_Accident_Dashboard.pbix` in Power BI
2. Connect to SQL Server or use the provided CSV
3. Explore visuals and interactive filters

