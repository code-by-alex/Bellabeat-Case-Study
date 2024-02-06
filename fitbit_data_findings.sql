-- what would I want to show the Bellabeat Stakeholders


-- ASK

-- What is the problem that I am trying to solve?

	-- Analyzing competiitor fitness device data to find insights that might be able to benefit usage of Bellabeat's products. 
    -- Bellabeat wants to know variables that could be used in their marketing of products
    
    
-- How can these insights drive business decisions? 
	-- Being able to understand how customers use competitor products can help improve Bellabeats own devices.
    -- knowing what type of data the fitbit tacks may help Bellabeat products know what their competitors are doing. 
    
    
-- PREPARE
	-- I will be analyzign a public dataset that explores smart device users' daily habits. FitBit Fitness Tracker Data (CC0: Public Domain, dataset made available through Mobius): This Kaggle data set contains personalfitness tracker from thirty fitbit users. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and hea  rate that can be used to explore users’ habits.
    
    -- For this case study I did not look at all 18 CSV files, the core tables were daily_activity, hourly_calories, hourly_steps, and sleep. 
    
    -- LIMITATIONS OF DATA
		-- There are only 33 particpants to analyze in this case study. This is very low but still acceptable to gather insights from. 
        -- The demograpghic of the participants is not known (age, sex, weight, etc.)
        -- Users may not wear their device at all times so data might not be tracked when device is not worn. 
        
-- PROCESS
	-- tools used:
		-- Excel
        -- Google sheets
        -- MySQL
        -- Tableau
	
    -- clean data
		-- I used different filters to make sure my data did not have any duplicate values for particpants
        -- Added an ID column for primary key
        -- trim/formatted any whitespace that may have been in the data
        -- date coumn had to be formatted correctly for MySQL formatting ('YYYY- MM- DD')
        
        
-- ANALYZE 
	-- Refer to fitbit_data.sql page to review code used to gather insights
    -- Refer to Google Slide Deck to review each phase of the Case study
    
    
-- SHARE


-- 1. **Weekday Afternoons Activity (5-7pm):** Users tend to be more active during weekday afternoons, possibly indicating they're moving around after work. This could imply that people are engaging in exercise or other physical activities after their workday, which is a valuable insight for designing fitness programs or marketing campaigns targeting this time frame.

-- 2. Saturdays Activity (1pm): Saturdays see a significant amount of activity, particularly around 1pm, suggesting that users are more active during this time compared to weekdays. This could be due to people having more free time on weekends to engage in leisure activities or exercise.

-- 3. Sleep Tracking Data: A large number of participants did not wear their devices to track sleep. There could be several reasons for this, such as discomfort wearing the device while sleeping, forgetting to wear it, or deliberately choosing not to track sleep. Understanding why users are not tracking sleep could help improve the design or functionality of the device to encourage more consistent usage.

-- 4. Similarity to Fitbit Data: The data suggests that Bellabeat customer data is similar to Fitbit data, indicating potential overlap in their target markets or user demographics. This similarity opens up opportunities for Bellabeat to leverage insights and marketing strategies similar to those of Fitbit, possibly by offering comparable products or targeting similar customer segments.

-- Overall, these insights provide valuable information for understanding user behavior and preferences, which can inform product development, marketing strategies, and customer engagement efforts.
	
    
-- ACT


-- These trends can influence Bellabeat's marketing strategy in several ways:

-- 1. Targeted Messaging: Highlighting the device's ability to track activity during peak times like weekday afternoons and Saturdays can resonate with users looking to optimize their fitness routines.

-- 2. Weekend Promotions: Offering special promotions or challenges on Saturdays to capitalize on increased activity levels during this time.

-- 3. Sleep Tracking Promotion: Encouraging sleep tracking by addressing potential barriers, such as discomfort or forgetfulness, and emphasizing the importance of sleep for overall health and wellness.

-- 4. Competitive Positioning: Leveraging similarities with Fitbit data to position Bellabeat as a comparable or alternative option, especially if targeting similar demographics or market segments.

-- 5. Content Strategy: Creating content or resources tailored to users' activity patterns, such as workout tips for weekday evenings or weekend fitness challenges.

-- By aligning marketing efforts with these trends, Bellabeat can better engage users, drive product adoption, and differentiate itself in the competitive wearable tech market.

    
