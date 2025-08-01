# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

A comprehensive, real-world data analyst portfolio project built around an e-commerce inventory dataset scraped from Zepto, one of India’s rapidly expanding quick-commerce startups. The project replicates actual analyst workflows — starting from raw data exploration all the way to actionable, business-driven insights.

Ideal for:

 •	📊 Aspiring data analysts 
	
 •	📚 Learners seeking hands-on SQL practice in a realistic business context
	
 •	💼 Candidates preparing for roles in e-commerce, retail, or product/data analytics

 ## 📌 Project Overview

This project is designed to mirror how data analysts operate in the e-commerce and retail industry. You'll use SQL to:

- ✅ Set up a messy e-commerce inventory database
- ✅ Perform **Exploratory Data Analysis (EDA)** on categories, stock levels, and pricing patterns
- ✅ Clean data by handling nulls, removing invalid records, and converting prices from paise to ₹
- ✅ Write **business-driven SQL queries** to derive insights on:
  - Inventory health
  - Product availability
  - Revenue generation
  - Pricing inconsistencies

---

## 📁 Dataset Overview

The dataset was scraped from Zepto’s official product listings and sourced via Kaggle. It closely mimics the type of raw, unstructured inventory data found in real e-commerce systems.

Each row represents a **unique SKU (Stock Keeping Unit)**. Duplicate product names are intentional due to different packaging, weights, and discounts — just like a real catalog.

---

## 🧾 Columns Description

| Column Name              | Description                                                              |
|--------------------------|--------------------------------------------------------------------------|
| `sku_id`                 | Unique identifier for each product entry (Synthetic Primary Key)         |
| `name`                   | Product name as listed on the Zepto app                                  |
| `category`               | Category of the product (e.g., Fruits, Snacks, Beverages)                |
| `mrp`                    | Maximum Retail Price (originally in paise, converted to ₹)               |
| `discountPercent`        | Discount applied on MRP (in %)                                           |
| `discountedSellingPrice`| Final price after discount (in ₹)                                        |
| `availableQuantity`      | Units available in inventory                                             |
| `weightInGms`            | Product weight in grams                                                  |
| `outOfStock`             | Boolean flag indicating if the product is out of stock                   |
| `quantity`               | Units per package (may be combined with weight for loose produce)        |

---

## 📦 Ideal For

- 📊 Data analyst aspirants building portfolio projects for LinkedIn or interviews  
- 📚 Anyone learning SQL through real-world scenarios  
- 💼 Candidates preparing for roles in **retail**, **e-commerce**, or **product analytics**

---


## 📎 Data Source

- [Kaggle: Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset) 

---

## Screenshot

[Have a look!](https://github.com/ananyasaini64760/Zepto_Data_Analysis/blob/main/ScreenShot.png)
