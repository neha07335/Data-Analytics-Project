# 🏦 Loan Default Analysis — Power BI Dashboard

An interactive Power BI dashboard that analyzes loan default patterns across borrower demographics, financial profiles, and risk metrics. Built using a structured loan dataset to surface actionable insights for credit risk assessment.

---

## 📊 Dashboard Pages

### 1. Loan Default Overview
High-level summary of loan performance including total loan amounts, default rates by year, YoY changes in loan volume and defaults, and loan distribution by purpose and education type.

### 2. Applicant Demographic & Financial Profile
Explores borrower characteristics such as age groups, employment type, marital status, income brackets, and dependents — showing how these factors correlate with loan amounts and defaults.

### 3. Financial Risk Metrics
Deep-dive into credit risk indicators including credit score bins, DTI ratio, interest rates, co-signer presence, mortgage status, and median loan values by credit score segments.

---

## 📁 Dataset — Key Fields

The dataset (`Loan_default`) contains the following columns:

| Field | Description |
|---|---|
| `LoanID` | Unique loan identifier |
| `Age` | Borrower age |
| `Income` | Annual income |
| `LoanAmount` | Loan amount disbursed |
| `CreditScore` | Applicant credit score |
| `LoanTerm` | Loan term (months) |
| `InterestRate` | Interest rate on the loan |
| `DTIRatio` | Debt-to-income ratio |
| `EmploymentType` | Employment category |
| `Education` | Education level |
| `MaritalStatus` | Marital status |
| `HasMortgage` | Whether applicant has a mortgage |
| `HasDependents` | Whether applicant has dependents |
| `HasCoSigner` | Whether loan has a co-signer |
| `LoanPurpose` | Purpose of the loan |
| `NumCreditLines` | Number of active credit lines |
| `MonthsEmployed` | Duration of current employment |
| `Default` | Target variable — whether the loan defaulted (1/0) |
| `Loan_Date_DD_MM_YYYY` | Loan origination date |

---

## 📈 Key Measures & Insights

- **Default Rate by Year** — trend analysis of defaults over time
- **YOY Default Loan Change** — year-over-year change in defaulted loan volume
- **YOY Loan Amount Change** — growth or decline in total loans issued
- **YTD Loan Amount** — year-to-date cumulative loan disbursement
- **Average Loan by Age Group** — loan size segmented by borrower age group
- **Avg Loan Amount (High Credit)** — average loan for high credit score borrowers
- **Total Loan (Middle Age Adults)** — loan concentration in mid-age demographic
- **Total Loan Credit Bins** — distribution of loans across credit score bands
- **Loan Amount by Purpose** — breakdown by why the loan was taken
- **Loan by Education Type** — correlation between education and loan amount
- **Average Income by Employment Type** — income profile across employment categories
- **Default Rate by Employment Type** — which employment types carry higher default risk
- **Median by Credit Score Bins** — median loan values segmented by creditworthiness

---

## 🛠️ Tools & Technologies

- **Power BI Desktop** — dashboard development and visualization
- **Power Query (M)** — data transformation and preparation
- **DAX** — custom measures and calculated columns
- **Dataset format** — tabular loan data (CSV/Excel source)

---

## 🚀 Getting Started

1. Clone or download this repository.
2. Open `Project_1.pbit` in **Power BI Desktop**.
3. When prompted, connect to your source dataset (CSV/Excel with the schema above).
4. Refresh the data — all visuals and measures will populate automatically.

> **Note:** The `.pbit` file is a Power BI Template — it contains the report layout and data model but not the raw data. You'll need to provide the dataset when opening it.

---

## 📌 Use Cases

- Credit risk analysis and loan portfolio monitoring
- Understanding borrower demographics and financial profiles
- Identifying high-risk segments for proactive risk management
- Supporting data-driven lending decisions

---

## SQL Analysis
In addition to the Power BI dashboard, I ran SQL queries directly on the
same dataset to validate key findings — see `queries.sql`.

Key finding: borrowers with both low credit score (<620) and high DTI (>40%)
default at 12.76%, vs. 11.61% for the portfolio overall, and this segment
covers 36% of the entire loan book.

## 📄 License

This project is for educational and portfolio purposes.
