# SQL Cheat Sheet

## Introduction

SQL (Structured Query Language) is used to communicate with databases. It allows you to create, read, update, and delete data stored in a database (commonly referred to as CRUD operations). This document serves as a guide to the most common SQL commands and terminology.

---

## SQL Vocabulary

- **Database**: A collection of organized data.
- **Table**: A structure in a database that stores data in rows and columns.
- **Row (Record)**: A single entry in a table.
- **Column (Field)**: A specific attribute or category of data in a table.
- **Primary Key**: A unique identifier for each record in a table.
- **Foreign Key**: A field in one table that links to the primary key of another table.
- **Query**: A request for data or action from the database.
- **Schema**: The structure of a database, including tables and relationships.

---

## Common SQL Commands

### 1. Data Retrieval (SELECT)

Retrieve data from one or more tables.

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

Example:

```sql
SELECT * FROM employees WHERE salary > 50000;
```

### 2. Insert Data (INSERT)

Add new rows to a table.

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

Example:

```sql
INSERT INTO employees (name, position, salary)
VALUES ('John Doe', 'Manager', 60000);
```

### 3. Update Data (UPDATE)

Modify existing rows in a table.

```sql
UPDATE table_name
SET column1 = value1
WHERE condition;
```

Example:

```sql
UPDATE employees
SET salary = 70000
WHERE name = 'John Doe';
```

### 4. Delete Data (DELETE)

Remove rows from a table.

```sql
DELETE FROM table_name
WHERE condition;
```

Example:

```sql
DELETE FROM employees
WHERE name = 'John Doe';
```

### 5. Create Table (CREATE TABLE)

Define a new table structure.

```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint
);
```

Example:

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);
```

### 6. Alter Table (ALTER TABLE)

Modify an existing table structure.

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

Example:

```sql
ALTER TABLE employees
ADD department VARCHAR(50);
```

### 7. Drop Table (DROP TABLE)

Remove a table from the database.

```sql
DROP TABLE table_name;
```

Example:

```sql
DROP TABLE employees;
```

### 8. Create Database (CREATE DATABASE)

Create a new database.

```sql
CREATE DATABASE database_name;
```

Example:

```sql
CREATE DATABASE company;
```

### 9. Drop Database (DROP DATABASE)

Delete an existing database.

```sql
DROP DATABASE database_name;
```

Example:

```sql
DROP DATABASE company;
```

### 10. Joins

Combine rows from two or more tables based on a related column.

#### INNER JOIN

```sql
SELECT column1, column2
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

#### LEFT JOIN

```sql
SELECT column1, column2
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
```

#### RIGHT JOIN

```sql
SELECT column1, column2
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
```

#### FULL JOIN

```sql
SELECT column1, column2
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

### 11. Aggregate Functions

Perform calculations on multiple rows of a table.

- **COUNT**: Counts rows

  ```sql
  SELECT COUNT(*) FROM table_name;
  ```

- **SUM**: Calculates the total

  ```sql
  SELECT SUM(column_name) FROM table_name;
  ```

- **AVG**: Calculates the average

  ```sql
  SELECT AVG(column_name) FROM table_name;
  ```

- **MAX**: Finds the maximum value

  ```sql
  SELECT MAX(column_name) FROM table_name;
  ```

- **MIN**: Finds the minimum value

  ```sql
  SELECT MIN(column_name) FROM table_name;
  ```

---

## SQL Data Types

| Data Type    | Description                        |
|--------------|------------------------------------|
| INT          | Integer numbers                   |
| DECIMAL(p,s) | Fixed-point numbers               |
| VARCHAR(n)   | Variable-length strings           |
| CHAR(n)      | Fixed-length strings              |
| DATE         | Date values                       |
| TIMESTAMP    | Date and time values              |
| BOOLEAN      | True/False values                 |

---

## Best Practices

- Always back up your database before performing destructive operations (e.g., `DROP`).
- Use parameterized queries to prevent SQL injection.
- Normalize your database to reduce redundancy and improve efficiency.
- Index frequently searched columns to optimize performance.

---

## Resources

- [SQL Official Documentation](https://www.sql.org/)
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)

---

Happy querying!
