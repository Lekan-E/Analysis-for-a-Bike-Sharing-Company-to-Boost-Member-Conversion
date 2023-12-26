# Comparative-Analysis-Project
A customer analysis study for a bike-sharing company to better understand how members and casual riders uses the bike and provide recommendations to convert casual riders to annual members.

## Overview
This is a case-study for a bike-sharing company that provides bicycles to annual members and casual riders which come as single-ride passes and full-day passes with a fleet of 5,824 bicycles including (Electric, Classic and Docked Bikes) which are located in a network of 692 stations across Chicago. Bicycles can begin at a station and be returned to any station. <br />

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
The dataset was provided in the Google Data Analytics Capstone Project. It includes a month-month dataset for a year, running from Nov. 2020 - Nov. 2021 in .csv format. Each sheet includes ride information for each month, providing: <br />

![Alt Text]()

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

1. Eliminate bad data:
The conditions we set to filter out bad data is: 
* Ride Duration <= 0 seconds
* Trip Distance < 0 kilometers

2. Remove outliers:
Our focus on dropping outliers was on the ride durations(s) using the below steps:
* Plot a box-plot to show the distribution of our time data.
* Find the appropriate percentile (For this I decided to go with the 95th percentile because it gives a better representation of our data)
* Get the upper and lower limit
* Filter out data below the lower limit and above the upper limit.

After data cleaning, we dropped bad data from 5,738,812 to 5,137,290 rides ~ 10.48% of bad data dropped.

## Filling NaN values
Another major problem we had was missing values, occurring in the station names and IDs. <br />
To achieved this, I sorted the latitude and longitude values in ascending values, then performed a forward fill.
![Alt Text]()

## Exploratory Data Analysis/ Findings
Now that our raw dataset has been cleaned, we can start with our data analysis. <br/>
The analysis will be done for all rides, which is ideal for stakeholders. Then we perform further analysis to study annual members and casual riders.
My aim in the anaysis stage is to answer the following questions:

    1. What is the total number of rides for all trips and by riders type?
    2. On average, how long do riders rent out the bicycles?
    3. How do riders use the bicycles all year long?
    4. What day of the week do riders prefer?
    5. What time of the day do riders rent the most?
    6. What are the top 10 start and end stations?
    7. Which bicycle type do riders prefer?


### 1. Number of Trips 
After cleaning our dataset, we have: <br/>
Total Rides -  5,137,290 <br/>
Annual Members - 2,885,196 <br/>
Casual Riders - 2,252,094 <br/>

### 2. Duration of Rides 
We show the average ride duration for each rider type. <br/>
Total Average Ride Duration - 17:38 <br/>
Annual Members - 12:57 <br/>
Casual Riders - 21:20 <br/>
![Alt Text]()

### 3. Ride Preference by - Month-Month, Week and Time of Day 

Yearly Trend <br/>

For this analysis, we look at the monthly number of rides through the year. This helps us understand what time of the year or season our riders prefer. Looking at the lines for each ride group, the summer months are the preferred season for casual riders. Annual riders also prefer the summer months but we still see more interest all year long compared to casual riders. This is becauase the weather is  warmer during this period and everyone is out and about during this period. <br/>

Preferred Month - July<br/>
Annual Members - September<br/>
Casual Riders - July<br/>

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/No.%20of%20Rides%20by%20Month.png)

Weekly Trend <br/>
From the histogram below we see there's a higher usage during the weekends, especially from the casual riders. <br/>

![Alt Text]()

Preferred Day of the Week - Saturday <br/>
Annual Members - Wednesday <br/>
Casual Riders - Saturday <br/>

This analysis can help back my assumption that:
* For annual members, we see a consistent usage of bicycles all week long significantly during the weekdays. 
* Casual riders rent for leisure purposes because a higher percentage of the rides happen during the weekends and we see a notable reduction during the weekday.


Daily Usage <br/>
We use a 24-hr heatmap to show what time of the day riders use the bikes the most. <br/>
From our annual member heatmap below, we can see a pattern: <br/>
Weekdays - Moderate usage in the morning (6:00 - 9:00am) and a high usage (3:00 - 7pm) <br/>
Weekends - Moderate usage (10:00am - 7pm) <br/>
![Alt Text]()

For casual riders: <br/>
Weekdays - Moderate usage (4:00pm - 8:00pm) <br/>
Weekends - High usage (10:00am - 8:00pm) <br/>
![Alt Text]()

4. Start and End Station <br/>
Here are the most used start and end destinations for trips. <br/>

Top 10 Start Stations <br/>
1. Streeter Dr & Grand Ave	
2. Wells St & Hubbard St
3. Wells St & Concord Ln
4. Clark St & Elm St
5. Michigan Ave & Oak St
6. Millennium Park	
7. Wells St & Elm St
8. Theater on the Lake
9. Rockwell St & 57th St
10. Campbell Ave & 51st St

![Alt Text]()

Top 10 End Stations <br/>
1. Streeter Dr & Grand Ave	
2. Wells St & Concord Ln	
3. Michigan Ave & Oak St	
4. Clark St & Elm St	
5. New St & Illinois St
6. Millennium Park	
7. Wells St & Elm St	
8. Wells St & Hubbard St	
9. Maplewood Ave & 59th St	
10. Theater on the Lake

![Alt Text]()

5. Bike Preference

Preferred Bike Type - Classic Bike <br/>
Here's a chart showing bike preference amongst various users. We can see the Classic Bike is the most used and preferred bike type.

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Number%20of%20Rides%20by%20Bike%20Type.png)


## Recommendations

1. Create a reward milestone program - Here users collect points from daily trips. The point collect system will be based of the daily heat map usage shown below. <br/>

Annual Members: <br/>
2 points for trips outside peak periods <br/>
3 points for trips during peak period. <br/>

![Alt Text]()

Casual Riders:
1 point for trips outside peak periods <br/>
2 points for trips during peak period. <br/>

![Alt Text]()

Riders can use accumulated points for:
* Discounted trips 50%: Members, 5%: Casual Riders
* Get free ride with a friend
* Free 30 minutes rides on public holidays for annual members
* Free 15 minutes rides on public holidays for casual riders

The aim is to convert casual riders by showing them perks of being an annual member whilst alos encourage members to renew membership. <br/>

2. Provide discounted annual rates for signing up outside busy periods 
Based on the yearly ride chart, we can offer casual riders discounted annual rates for new signups and also for renewing annual memberships where we see a hike or drop in the number of rides. <br/>
Using the plot below, we can offer these promotions to:
Casual Riders:
* December and April. Here we have an increased number in usage, and that can potentially be converted into annual members.
* July and September. Here we see a drop in the number of rides, here we can convince them to signup as annual members with a discoutned rate.

Annual Members:
* March and June, here we have an increased number in usage, and that can potentially be converted into annual members.
* November, here we see a drop in the number of rides, here we can convince them to renew as annual members with a discoutned rate.


3. Members-only bike rental window based on daily heat maps/Bike Preference

Based on our daily heatmap, we notice a peak period during the weekdays where annual members are using bikes more as compared to casual riders. From that, we give priorty access to our most used bike - classic bike to only members. We make classic bikes exclusively annual members only during the peak periods in the weekday. 


4. Targeted Advertisment at most used start and end stations during peak periods

Based on our top 10 casul riders start and destination stations, we run advertisement during peak yearly periods showing the perks of being an annual member and off discounted rates from signups off the ads.




## Data Visualization

For this project, we shall be presenting our findings in a Tableau [dashboard](https://public.tableau.com/views/UsersPerformanceDashboardGoogleCapstone/MainDashboard?:language=en-US&:display_count=n&:origin=viz_share_link). We create three dashboards, one to give an overview of all findings, ideal for a staekholder presentation and the other two, a breakdown for annual members and casual riders.

Stakeholder Dashboard:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Main%20Dashboard.png)

Annual Members Dashboard:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Members.png)

Casual Riders Dashbaord:
![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Casuals.png)

## Conclusion/Findings