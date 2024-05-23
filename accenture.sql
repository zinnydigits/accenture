-- Accentuate Virtual Internship

DROP TABLE IF EXISTS contents;
CREATE TABLE contents (
	serial_no	INT,
	content_id	VARCHAR(100),
	user_id	VARCHAR(100),
	type VARCHAR(100),
	category VARCHAR(100),
	url VARCHAR(100)
);

-- import file // file imported

SELECT * FROM contents;

DROP TABLE IF EXISTS reaction_types;
CREATE TABLE reaction_types (
	serial_no INT,
	type VARCHAR(50),
	sentiment VARCHAR(50),
	score INT
);

-- import reation_types file

SELECT * FROM reaction_types;

DROP TABLE IF EXISTS reaction;
CREATE TABLE reaction (
	serial_no INT,
	content_id VARCHAR(50),
	user_id VARCHAR(50),
	type VARCHAR(50),
	datetime VARCHAR(50)
);

-- import reaction file
SELECT * FROM reaction;

-- DATA CLEANING

DELETE FROM contents
WHERE category IS NULL;
-- 0 record deleted

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
-- 0 record deleted

ALTER TABLE reaction
DROP user_id;

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


SELECT c.content_type, rt.sentiment, COUNT(rt.sentiment)
	FROM contents c
JOIN reaction r
	ON c.content_id = r.content_id
JOIN reaction_types rt
	ON r.type = rt.type
GROUP BY c.content_type, rt.sentiment;