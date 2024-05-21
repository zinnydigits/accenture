## About This Project

### Accenture North America Data Analytics and Visualization Job Simulation

Welcome to the documentation repository for my project completed as part of the Accenture Data Analytics and Visualization job simulation on the Forage platform in May 2024. This simulation provided an insightful experience into the role of a Data Analyst at Accenture, focusing on advising a hypothetical social media client.

Social Buzz, a company in the Social Media and Content Creation industry, needs help in upscaling. The company has over 500 million active members monthly and above 100,000 pieces of content. They seek to know the top 5 popular categories and best data practices for their IPO.



### Project Overview

In this project, I undertook the following tasks:
- **Data Cleaning and Preparation:** Cleaned and prepared content, reaction, and reaction_type datasets to ensure data integrity and accuracy for analysis.
- **Data Modeling and Analysis:** Modeled and analyzed the datasets to uncover insights into content trends and inform strategic decisions for the client.
- **Data Visualization:** Created visualizations to effectively communicate key insights.
- **Presentation:** Prepared a PowerPoint deck and a video presentation to communicate findings to both the client and internal stakeholders.


### Key Insights

The analysis provided valuable insights into content trends, helping the client make informed strategic decisions. The key takeaways from this project included:
- Most Popular Categories: Animal Category, Sciehce Category, Healthy Eating Category, Technology Category and Food Category.
- Trends in content engagement: Users engage the most at 6pm daily, on Mondays weekly, and during the month of May. Saturdays have the least engagement by weekday, as do 12pm and February.
- Optimal posting times: Optimal posting time was found to be 6pm, and the optimal day is Monday.
- Content type performance: The 4 content types are doing well, but photos are most preferred, followed by videos, GIFs, and lastly audios.

### Skills Utilized

Throughout this project, I applied and further developed various skills, including:
- **Data Cleaning and Preparation:** Using SQL and Excel to clean and prepare data for analysis.
- **Data Analysis:** Leveraging data analytics tools to derive meaningful insights.
- **Data Visualization:** Creating impactful visualizations using line charts, pie charts, bar charts, and column charts.
- **Presentation:** Crafting clear and compelling presentations to convey insights effectively.

### SQL Scripts

#### Table Creation & Data Cleaning

```sql

DROP TABLE IF EXISTS contents;
CREATE TABLE contents (
    serial_no INT,
    content_id VARCHAR(100),
    user_id VARCHAR(100),
    type VARCHAR(100),
    category VARCHAR(100),
    url VARCHAR(100)
);

-- Import file
SELECT * FROM contents;

DROP TABLE IF EXISTS reaction_types;
CREATE TABLE reaction_types (
    serial_no INT,
    type VARCHAR(50),
    sentiment VARCHAR(50),
    score INT
);

-- Import reaction_types file
SELECT * FROM reaction_types;

DROP TABLE IF EXISTS reaction;
CREATE TABLE reaction (
    serial_no INT,
    content_id VARCHAR(50),
    user_id VARCHAR(50),
    type VARCHAR(50),
    datetime VARCHAR(50)
);

-- Import reaction file
SELECT * FROM reaction;

-- DATA CLEANING

DELETE FROM contents
WHERE category IS NULL;
-- 0 records deleted

UPDATE contents
SET category = INITCAP(category);

ALTER TABLE contents
DROP COLUMN url;

ALTER TABLE contents
RENAME COLUMN type TO content_type;

DELETE FROM reaction
WHERE type IS NULL;
-- 980 records deleted

DELETE FROM reaction_types
WHERE score IS NULL;
-- 0 records deleted

ALTER TABLE reaction
DROP COLUMN user_id;
```

#### Finding the Top 5 Popular Categories

```sql
-- Top 5 Popular Category
SELECT c.category AS Category, SUM(rt.score) AS SCORE
FROM contents c
    JOIN reaction r
    ON c.content_id = r.content_id
    JOIN reaction_types rt
    ON rt.type = r.type
GROUP BY category
ORDER BY SUM(rt.score) DESC
LIMIT 5;
```

#### Analyzing Sentiment by Content Type

```sql
-- Finding the Top 5 Categories
SELECT 
    c.content_type, 
    rt.sentiment, 
    COUNT(rt.sentiment) AS sentiment_count
FROM 
    contents c
JOIN 
    reaction r ON c.content_id = r.content_id
JOIN 
    reaction_types rt ON r.type = rt.type
GROUP BY 
    c.content_type, 
    rt.sentiment
ORDER BY 
    c.content_type, 
    rt.sentiment;
```

### Excel Functions

#### Finding Most Active Time from Datetime

- **Extract Hour from Datetime:**

  ```excel
  =HOUR(A2)
  =COUNTIF(B:B, D2)
  =MAX(E:E)
  ```

### Repository Contents

This repository contains the following:
- **Data:** The cleaned datasets used for analysis.
- **SQL Scripts:** Scripts for data cleaning, analysis, and finding top categories.
- **Excel Functions:** Examples of Excel functions used for data manipulation.
- **Visualizations:** Visual representations of the data and key insights.
- **Presentation:** The PowerPoint deck created for the client.

Thank you for visiting my project repository. I hope you find the documentation informative and insightful. Feel free to reach out if you have any questions or feedback!
```
