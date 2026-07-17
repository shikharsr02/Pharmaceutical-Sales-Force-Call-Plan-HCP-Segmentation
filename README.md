# Pharmaceutical Sales Force Call Plan Optimization

## Business Objective
Field sales representatives represent one of the highest operational expenditures in the pharmaceutical industry. The objective of this project is to model a data-driven commercial strategy that optimizes sales force capacity. By analyzing the prescription volumes of over 23,000 Healthcare Professionals (HCPs), I engineered an end-to-end SQL and Power BI solution that segments doctors based on market share and automatically generates a prioritized field-visit roster. 

**Goal:** Eliminate wasted sales rep capacity on low-yield targets and redirect focus to Key Opinion Leaders (KOLs) to maximize ROI.

## Tech Stack & Architecture
*   **Database:** MySQL (Data ingestion, structuring, and cleaning)
*   **Business Logic:** Advanced SQL (Utilized Window Functions like `SUM() OVER()` to calculate running totals and cumulative market share for Pareto-based A/B/C segmentation)
*   **Data Visualization:** Power BI
*   **Capacity Modeling:** DAX (Engineered custom measures to assign targeted annual visit frequencies based on dynamic tiering)

## Key Commercial Insights
1.  **The Operational Bottleneck:** The data revealed that a massive segment of the market (Tier C) contributes to a negligible fraction of total prescription volume, yet traditionally consumes equal sales rep time.
2.  **The "Gold Mine" Target:** Identified ~10,600 Tier A physicians who drive the vast majority of the 82M+ annual prescriptions. 
3.  **Capacity Optimization Model:** Engineered a strict Call Plan matrix: 
    *   **Tier A:** 24 visits/year (Maximum Priority)
    *   **Tier B:** 12 visits/year (Maintenance)
    *   **Tier C:** 0 visits/year (Digital-only touchpoints)
4.  **Resource Reallocation:** By cutting in-person visits to Tier C doctors, the model saves thousands of hours in rep capacity and travel expenses, redirecting exactly 326,000 optimized visits strictly to high-yield targets.

## Dashboard Features
*   **Executive KPI Banner:** High-level metrics for Sales VPs (Total Target HCPs, Tier A Volume, Total Required Capacity).
*   **Geospatial Heatmap:** Visualizes territory density to guide regional hiring and deployment strategies.
*   **Interactive Target Roster:** A conditionally formatted target list that field reps can use daily to identify priority targets and required visit counts.

## Project Previews


*   **Main Dashboard:** ![Main Dashboard](Main%20Dashboard.png)
*   **Tier A Segment Filter:** `[Insert Tier_A_Filter.png here]`

## 📁 Repository Contents
*   `Segmentation_Logic.sql`: The backend SQL script containing the Window Functions used to segment the HCPs.
*   `Call_Plan_Dashboard.pbix`: The complete, interactive Power BI dashboard.
