CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1
UNION ALL
SELECT * FROM appleStore_description2
union ALL
SELECT * FROM appleStore_description3
UNION ALL 
SELECT * FROM appleStore_description4

**Exploratory Data Analysis (EDA)**  

--Check the number of unique apps in both tablesAppleStoreAppleStore1
SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROm AppleStore1

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROm appleStore_description_combined

--check for any missing values imn key fieldsAppleStoreAppleStore1

SELECT COUNT(*) AS MissingValues
FROM AppleStore1
WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL;

SELECt COUNT(*) AS MissingValues
FROm appleStore_description_combined
WHERE track_name IS NULL;

--Find out the number of apps per genre

SELECt prime_genre, COUNT(*) AS AppsByGenre
FROm AppleStore1
GROUP BY prime_genre
ORDER BY AppsByGenre DESC;

--Get an overview of the apps ratings

SELECT min(user_rating) AS MinRating,
       max(user_rating) AS MaxRating,
       Avg(user_rating) AS AvgRating, 
       prime_genre
FROM AppleStore1
GROUP BY prime_genre
ORDEr BY AvgRating DESC;

-- Determine if paid apps have higner ratings than free apps

SELECt CASE
            WHEN price > 0 THEN 'Paid'
            ELSE 'Free'
            END AS AppType,
            avg(user_rating) AS Avg_Rating
FROM AppleStore1
Group BY AppType
ORDER BY AppType;

--Check if apps with more languages have Better rating

SELECt CASE
       WHEN lang_num < 10 THEN '<10 Languages'
       WHEN lang_num BETWEEN 10 and 30 THEn '10-30 Languages'
       ELSE '>30 Languages'
       End AS language_count,
       AVG(user_rating) AS Avg_Rating
FROM AppleStore1
GROUP BY Language_count
ORDER BY Avg_Rating DESC;

--Check genres with low ratings

SELECT prime_genre, 
avg(user_rating) AS Avg_Rating
FROM AppleStore1
GROUP BY prime_genre
ORDER BY Avg_Rating;

--Check if there is correlation between the length of app rating and user review

SELECT CASE
           WHEN length(b.app_desc) < 300 THEN 'Short'
           WHEN length(b.app_desc) BETWEEn 300 AND 500 THEN 'Medium'
           ELSE 'Long' 
           END AS descreption_length_bucket,
           AVG(user_rating) AS Avg_Rating

FROM AppleStore1 AS a
JOIN appleStore_description_combined AS b
ON a.id = b.id
GROUP BY descreption_length_bucket
ORDER BY Avg_Rating DESC;

--Top rated apps for each genre

SELECT user_rating, 
       prime_genre,
       track_name
FROM (
      SELECT
      user_rating,
      prime_genre,
  	  track_name,
  RANK() OVER(PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
  FROM AppleStore1
  ) AS a
  WHERE
  a.rank = 1;
  
  