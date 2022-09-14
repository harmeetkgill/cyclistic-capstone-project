# cyclistic-capstone-project
This repository contains all files and code related to my final capstone project as part of the Google Data Analytics Professional Certificate.

## Introduction

This case study acts as the final capstone project in the Google Data Analytics Professional Certificate. For the purposes of this assignment, I am a Junior Analyst working for Cyclistic, a fictional bike share company located in Chicago. Through this case study, I will follow the steps of the data analysis process – ask, prepare, process, analyze, share, and act.

## Scenario

Cyclistic first launched in 2016 and has now grown to a fleet of 5,824 bikes and 692 stations across Chicago. They offer single-ride passes, full-day passes, and annual memberships. The company’s financial analysts have determined that annual members are more profitable than casual riders, therefore, the Director of Marketing wants to focus on converting casual riders into members. To begin, my team wants to understand the difference between casual riders and annual members.

## Ask

Three questions will guide the future marketing program:
1.	How do annual members and casual riders use Cyclistic bikes differently?
2.	Why would casual riders buy Cyclistic annual memberships?
3.	How can Cyclistic use digital media to influence casual riders to become members?

I have been assigned the first question: How do annual members and casual riders use Cyclistic bikes differently?

#### Business Task
Understand the difference between user types in order to devise a new marketing campaign aimed at converting casual riders into Cyclistic members.

#### Key Stakeholders
Lily Moreno, Director of Marketing
Marketing Analytics Team
Executive Team: approves recommendations

## Prepare

#### Download the data and store it appropriately.
The data has been downloaded from Motivate International Inc., made available under this license. (hyperlink data and license).

#### Identify how the data has been organized.
The data is provided in standard CSV file format, with each file containing monthly data. For this case analysis, 12 months of data was used. There were some anomalies in the data, which were identified and removed in the Analyze phase.

#### Determine the credibility of the data.
Since this data has been provided by the company, it is considered “first party data” that comes from a credible source.

## Process

To process this data for analysis, I used Microsoft Excel, followed by Google BigQuery. Excel was used to quickly filter and sort data, checking for blanks or misspelled items. The bulk of this phase was completed in BigQuery. The completed code (with comments) is included in this repository. 

A brief outline of the cleaning process is as follows:
1.	Uploaded the raw CSV files to Google Cloud Storage
2.	Created a new project in the BigQuery SQL workspace
3.	Joined the datasets of the past 12 months into one dataset
4.	Added two columns: one for ride length in seconds, and one for ride length in minutes
5.	Assessed the data for various possible errors examined
6.	Removed rows where length of trip was less than or equal to 0 seconds

## Analyze

After the Process phase, the data was queried to identify tends and relationships. The code for these queries can be found here. (hyperlink code) For this analysis, I compared the number and length of trips between members and casual riders to see if I could determine a noticeable difference. 

## Share

To visually display the results of BigQuery, I used the 14-day trial of Tableau Cloud, and also created a PowerPoint to share the findings. (link PowerPoint)

Here’s what was discovered:
* Both members and casual riders prefer the classic bike or electric bike to the docked bike
* While members take more trips than casual riders, casual riders’ cycle for much longer rides
* The average trip length for casual riders is approx. 29 minutes; the average trip length for members is approx. 13 minutes
* The number of trips increases as the weather gets warmer, with most rides being taken in the summer months, and the least rides being taken in the winter months
* Casual riders take most trips on the weekends, while members take the most trips during the week, especially from Tuesday to Thursday
    *  This could be because most statuary holidays fall on Mondays and Fridays (if members are commuting to work or school)
    *  Member trip lengths stayed consistent during the week, with longer trips on the weekends

## Act

#### Top three recommendations:
* Primary marketing campaigns should take place in the summer when most rides take place – this will be the prime opportunity to connect with casual riders
* Offer weekend-only or summer-only memberships to entice casual riders to become members during the time that is beneficial to them
* Offer student discounts for those who only commute Monday-Friday, but may only be working part-time, and not wanting to buy memberships for the whole week

#### Next steps:
* Look further into demographic data to see the age, occupation, income levels, etc. of all riders to see if there are underlying differences between members and casual riders
* Conduct customer surveys with specific questions – this will provide better insight into cycling habits and preferences
* Compare data pre-, post-, and during the COVID-19 pandemic to see if attitudes towards bike-sharing have changed
