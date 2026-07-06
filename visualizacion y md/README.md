# TechCare Solutions - Database Relational Design

## Project Description
TechCare Solutions Riwi S.A.S. is an enterprise specializing in preventive and corrective technical support for technological equipment across multiple corporate facilities in Colombia. 

As the company experienced rapid growth, managing operations using a single shared spreadsheet led to critical data corruption issues, including duplicated clients, inconsistent branch naming, missing fields, overlapping technician records, and unreliable managerial reporting. 

This project delivers a robust relational database management system (RDBMS) architecture that centralizes information, enforces strict data integrity, eliminates redundancy through standardization, and provides clear operational metrics for decision-making.

---

## Technologies Used
* **Database Engine**: MySQL Server (v8.0+)
* **Database Administration Client**: MySQL Workbench / DBeaver
* **Modeling & Diagramming**: Draw.io (Diagrams.net)
* **Data Sources**: Estandardized CSV Files

---

## Database Engine
**MySQL** was selected as the database engine for this implementation due to its high transactional efficiency, native enforcement of foreign key constraints (`FOREIGN KEY`), reliable index handling for analytical querying, and comprehensive support for transactional integrity.

---

## Explanation of the Normalization Process
To resolve the flaws found in the original spreadsheet spreadsheet, we applied normalization principles up to the **Third Normal Form (3NF)**:

1. **Elimination of Repeating Groups (1NF)**: Every field was isolated into atomic components. Text fields with variable naming inputs (such as cities, device models, and categories) were decoupled from transactional files.
2. **Elimination of Partial Dependencies (2NF)**: Master reference catalogs were created for non-transitional objects. Tables like `riwi_cities`, `riwi_customers`, `riwi_technicians`, and `riwi_equipment_categories` were separated, ensuring attributes rely exclusively on a numeric unique Primary Key (`id`).
3. **Elimination of Transitive Dependencies (3NF)**: Physical facilities were structured into `riwi_service_branches`, isolating specific client addresses from general client entities. This resolved internal linguistic redundancies (e.g., mixing "Main" and "HQ" concepts) and prevented orphan records.

---

## Database Structure
The model is structured into **8 specific relational tables** using the mandatory internal prefix `riwi_`:

1. **`riwi_cities`**: Master registry for locations.
2. **`riwi_customers`**: Standardized company business profiles.
3. **`riwi_service_branches`**: Maps custom facilities linking customers and cities.
4. **`riwi_technicians`**: Operational workforce directory with verified full names.
5. **`riwi_equipment_categories`**: Core classification filters (e.g., Laptops, Networking).
6. **`riwi_equipment`**: Specific inventory product models linked to a single category.
7. **`riwi_service_types`**: Normalized maintenance operations (Preventive, Corrective, Installation).
8. **`riwi_service_orders`**: The central transactional ledger that monitors technical interactions, durations (`hours`), and billing amounts (`cost`).

---

## Entity Relationship Diagram
The conceptual entity model maps architectural cardinality relations under **Crow's Foot notation** layout guidelines:

* `riwi_cities` (1) ─── (N) `riwi_service_branches`
* `riwi_customers` (1) ─── (N) `riwi_service_branches`
* `riwi_equipment_categories` (1) ─── (N) `riwi_equipment`
* `riwi_service_branches` (1) ─── (N) `riwi_service_orders`
* `riwi_technicians` (1) ─── (N) `riwi_service_orders`
* `riwi_equipment` (1) ─── (N) `riwi_service_orders`
* `riwi_service_types` (1) ─── (N) `riwi_service_orders`

---

## Database Creation Instructions (DDL)
1. Open your connection engine interface in **MySQL Workbench**.
2. Initialize an empty query sheet (`Ctrl + T`).
3. Set your target custom schema variables within the DDL script header (`bd_your_name_your_clan`).
4. Paste and execute the full unified compilation script to build your tables, configure database primary indexes, map structural keys, and implement check controls.

---

## Data Loading Instructions (DML / CSV Import)
To populate data successfully without violating relational constraints, data **MUST** be loaded in this exact structural sequential order:

1. **`riwi_cities`**
2. **`riwi_customers`**
3. **`riwi_technicians`**
4. **`riwi_equipment_categories`**
5. **`riwi_service_types`**
6. **`riwi_service_branches`** *(Requires pre-loaded cities and customers)*
7. **`riwi_equipment`** *(Requires pre-loaded categories)*
8. **`riwi_service_orders`** *(Requires all preceding master catalogs)*

### Automated Loading Steps via MySQL Workbench:
1. Expand your target database within the left navigator panel.
2. Right-click on the specific table entity target and choose **Table Data Import Wizard**.
3. Point to your corresponding export mapping source file (`.csv`).
4. Complete the structural attribute alignment fields configuration mapping wizard and hit **Finish**.

---

## Explanation of Each SQL Query
* **Query 1 (Workload Balance)**: Counts aggregate service entries groupings processed per technician using a `LEFT JOIN`. This highlights workforce allocation variances, identifying overloaded or underutilized personnel.
* **Query 2 (Geographic Density Distribution)**: Joins city nodes to transactional logs to reveal operational service frequency distribution per city, enabling strategic regional resource tracking.
* **Query 3 (Operational Demand Volume)**: Summarizes work order counts per type of service to track business service trends and guide resource prioritization.
* **Query 4 (Hardware Failure Analytics)**: Identifies hardware models with high breakdown frequencies, pinpointing problematic equipment.
* **Query 5 (Commercial Accounts Matrix)**: Summarizes volume counts and aggregates revenue collections per client profile, identifying key corporate accounts for loyalty strategies.
* **Query 6 (Facility Operational Pressure)**: Groups total counts against individual service branches to help branch supervisors organize localized logistics.

---

## Developer Information
* **Full Name**: NATALIA ISABEL ROMERIN RINCON
* **Clan**: cortissoz (Clan8)
