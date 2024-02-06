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
        -- MySQL, due to file formatting issues google sheets was used as well. 
        -- Tableau
	
    -- clean data
		-- I used different filters to make sure my data did not have any duplicate values for particpants
        -- Added an ID column for primary key
        -- trim/formatted any whitespace that may have been in the data
        -- date coumn had to be formatted correctly for MySQL formatting ('YYYY- MM- DD')
	

    
