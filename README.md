# Analysis for a Bike-Sharing Company using Machine Learning
 An analysis for a bike-sharing company to better understand how members and casual riders uses the bike and create station clusters to group the different stations using machine learning techniques. 

## Overview
This is a case study for a bike-sharing company that provides bicycles to annual members and casual riders which come as single-ride passes and full-day passes with a fleet of 5,824 bicycles including (Electric, Classic and Docked Bikes) which are located in a network of 692 stations across Chicago. Bicycles can begin at a station and be returned to any station. <br />

## Business Task
The business problems are the following:
* Descriptive Analysis - To understand annual member and casual riders/customers behaviour and preference, i.e the number of trips taken, trip duration, bike type, time and days, start and end stations.
* Geospatial Analysis using K-Means Clustering - Create station clusters to identify and group the different stations based on number of rides ad peak times. The insights gained will aid in planning for station expansion, upgrades and many more.
* Provide recommendations to convert casual riders to annual members.
* Outliers Detection and Analysis - Investigate the outliers in the dataset and analyze the possible causes and provide recommendations.
<br />

I will be providing data-driven recommendations and present the findings with a dashboard using Tableau, a JPG of the dashboard sheets will be provided below.
Check out the Jupyter Notebook for an in-depth breakdown of the codes used in our analysis.


## Methodology
### Python Libraries
The libraries used in this project include:
* Pandas – For storing and manipulating structured data. Pandas functionality is built on NumPy
* Numpy – For multi-dimensional arrays, matrix data structures and, performing mathematical operations
* Datetime -  To extract date and time information
* Folium, Matplotlib and Seaborn – For all visualizations (including maps and graphs)
* Scikit learn - For Machine Learning tasks


## Dataset
The dataset was provided in the Google Data Analytics Capstone Project. It includes a month-month dataset for a year, running from Nov. 2020 - Nov. 2021 in .csv format. Each sheet includes ride information for each month, providing: <br />

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/d7ab47582f8f40033c9e0ee5408c784574d1fd6c/Images/Misc/Screenshot%202023-12-26%20at%2012.24.53%E2%80%AFPM.png)

## Station Clusters
Using k-means clustering, we were able to identify and group stations by demand.
![Alt Text](https://github.com/Lekan-E/Analysis-for-a-Bike-Sharing-Company-using-Multiple-Linear-Regression/blob/bf0613ecb7e5d1889564aa9e5bdc2c7b499d96bd/Images/Misc/Cluster%20of%20Top%20Stations.png)

### Summary
The start station clustering results reveal four distinct clusters, each characterized by the total number of rides and the number of stations within each cluster. Here's a detailed breakdown:

- Cluster 0 [Beige]
Total Ride Count: 1,559,880
Number of Stations: 562
Average Rides per Station: 2,776
- Cluster 1 [Green]
Total Ride Count: 142,720
Number of Stations: 38
Average Rides per Station: 3,755
- Cluster 2 [Red]
Total Ride Count: 3,507,239
Number of Stations: 189
Average Rides per Station: 18,559
- Cluster 3 [Blue]
Total Ride Count: 103,583
Number of Stations: 57
Average Rides per Station: 1,817


Insights:
- Cluster 2 has the highest total ride count and the highest average rides per station, indicating that these stations are the most popular and heavily used in the bike-sharing network.
- Cluster 0 has a substantial total ride count but spread across a large number of stations, suggesting moderate usage across many stations.
- Cluster 1 has relatively fewer stations but a higher average rides per station than Cluster 0, pointing to more concentrated usage at these stations.
- Cluster 3 shows the lowest total ride count and average rides per station, indicating these stations are the least used in the network.

Implications for Bike-Sharing Operations:
Cluster 2 stations might require more maintenance and frequent bike rebalancing due to high usage.
Cluster 0 and Cluster 1 stations might benefit from targeted promotions or infrastructure improvements to balance the load and potentially increase usage.
Cluster 3 stations may need further investigation to understand the low usage and explore ways to enhance their attractiveness or accessibility.

## Recommendations

1. <ins>Create a reward milestone program</ins> - Here users collect points from daily trips. The point collect system will be based of the daily heat map usage shown below. <br/>

Annual Members: 
* 2 points for trips outside peak periods 
* 3 points for trips during peak period

Casual Riders:
* 1 point for trips outside peak periods 
* 2 points for trips during peak period

Riders can use accumulated points for:
* Discounted trips 50%: Members, 5%: Casual Riders
* Get free ride with a friend
* Free 30 minutes rides on public holidays for annual members
* Free 15 minutes rides on public holidays for casual riders

The aim is to convert casual riders by showing them perks of being an annual member whilst also encourage members to renew membership. <br/>

2. <ins>Provide discounted annual rates for signing up outside busy periods </ins>
Based on the yearly ride chart, we can offer casual riders discounted annual rates for new signups and also for renewing annual memberships where we see a hike or drop in the number of rides. <br/>

Casual Riders:
* December and April. Here we have an increased number in usage, and that can potentially be converted into annual members.
* July and September. Here we see a drop in the number of rides, here we can convince them to signup as annual members with a discoutned rate.

Annual Members:
* March and June, here we have an increased number in usage, and that can potentially be converted into annual members.
* November, here we see a drop in the number of rides, here we can convince them to renew as annual members with a discoutned rate.


3. <ins>Members-only bike rental window based on daily heat maps/Bike Preference</ins>

Based on our daily heatmap, we notice a peak period during the weekdays where annual members are using bikes more as compared to casual riders. From that, we give priorty access to our most used bike - classic bike to only members. We make classic bikes exclusively annual members only during the peak periods in the weekday. 


4. <ins>Targeted Advertisment at most used start and end stations during peak periods</ins>

Based on our top 10 casual riders start and destination stations, we run advertisement during peak yearly periods showing the perks of being an annual member and offer discounted rates from signups off the ads. <br/>

A good station for advertisement for casual riders is - Streeter Dr & Grand Ave, because this station is the most popular destination stop for casual riders. <br/>

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/3e42dc6486d81dabeb62ade5985dfed39ee84842/Images/Misc/newplot%20copy%202.png)



## Data Visualization

For this project, we shall be presenting our findings in a Tableau [dashboard](https://public.tableau.com/views/UsersPerformanceDashboardGoogleCapstone/MainDashboard?:language=en-US&:display_count=n&:origin=viz_share_link). We create three dashboards, one to give an overview of all findings, ideal for a staekholder presentation and the other two, a breakdown for annual members and casual riders.

Stakeholder Dashboard:

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Main%20Dashboard.png)

Annual Members Dashboard:

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Members.png)

Casual Riders Dashboard:

![Alt Text](https://github.com/Lekan-E/Comparative-Analysis-Project/blob/main/Images/Dashboard/Casuals.png)

