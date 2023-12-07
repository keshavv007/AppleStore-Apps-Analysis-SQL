# AppleStore-Apps-Analysis-SQL
Exploratory data analysis of AppStore Data using SQL

- Objective : The main goal of this EDA on the Apple store dataset is to gain insight into user behavior, trending categories, and correlations between different variables to understand app rating factors.
- Database used : MySQL <br>
- Dataset from Kaggle consisting of 2 CSV files :-
1. AppleStore.csv <br>
2. AppleStore_Description.csv

## Summary of Analysis
1. What are the top 10 categories that have the most apps in the Apple Store? <br>
   Answer : Top 3 biggest categories of apps are Games, Entertainment and Education.

2. What are the top 5 highest-rated primary genres based on Average_User_Rating?  <br>
Answer : Top 5 categories based on 'Average_User_Rating' are Productivity (4.00), Music (3.97) , Photo & Video (3.80), Business (3.76) and Health & Fitness(3.73).

3. Which category has the highest rating of Paid and Free apps?  <br>
Answer : Paid apps have higher user rating around (3.72) compared to free apps.

4. How does number of language relate to user rating? <br>
Answer : The user rating has positive corelation with supported languages. Apps supporting 10 to 30 languages have better rating.

5. What are the 3 genre that has lowest rating?  <br>
Answer : The genre having least user ratings are Catalogs(2.1), Finance(2.43) and Book(2.47). 

6. Is there a corelation between length of app description and user rating? <br>
Answer : The length of app descreption has positive corelation with user rating. Apps with longer description have higher rating.

