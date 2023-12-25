# Comparative-Analysis-Project
A customer analysis dashboard for a bike-sharing company to better understand how members and casual riders uses the bike and differ.

## Overview
This is a case-study for a bike-sharing company with a fleet of 5,824 bicycles including (Electric, Classic and Docked Bikes) which are located in a network of 692 stations across Chicago. Bicycles can begin at a station and be returned to any station. <br />
The company provides bicycles to annual members and casual riders which come as single-ride passes and full-day passes. <br />

## Businesss Task
The director of marketing has tasked me to come up with strategies aimed at converting exisiting casual riders to annual members. To do that the marketing team needs to better understand riders differ. For us to achieve this, we need to study both customer's needs, behaviours and understand the pattern. <br />
This involves studying:
* Number of Trips
* Duration of Rides
* Time Preference by - Month, Week and Time of Day
* Start and End Station
* Bike Preference
<br />

I will be providng data-driven recommendations and present the findings with a dashboard using Tableau, a JPG of the dashboard sheets will be provided below.
Check out the Jupyter Notebook for an in-depth breakdown of the codes used in our analysis.

## Methodology
### Python Libraries
The libraries used on this project include:
* Pandas – For storing and manipulating structured data. Pandas functionality is built on NumPy
* Numpy – For multi-dimensional array, matrix data structures and, performing mathematical operations
* Datetime -  To extract date and time information
* Plotly, Matplotlib and Seaborn – For all visualizations (including maps and graphs)
* Geopy – To calcuate distance between positions
* Scipy - To check and improve skewness

## Dataset
The dataset was provided in the Google Data Analytics Capstone Project. It includes a month-month dataset for a year, running from Nov. 2020 - Nov. 2021 in .csv format. Each sheet includes ride information for each month, providing:
* A unique ride id - ride_id
* Bike Type - rideable_type
* Start Date and Time - started_at
* End Date and Time - ended_at
* Start Station - start_station_name
* start_station_id
* End Station - end_station_name
* end_Station_id
* Start Station Latitude - start_lat
* Start Station Longitude - start_lng
* End Station Latitude - end_lat
* End Station Longitude - end_lng
* Member Type - member_casual

## Data Preparation
My first step of data preparation was to import all data and combine all into a single table using Pandas import read_csv and concat functions. <br />

![Alt text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Misc/Screenshot%202023-12-24%20at%201.40.47%E2%80%AFPM.png)

We then explore our dataset using the following pandas functions:
* df_months.info() - Display the number of rows, row names and the row type
* df_months.describe() - Get Descriptive stats of the dataframe
* df_months.sample() - Explore rows in the dataframe using sample, to randomize the outcome
* df_months.shape - Get the total number of rows and columns

After data exploration, we begin prepocessing our dataset. <br />

## Data Preprocessing
This process involves creating and extracting new fields from our dataset. We achieved these using the following steps below:
1. Convert 'started_at' and 'ended_at' into a datetime type using pandas function.
2. Calculate 'ride_duration' = 'ended_at' - 'started_at' and convert the field to seconds using datetime function.
3. Extract the start and end times using datetime functions - dt.strftime.
4. Extract the day and month/year name 
5. Given the start and end latitude and longitude, we join them into a list as start and end positions.
6. With the start and end positions, we write a function to calculate each trips distance. <br />

![Alt Text]()

Now we begin data cleaning.

## Data Cleaning
This process is divided into two parts:

* Eliminate bad data:
The conditions we set to filter out bad data is: 
1. Ride Duration <= 0 seconds
2. Trip Distance < 0 kilometers

* Remove outliers:
Our focus on dropping outliers was on the ride durations(s) using the below steps:
1. Plot a box-plot to show the distribution of our time data.
2. Find the appropriate percentile (For this I decided to go with the 95th percentile because it gives a better representation of our data)
3. Get the upper and lower limit
4. Filter out data below the lower limit and above the upper limit.

After data cleaning, we dropped bad data from 5738812 to 5137290 rides.

## Filling NaN values
Another major problem we had was missing values, occurring in the station names and IDs. <br />
To achieved this, I sorted the latitude and longitude values in ascending values, then performed a forward fill.
![Alt Text]()

## Exploratory Data Analysis
Now we have cleaned our dataset, it's time to perform analysis to help use provide data-driven recommendations.

1. Number of Trips
After cleaning our dataset, we have a 
Total Rides -  5,137,290
Annual Members - 2,885,196.
Casual Riders - 2,252,094.

2. Duration of Rides
We show the average ride duration for each rider type.
![Alt Text]()

3. Ride Preference by - Month-Month, Week and Time of Day
## Yearly Trend
Looking at the ride trend line each month of the year in the graph below, we can conclude that the summer months is the peak season.
![Alt Text]()

## Weekly Trend
From the histogram below we see there's a higher usage during the weekends, especially from the casual riders.
![Alt Text]()

## Daily Usage
We use a 24-hr heatmap to show what time of the day riders use the bikes the most.
### Annual Members
![Alt Text]()

### Casual Riders
![Alt Text]()

4. Start and End Station
Here are the most used start and end destinations for trips.

5. Bike Preference







## Data Analysis
Now that our raw dataset has been cleaned, we can start with our data analysis. The analysis will be done for all rides, which is ideal for stakeholders. Then we perform further analysis to study annual members and casual riders.
My aim in the anaysis stage is to answer the following questions:

    1. What is the total number of rides for all trips and by riders type?
    2. On average, how long do riders rent out the bicycles?
    3. What day of the week do riders prefer?
    4. How do riders use the bicycles all year long?
    5. What station are riders choosing to start trips from?
    6. What station are riders choosing as their end destination?
    7. What are the top 10 start and end stations?
    8. Which bicycle type do riders prefer?


You can find all the SQL queries ran to answer these questions here: [SQL Queries](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Cyclistic.sql)


Q1. What is the total number of rides for all trips and by riders type?
Total Rides - 5,738,812
Annaul Members - 3,161,366
Casual Riders - 2,577,446
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/No.%20of%20Rides%20by%20Member.png)
We see that annual members make up about 55% of the total number of rides, while casual 45%.


Q2. On average, how long do riders rent out the bicycles?
All riders have an average duration of about 20 minutes and 8 secs.
Here members spends lesser times of 11:02 while casual riders spend about 31:17.

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/ride%20duration.jpg)

The average ride duration gives us a base to make some assumptions on bike usage on the riders. <br />
Some assumptions we can make from this:
- annual members could be using the bicycles to perform daily tasks, such as commute to work, grocery shopping and as an alternate to having a car.
- While casual riders use for leisure purposes, who spend more time renting bicycles could potentially by tourists exploring the city, moving across various POIs in the city, or just going on casual bike rides with friends.


Q3. What day of the week do riders prefer?
Preferred Day of the Week - Saturday
Annual Members - Wednesday
Casual Riders - Saturday

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/No.%20of%20Rides%20by%20day%20of%20week%20BY%20(cm).png)

This analysis can help back my assumption that:
    - For annual members, we see a consistent usage of bicycles all week long significantly during the weekdays. 
    - Casual riders rent for leisure purposes because a higher percentage of the rides happen during the weekends and we see a notable reduction during the weekday.


Q4. How do riders use the bicycles all year long?

Preferred Month - July
Annual Members - September
Casual Riders - July

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/No.%20of%20Rides%20per%20month.png)

For this analysis, we look at the monthly number of rides through the year. This helps us understand what time of the year or season our riders prefer. 
Generally we see the largest portion of our rides in the summer, accounting for 54.24% of all rides taken all year. This is becauase the weather is much warmer during this period and everyone is out and about then.

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/No.%20of%20Rides%20by%20Month.png)

Looking at the lines for each ride group, the summer months are the preferred season for casual riders. Annual riders also prefer the summer months but we still see more interest all year longas compared to casual riders.


Q5. What station are riders choosing to start trips from?

Preferred Start Station - Lake Shore Dr & Monroe St
Annual Members - Kostner Ave & Lake St 
Casual Riders - Lake Shore Dr & North Blvd

The preferred start station is located along the coastline of Chicago, this is a perfect place to go for a bike ride. But we can further analyze the start station better, according to the rider group.
    - The top start station for members is located inside the city, concluding that majority of the rides are used for day-to-day tasks.
    ![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/(CM)%20top%2010%20start%20-%20members.png)
    - For casual riders, the most used start station is along the beach or coastline.
    ![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/(C)%20top%2010%20start%20-%20casuals.png)


Q6. What station are riders choosing as their end destination?

Preferred Destination Station - Lake Shore Dr & Monroe St
Annual Members - Kedzie Ave & Foster Ave
Casual Riders - Lake Shore Dr & North Blvd

The preferred end station, Lake Shore Dr & Monroe St is also riders preferred start station. We can conclude that it is the company's must used station.

For annual members, the most popular destination, Kedzie Ave & Foster Ave is also located inside the city.
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Top%2010%20End%20-%20Members.png)

But for casual riders, it remaains the same as the start station along the coastline. So a partial assumption we can make is that, most casual riders prefer starting and ending at the same destination station. We need to make further analysis to come to a conclusion.
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/(C)%20Top%2010%20End%20-%20Casuals.png)


Q7. What are the top 10 start and end stations?

Top 10 Start Stations:
Lake Shore Dr & Monroe St
Streeter Dr & Grand Ave
Michigan Ave & Oak St
Wells St & Concord Ln
Clark St & Elm St
Millennium Park
Theater on the Lake
Wells St & Elm St
Clark St & Lincoln Ave
Kingsbury St & Kinzie St
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Start%20Station.png)

Top 10 End Stations:
Lake Shore Dr & Monroe St
Streeter Dr & Grand Ave
Michigan Ave & Oak St
Wells St & Concord Ln
Millennium Park
Clark St & Elm St
Theater on the Lake
Wells St & Elm St
Wabash Ave & Grand Ave
Clark St & Lincoln Ave
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/End%20Station.png)


Q8. Which bicycle type do riders prefer?

Preferred Bike Type - Classic Bike
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Number%20of%20Rides%20by%20Bike%20Type.png)


## Data Visualization

For this project, we shall be presenting our findings in a Tableau [dashboard](https://public.tableau.com/views/UsersPerformanceDashboardGoogleCapstone/MainDashboard?:language=en-US&:display_count=n&:origin=viz_share_link). We create three dashboards, one to give an overview of all findings, ideal for a staekholder presentation and the other two, a breakdown for annual members and casual riders.

Stakeholder Dashboard:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Main%20Dashboard.png)

Annual Members Dashboard:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Members.png)

Casual Riders Dashbaord:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Casuals.png)

## Conclusion/Findings