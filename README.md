#  Manufacturing Production Analytics
Manufacturing production analytics project using PostgreSQL and SQL to analyze production performance, defects, machines, and business KPIs. 

## Project Overview

This project analyzes manufacturing production data using **PostgreSQL and SQL**.

The main objective is to evaluate production performance, product quality, machine efficiency, and operational trends using SQL-based data analysis.

The project focuses on answering practical business questions that a Data Analyst may encounter while analyzing manufacturing operations.

---

## Business Objective

The purpose of this project is to analyze manufacturing data and identify:

* Production performance against planned production
* Production achievement by shift
* Product and category production volume
* Defect rates across products, categories, and machines
* Machine production performance
* Production efficiency
* Products with high production and low defect rates
* Operational patterns that can support business decision-making

---

## Tools & Technologies

* **Database:** PostgreSQL
* **Language:** SQL
* **Data Format:** CSV
* **Version Control:** Git & GitHub

---

## Database Structure

The project contains four main tables:

### 1. Machines

Contains information about manufacturing machines.

| Column              | Description                             |
| ------------------- | --------------------------------------- |
| `machine_id`        | Unique machine identifier               |
| `machine_name`      | Name of the machine                     |
| `machine_type`      | Type of machine                         |
| `production_line`   | Production line assigned to the machine |
| `installation_date` | Machine installation date               |

### 2. Products

Contains product-related information.

| Column          | Description               |
| --------------- | ------------------------- |
| `product_id`    | Unique product identifier |
| `product_name`  | Product name              |
| `category`      | Product category          |
| `sub_category`  | Product sub-category      |
| `standard_cost` | Standard production cost  |

### 3. Production

Contains production records.

| Column                | Description                 |
| --------------------- | --------------------------- |
| `production_id`       | Unique production record    |
| `machine_id`          | Machine used for production |
| `product_id`          | Product produced            |
| `production_datetime` | Production date and time    |
| `shift`               | Production shift            |
| `planned_units`       | Planned production quantity |
| `produced_units`      | Actual production quantity  |
| `defective_units`     | Number of defective units   |

### 4. Maintenance

Contains machine maintenance information.

| Column             | Description                   |
| ------------------ | ----------------------------- |
| `maintenance_id`   | Unique maintenance record     |
| `machine_id`       | Machine receiving maintenance |
| `maintenance_date` | Maintenance date              |
| `maintenance_type` | Type of maintenance           |
| `maintenance_cost` | Maintenance cost              |

---

## SQL Analysis Performed

The project contains **20 business-focused SQL analysis questions** covering different levels of SQL.

### Basic Analysis

* Inspect database tables
* Count records
* Review production records
* Identify duplicate production records
* Calculate total planned production
* Calculate total actual production

### Production Performance

* Calculate overall production achievement %
* Compare production performance by shift
* Identify the shift with the highest production
* Identify products with the highest production volume
* Compare machine production performance

### Quality Analysis

* Calculate overall defect rate
* Calculate defect rate by product
* Calculate defect rate by category
* Calculate defect rate by machine
* Identify products with low defect rates and high production volume

### Business-Oriented Analysis

The analysis also combines multiple metrics to answer questions such as:

* Which categories produce the highest volume?
* Which machines have the highest production achievement?
* Which machines generate the most defective units?
* Which products maintain defect rates below 2% while producing high volumes?
* Which categories combine high production with acceptable quality?

---

## Important KPIs

### Production Achievement %

```text
Production Achievement % =
Total Produced Units / Total Planned Units × 100
```

### Defect Rate

```text
Defect Rate =
Total Defective Units / Total Produced Units × 100
```

### Production Cost

```text
Production Cost =
Produced Units × Standard Cost
```

These KPIs are used to evaluate production efficiency and quality performance.

---

## SQL Concepts Used

This project provides practical experience with:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* Aggregate functions

  * `SUM()`
  * `AVG()`
  * `COUNT()`
* `JOIN`
* `CASE`
* Type casting
* Numeric calculations
* Date and time calculations
* Duplicate detection
* Business KPI calculations

---

## Key Analytical Approach

The analysis follows a typical Data Analyst workflow:

```text
Raw Manufacturing Data
        ↓
Data Validation
        ↓
Data Exploration
        ↓
Aggregation
        ↓
KPI Calculation
        ↓
Performance Analysis
        ↓
Quality Analysis
        ↓
Business Insights
```

---

## Project Structure

```text
Manufacturing-Production-Analytics/
│
├── data/
│   ├── machines.csv
│   ├── products.csv
│   ├── production.csv
│   └── maintenance.csv
│
├── sql/
│   └── manufacturing_project.sql
│
└── README.md
```

---

## How to Run the Project

### 1. Install PostgreSQL

Install PostgreSQL and open **pgAdmin** or another PostgreSQL SQL client.

### 2. Create a Database

Create a new database for the project.

### 3. Run the SQL Setup File

Execute the SQL script:

```text
manufacturing_project.sql
```

The script creates the required tables and loads the project data.

### 4. Start Analysis

After loading the data, run the SQL analysis queries against the database.

---

## Business Value

This project demonstrates how SQL can be used to transform manufacturing data into useful business information.

The analysis can help management understand:

* Where production performance is strong or weak
* Which machines require attention
* Which products have higher defect rates
* Which categories have better production performance
* Whether high production volume is being achieved without compromising quality

---

## Skills Demonstrated

Through this project, I practiced:

* PostgreSQL
* SQL querying
* Data exploration
* Data validation
* Data aggregation
* Relational database analysis
* Joining multiple tables
* KPI calculation
* Manufacturing analytics
* Quality analysis
* Business-oriented problem solving

---

## 👤 Author

**Hrutik Hiwase**

Aspiring Data Analyst | SQL | PostgreSQL | Power BI | Python

---

## Project Purpose

This project was created as a **Data Analyst portfolio project** to demonstrate practical SQL skills through a realistic manufacturing analytics scenario.
