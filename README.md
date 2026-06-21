Loan-Default-Analytics-Dashboard

Dashboard Link : [Insert Your Power BI Service Link Here]

Problem Statement
This dashboard helps a financial lending institution understand its risk profile and borrower characteristics. By analyzing credit risk factors, the institution can identify which demographics and loan attributes contribute most heavily to defaults.
Through key metrics like average credit scores, income levels, and interest rates across different employment types and educational backgrounds, the institution can isolate areas of high financial risk. Since the overall default rate is approximately 11.61%, this dashboard provides actionable insights to refine credit risk models, adjust interest rate policies, and implement more stringent underwriting criteria for high-risk segments (such as younger borrowers with lower incomes or higher debt-to-income ratios).

Steps Followed
•	Step 1: Loaded the dataset (Loan_default.csv) into Power BI Desktop.

•	Step 2: Opened Power Query Editor. Under the View tab, selected "Column distribution", "Column quality", and "Column profile" to inspect data cleanliness.

•	Step 3: Adjusted settings to enable "Column profiling based on entire dataset" to ensure a comprehensive evaluation of all 255,347 rows.

•	Step 4: Validated that crucial risk metrics (CreditScore, Income, LoanAmount, and Default) contained zero missing or error values. Trailing columns with null values (Unnamed: 19, Unnamed: 20) were removed during cleaning.

•	Step 5: Set appropriate data types for all fields (e.g., Currency for Income and LoanAmount, Percentage/Decimal for InterestRate and DTIRatio).

•	Step 6: Selected a cohesive color theme in Report View to align with corporate financial reporting standards.

•	Step 7: Implemented page-level interactive Slicers/Filters for core dimensions: Education, EmploymentType, MaritalStatus, and LoanPurpose.

•	Step 8: Created high-impact Card Visuals at the top of the canvas to display primary baseline metrics: Total Borrowers, Average Income, Average Loan Amount, and Overall Default Rate.

•	Step 9: Added a clustered column/bar chart comparing the distribution of Default vs. Non-Default accounts, segmented by demographic parameters like Education or EmploymentType.

•	Step 10: Authored a series of robust DAX expressions to handle custom segments and key performance calculations:
Calculated Column (Age Group Segment):

Age Group = 
IF(Loan_default[Age] <= 25, "18-25",
IF(Loan_default[Age] <= 40, "26-40",
IF(Loan_default[Age] <= 60, "41-60", 
"60+")))

Key Performance Measures:
Total Borrowers = COUNT(Loan_default[LoanID])

Default Rate % = (DIVIDE(CALCULATE(COUNT(Loan_default[LoanID]), Loan_default[Default] = 1), [Total Borrowers])) * 100

Total Loan Principal = SUM(Loan_default[LoanAmount])

•	Step 11: Inserted structured corporate headers using Text Boxes, along with clear organizational layout separators (rectangles/lines) to improve dashboard scannability.

•	Step 12: Published the complete interactive data model from Power BI Desktop to the target workspace in Power BI Service.

Snapshot of Dashboard (Power BI Service / Desktop)
[Insert your uploaded dashboard screenshot here]

Insights

[1] Overall Baseline Metrics
•	Total Portfolio Size: 255,347 borrowers.
•	Overall Default Rate: 11.61%.
•	Healthy Accounts (Non-Default): 88.39%.

[2] Default Profile Inferences (Risk Indicators)
A clear divergence is visible when comparing borrowers who defaulted (Default = 1) against those who maintain healthy status (Default = 0):
•	Age Disparity: Defaulted borrowers trend significantly younger, with an average age of 36.56 years, compared to 44.41 years for non-defaulters.
•	Income Limitations: The average annual income for defaulting borrowers is ₹71,844.72, which is markedly lower than non-defaulting borrowers (₹83,899.16).
•	Exposure Risk: Defaulted accounts hold higher average loan obligations (₹144,515.31) compared to active healthy loans (₹125,353.66).
•	Premium Penalty: Defaulters carry higher risk pricing, holding an average interest rate of 15.90%, versus 13.18% for low-risk clients.

[3] Portfolio Distributions
•	Education & Employment Diversification: The portfolio is perfectly distributed evenly across all categories. Each educational group (Bachelor's, High School, Master's, PhD) represents exactly ~25% of the borrower pool. Similarly, employment categories (Full-time, Part-time, Self-employed, Unemployed) split evenly at ~25% each.
•	Loan Intents: Borrowers are evenly split across five primary categorical purposes: Business, Home, Education, Other, and Auto (each hovering uniformly at ~20% of the active loan count).




