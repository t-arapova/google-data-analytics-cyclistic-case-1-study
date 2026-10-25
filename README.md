# Cyclistic Bike-Share Analysis: Converting Casual Riders to Annual Members
**Google Data Analytics Capstone Project**

# Project Overview
Cyclistic is a bike-share company in Chicago. The marketing director believes that maximizing the number of annual members is key to future growth. 

The goal of this analysis is to understand *how annual members (`member`) and casual riders (`casual`) use Cyclistic bikes differently*, in order to design a targeted marketing strategy to convert casual riders into annual members.

---

# Tech Stack & Methodology
**Data Processing & Analytics:** Google BigQuery (SQL)
**Dataset Size:** ~5.95 Million cleaned records (12 months of historical trip data)
**Data Visualizations:** Tableau Public (Interactive Dashboard)
**Framework:** Google 6-Step Data Analysis Process (*Ask, Prepare, Process, Analyze, Share, Act*)

---

# Data Cleaning & Engineering (SQL)
Using **Google BigQuery**, the dataset was audited and cleaned to handle anomalies and calculate business features:
1. **Chronological Validity:** Removed negative or zero-duration trips (`started_at < ended_at`).
2. **Outlier Filtering:** Filtered out false-start trips shorter than 60 seconds and missing/stolen bikes exceeding 24 hours (`DATETIME_DIFF`).
3. **Data Quality:** Excluded internal system test stations (`LIKE '%TEST%'`).
4. **Deduplication:** Applied window functions (`QUALIFY ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) = 1`) to eliminate duplicate trip entries.
5. **Feature Engineering:** Extracted `ride_length_minutes` and categorized trips by `day_of_week` and `start_hour`.

---

#  Key Analytical Insights
* **Trip Duration:** Casual riders ride **~50% longer per trip** (avg **18.41 minutes**) compared to annual members (avg **12.21 minutes**).
* **Weekly Usage:** 
  * **Members** dominate weekday commuting (**Tuesday–Thursday peaks** with over 610K rides/day).
  * **Casual riders** peak heavily on weekends, with **Saturday reaching maximum volume** (438K+ rides).
* **Hourly Peaks:** 
  * **Members** display a classic bimodal commuting distribution with sharp peaks at **8:00 AM** and **5:00 PM**.
  * **Casual usage** grows steadily throughout the day, peaking during afternoon leisure hours (12:00 PM – 5:00 PM).
* **Station Geography:** 
  * Top casual stations are 100% recreational and tourist locations (**Navy Pier**, **Millennium Park**, **DuSable Lake Shore Dr**).
  * Top member stations align with major commuter transit hubs (**Canal St & Madison St**, **Clinton St** near rail stations).

---

#  Business Recommendations (Act Phase)
1. **Location-Targeted Promotions:** Launch digital and on-site conversion campaigns at top casual stations (*Navy Pier*, *Millennium Park*) strictly during weekend peak hours (Friday–Sunday).
2. **Leisure / Weekend Pass:** Introduce a specialized seasonal weekend membership tier to capture casual riders who ride frequently on Saturdays without committing to a full annual commuter pass.
3. **In-App Savings Notifications:** Send automated push notifications after casual rides >15 minutes on weekends, displaying personalized cost-savings if they convert to an annual plan.

---

#  Project Links & Assets
* **Interactive Tableau Dashboard:** [View Dashboard on Tableau Public] (https://public.tableau.com/views/CyclisticCaseStudy-B/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
* **SQL Data Cleaning & Analysis Script:** [View SQL Queries](./cyclistic_data_cleaning_and_analysis.sql)
