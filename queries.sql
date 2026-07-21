/*
==============================================================================
LOAN DEFAULT ANALYSIS — SQL QUERIES
==============================================================================
Dataset: Loan_default.csv (255,347 rows)
Note: "Default" is quoted because it's a reserved SQL word.
==============================================================================
*/


-- 1. Overall default rate
SELECT
    COUNT(*)                                     AS total_loans,
    SUM("Default")                               AS total_defaults,
    ROUND(100.0 * SUM("Default") / COUNT(*), 2)  AS default_rate_pct
FROM loans;

-- Result: 11.61% of loans default (29,653 out of 255,347)


-- 2. Default rate by credit score band
SELECT
    CASE
        WHEN CreditScore < 580 THEN 'Poor (<580)'
        WHEN CreditScore < 670 THEN 'Fair (580-669)'
        WHEN CreditScore < 740 THEN 'Good (670-739)'
        ELSE 'Very Good+ (740+)'
    END AS credit_band,
    COUNT(*)                                     AS total_loans,
    ROUND(100.0 * SUM("Default") / COUNT(*), 2)  AS default_rate_pct
FROM loans
GROUP BY credit_band
ORDER BY MIN(CreditScore);

-- Result: default rate drops steadily as credit score rises
-- (Poor 12.47% -> Fair 11.43% -> Good 10.63% -> Very Good+ ~10.2%)


-- 3. Default rate by DTI (debt-to-income) band
SELECT
    CASE
        WHEN DTIRatio < 0.20 THEN 'Low (<20%)'
        WHEN DTIRatio < 0.50 THEN 'Medium (20-50%)'
        ELSE 'High (50%+)'
    END AS dti_band,
    COUNT(*)                                     AS total_loans,
    ROUND(100.0 * SUM("Default") / COUNT(*), 2)  AS default_rate_pct
FROM loans
GROUP BY dti_band
ORDER BY MIN(DTIRatio);

-- Result: default rate rises with DTI (Low 10.36% -> Medium ~11.3% -> High 12.15%)


-- 4. Combined risk: low credit score AND high DTI together
SELECT
    COUNT(*)                                     AS total_loans,
    ROUND(100.0 * SUM("Default") / COUNT(*), 2)  AS default_rate_pct
FROM loans
WHERE CreditScore < 620
  AND DTIRatio > 0.40;

-- Result: 12.76% default rate (vs. 11.61% overall), and this segment is
-- 92,140 loans -- 36% of the entire portfolio. Key finding of this project.


-- 5. Default rate by employment type
SELECT
    EmploymentType,
    COUNT(*)                                     AS total_loans,
    ROUND(100.0 * SUM("Default") / COUNT(*), 2)  AS default_rate_pct
FROM loans
GROUP BY EmploymentType
ORDER BY default_rate_pct DESC;

-- Result: Unemployed 13.55% -> Part-time 11.97% -> Self-employed 11.46%
-- -> Full-time 9.46%
