


CREATE OR REPLACE VIEW v_HCP_Call_Plan_Segmentation AS
    WITH RankedHCPs AS (
        -- Calculate the running total of prescriptions
        SELECT 
            NPI,
            First_Name,
            Last_Name,
            City,
            State,
            Total_Prescriptions,
            SUM(Total_Prescriptions) OVER (ORDER BY Total_Prescriptions DESC) AS Running_Total_Rx,
            SUM(Total_Prescriptions) OVER () AS Grand_Total_Rx
        FROM hcp_cardiology_master
    ),
PctCalculated AS (
    -- Calculate what percentage of the total market this doctor represents
    SELECT 
        *,
        (Running_Total_Rx / Grand_Total_Rx) AS Cumulative_Pct
    FROM RankedHCPs
)
-- Assigning the Tiers based on the 80/15/5 Pareto Principle
SELECT 
    NPI,
    First_Name,
    Last_Name,
    City,
    State,
    Total_Prescriptions,
    CASE 
        WHEN Cumulative_Pct <= 0.80 THEN 'A'
        WHEN Cumulative_Pct <= 0.95 THEN 'B'
        ELSE 'C'
    END AS Segment_Tier
FROM PctCalculated;


-- STEP 4: QUALITY CONTROL & BUSINESS INSIGHT
-- Checking the distribution of your newly created segments
SELECT 
    Segment_Tier,
    COUNT(NPI) AS Total_Doctors,
    SUM(Total_Prescriptions) AS Total_Rx_Volume
FROM v_HCP_Call_Plan_Segmentation
GROUP BY Segment_Tier
ORDER BY Segment_Tier;

