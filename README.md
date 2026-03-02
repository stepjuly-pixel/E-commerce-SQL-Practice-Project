# E-Commerce SQL Practice Queries

## Project Overview

This repository contains four independent analytical SQL queries built on a shared e-commerce database.
Each query addresses a specific business question and demonstrates different SQL techniques: aggregations, joins, window functions, CTEs, UNNEST, and UNION ALL.

All queries are written in BigQuery SQL.

## Tools & Technologies

- SQL (BigQuery)

- Window functions (`SUM OVER`, `DENSE_RANK`)

- CTEs, `UNION ALL`, `UNNEST`

- Conditional aggregation (`CASE WHEN`)

## Database Schema

<img src="docs/schema.png" width="800" />

The database includes:

- **Transactional tables:** `order`, `product`

- **Session & event data:** `session`, `session_params`, `event_params`

- **Marketing & forecasting:** `paid_search_cost`, `revenue_predict`

## Queries

### Query 1: Revenue by Continent

📄 [View Query](sql/query1.sql)

For each continent, calculate total revenue, revenue from the "Bookcases & shelving units" category, and the percentage share of this category.

**SQL techniques:** multiple table joins, conditional aggregation with `CASE WHEN`, percentage calculation, `GROUP BY` with `ORDER BY`.

---

### Query 2: Monthly Marketing Cost Share

📄 [View Query](sql/query2.sql)

Calculate the percentage of monthly paid search costs relative to total costs across the entire period.

**SQL techniques:** date extraction with `EXTRACT`, subquery aggregation, window function `SUM() OVER()` for analytical percentage calculation.

---

### Query 3: Session Engagement Rate by Device

📄 [View Query](sql/query3.sql)

Calculate the percentage of events where `session_engaged = 1` out of all events where this value is not NULL, grouped by device.

**SQL techniques:** CTE, working with nested fields using `UNNEST`, conditional counting, behavioral segmentation by device.

---

### Query 4: Cumulative Revenue vs Target

📄 [View Query](sql/query4.sql)

Calculate cumulative actual revenue vs cumulative predicted revenue by date and compute the percentage of target achievement.

**SQL techniques:** `UNION ALL` to combine actual and forecasted data, cumulative sums with `SUM() OVER(ORDER BY date)`, revenue progress tracking.

## How to Run

1. Clone this repository

2. Open any query from the [`sql/`](sql/) folder

3. Run in BigQuery — each query is independent and can be executed separately

## Project Structure

```
e-commerce-sql-practice/
├── sql/
│   ├── query1.sql
│   ├── query2.sql
│   ├── query3.sql
│   └── query4.sql
├── docs/
│   └── schema.png
└── README.md
```
