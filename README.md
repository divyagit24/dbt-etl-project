# 📦 DBT ETL Project — Order Management System

An end-to-end **DBT (Data Build Tool)** project transforming raw Order Management System (OMS) data through staging and analytics layers using modern ELT best practices on Snowflake.

---

## 🏗️ Architecture

```
L1_LANDING (Raw Source)
        │
        ▼
┌──────────────────────────────────────┐
│         STAGING LAYER                │
│   stg_customers  stg_orders          │
│   orderitems_stg                     │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│          ANALYTICS LAYER             │
│   orders_fact                        │
│   customerorders  customerrevenue    │
└──────────────────────────────────────┘
```

---

## 📁 Models

| Model | Layer | Description |
|---|---|---|
| `stg_customers` | Staging | Cleans customer records, derives full name |
| `stg_orders` | Staging | Decodes status codes into readable descriptions |
| `orderitems_stg` | Staging | Computes line item total price (qty × unit price) |
| `orders_fact` | Analytics | Fact table joining orders + items, computes revenue |
| `customerorders` | Analytics | Order count per customer |
| `customerrevenue` | Analytics | Total revenue and order count per customer |

---

## ✅ DBT Features Used

- **`ref()`** dependencies — models reference each other correctly ensuring build order
- **Schema separation** — raw data in `L1_LANDING`, processed in `L2_PROCESSING`
- **Materialization strategies** — tables and views configured per model
- **Custom macros** — `generate_schema_name.sql` for dynamic schema routing
- **Tests** — `unique`, `not_null`, `accepted_values`, and `relationships` tests on all key columns
- **Column documentation** — full descriptions on every column in `schema.yml`
- **CASE WHEN logic** — status code decoding in staging layer

---

## 🧪 Tests

Tests are defined in `schema.yml` and cover:

| Test Type | Applied To |
|---|---|
| `unique` | All primary keys |
| `not_null` | All required fields |
| `accepted_values` | Order status codes |
| `relationships` | Foreign key integrity across models |




## 🗂️ Project Structure

```
oms_dbt_proj/
├── models/
│   ├── stg_customers.sql       # Staging: customers
│   ├── stg_orders.sql          # Staging: orders with status decode
│   ├── orderitems_stg.sql      # Staging: order line items
│   ├── orders_fact.sql         # Analytics: order fact table
│   ├── customerorders.sql      # Analytics: orders per customer
│   ├── customerrevenue.sql     # Analytics: revenue per customer
│   └── schema.yml              # Column docs and tests
├── macros/
│   └── generate_schema_name.sql
├── dbt_project.yml
└── README.md
```

---

## 🛠 Tech Stack

- **DBT** (Data Build Tool)
- **Snowflake** — data warehouse
- **SQL** — transformation logic

---


