# 🌍 BAIT 507: Data Ethics and SQL Analysis - Consumer Carbon Incentives

![GitHub last commit](https://img.shields.io/github/last-commit/pmehta98/BAIT507-CCI-Analysis)
![GitHub repo size](https://img.shields.io/github/repo-size/pmehta98/BAIT507-CCI-Analysis)
![GitHub stars](https://img.shields.io/github/stars/pmehta98/BAIT507-CCI-Analysis?style=social)

## 📋 Table of Contents
- [Overview](#overview)
- [Project Purpose](#project-purpose)
- [Features](#features)
- [Key Components](#key-components)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Repository Structure](#repository-structure)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 📌 Overview

This repository contains the work for **BAIT 507 Homework Assignment 2**, focusing on **data ethics and SQL query analysis** in the context of Consumer Carbon Incentives (CCI) programs. The project is aligned with the United Nations' Sustainable Development Goals, specifically:

- **Goal 12:** Responsible Consumption and Production
- **Goal 13:** Climate Action

The database explored in this assignment holds records about CCI programs, simulating real-world data on consumer behavior and rewards for low-carbon choices.

---

## 🎯 Project Purpose

The purpose of this project is threefold:

1. **Explore Data Ethics Issues**
   - Analyze biases in reward systems
   - Examine unintended consequences
   - Consider impact across different demographics (age, economic status, geography)

2. **Analyze Database Records Using SQL**
   - Consumer behavior patterns
   - Environmental sustainability metrics
   - Reward program effectiveness
   - User engagement trends

3. **Provide Actionable Recommendations**
   - Improvements for CCI program design
   - Strategies to address identified biases
   - Enhanced sustainability outcomes

---

## ✨ Features

### Data Ethics Analysis
- **Bias Detection:** Address questions about biases in the CCI program
  - Age-based disparities
  - Economic status considerations
  - Geographic accessibility
- **Unintended Consequences:** Examine potential increases in carbon emissions due to certain reward mechanisms
- **Fairness Assessment:** Evaluate equity in reward distribution

### SQL Query Solutions
- **User Participation Trends:** Identify patterns in program engagement
- **Credit Balance Calculations:** Track user rewards and incentives
- **Activity Rankings:** Analyze popularity of different low-carbon activities
- **Temporal Analysis:** Examine changes in behavior over time
- **Demographic Analysis:** Compare participation across user segments

---

## 📁 Key Components

### 1. Database Schema (`CCI_DDL.sql`)

**Description:** Database schema and initial data population

**Key Tables:**
- `ACTIVITY` - Low-carbon activities users can engage in
- `CARBONREWARD` - Reward structure for different activities
- `CCIUSER` - User demographics and registration information
- `PARTICIPATION` - Records of user engagement in activities
- `CREDITS` - User reward balances and transactions

### 2. SQL Queries (`Queries.sql`)

**Description:** SQL scripts solving assigned analytical questions

**Query Topics:**
- User participation statistics
- Credit balance calculations
- Activity popularity rankings
- Temporal trend analysis
- Demographic comparisons

### 3. Data Ethics Analysis (`Data Ethics.docx`)

**Description:** Written analysis of ethical considerations

**Topics Covered:**
- Identification of biases
- Equity in program design
- Environmental impact assessment
- Recommendations for improvement

### 4. Assignment Guidelines (`BAIT 507 HW 2 2024.docx`)

**Description:** Detailed assignment requirements and deliverables

---

## 🛠️ Setup Instructions

To replicate the analysis:

### Prerequisites

- **Database System:** Oracle SQL Developer, MySQL Workbench, or PostgreSQL
- **SQL Client:** Any SQL-compatible client
- **Optional:** Microsoft Word for viewing ethics analysis

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/pmehta98/BAIT507-CCI-Analysis.git
   cd BAIT507-CCI-Analysis
   ```

2. **Initialize the Database:**
   - Open your SQL client
   - Connect to your database instance
   - Run `CCI_DDL.sql` to create tables and insert data
   ```sql
   @CCI_DDL.sql
   ```

3. **Execute Queries:**
   - Open `Queries.sql` in your SQL environment
   - Run queries individually or as a script
   - Review results and analysis

4. **Review Ethics Analysis:**
   - Open `Data Ethics.docx` to read the ethical considerations

---

## 📖 Usage

### Running SQL Queries

```sql
-- Example: Check user participation trends
SELECT 
    u.user_id,
    COUNT(p.activity_id) as activity_count
FROM CCIUSER u
LEFT JOIN PARTICIPATION p ON u.user_id = p.user_id
GROUP BY u.user_id
ORDER BY activity_count DESC;
```

### Analyzing Results

1. Execute each query in `Queries.sql`
2. Document the output
3. Cross-reference with ethics analysis
4. Draw insights about program effectiveness

---

## 📂 Repository Structure

```
BAIT507-CCI-Analysis/
│
├── docs/
│   ├── Data Ethics.docx
│   └── BAIT 507 HW 2 2024.docx
│
├── sql/
│   ├── CCI_DDL.sql
│   └── Queries.sql
│
└── README.md
```

---

## 🔧 Technologies Used

- **Database:** Oracle SQL / MySQL / PostgreSQL
- **Query Language:** SQL (Structured Query Language)
- **Development Tools:** SQL Developer, MySQL Workbench
- **Documentation:** Microsoft Word, Markdown
- **Analysis Methods:**
  - Data aggregation
  - Statistical queries
  - Temporal analysis
  - Demographic segmentation

---

## 🌱 UN Sustainable Development Goals

This project directly supports:

### SDG 12: Responsible Consumption and Production
- Encourages sustainable consumption patterns
- Rewards low-carbon lifestyle choices
- Promotes environmental awareness

### SDG 13: Climate Action
- Incentivizes carbon footprint reduction
- Tracks environmental impact of consumer behavior
- Supports climate-friendly decision making

---

## 🤝 Contributing

This is an academic project. Contributions in the form of suggestions or improvements to the analysis methodology are welcome:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/ImprovedAnalysis`)
3. Commit your changes (`git commit -m 'Add improved analysis'`)
4. Push to the branch (`git push origin feature/ImprovedAnalysis`)
5. Open a Pull Request

---

## 📄 License

This repository is for academic purposes only. Distribution or usage of the data and SQL scripts for commercial purposes is prohibited.

---

## 📧 Contact

**Pranav Mehta**

- GitHub: [@pmehta98](https://github.com/pmehta98)
- Repository: [BAIT507-CCI-Analysis](https://github.com/pmehta98/BAIT507-CCI-Analysis)

---

⭐ If you find this repository helpful, please consider giving it a star!

---
