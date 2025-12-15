# Practical Exam: Data Warehousing and Data Mining

## Project Overview

This project demonstrates comprehensive data warehousing and data mining techniques through hands-on implementation of industry-standard practices. The work is divided into two main sections: Data Warehousing (focusing on ETL processes and OLAP analysis) and Data Mining (covering preprocessing, clustering, and classification).

**Author:** Aime-232
**Date:** December 2025  
**Technologies Used:** Python, SQL, SQLite, MySQL, Pandas, Scikit-learn, Matplotlib, Seaborn

---

## Project Structure

```
project/
├── Section1_datawarehousing/
│   ├── task1_datawarehousedesign/
│   │   ├── schema.sql
│   │   └── README.md
│   ├── task2_etlprocess/
│   │   ├── etl_retail.ipynb
│   │   ├── retail_dw.db
│   │   ├── online_retail.csv
│   │   └── requirements.txt
│   └── task3_olap/
│       ├── olap_analysis.ipynb
│       ├── olap_queries.sql
│       ├── images/
│       └── analysis_report.pdf
│
└── Section2_datamining/
    ├── task1_datapreprocessingandexploration/
    │   ├── preprocessing_iris.ipynb
    │   ├── iris_preprocessed.csv
    │   └── images/
    ├── task2_clustering/
    │   ├── clustering_iris.ipynb
    │   ├── images/
    │   └── clustering_report.pdf
    └── task3_classificationandassociationrulemining/
        ├── mining_iris_basket.ipynb
        ├── images/
        └── analysis_report.pdf
```

---

## Section 1: Data Warehousing

### Task 1: Data Warehouse Design

**Objective:** Design and implement a star schema data warehouse for a retail company.

**Deliverables:**
- Star schema with 1 fact table (SalesFact) and 3 dimension tables (CustomerDim, ProductDim, TimeDim)
- SQL CREATE TABLE statements for MySQL/SQLite
- Schema diagram and justification

**Files:**
- `schema.sql` - Complete database schema with indexes
- `README.md` - Star schema explanation and design rationale

**Key Features:**
- Optimized for analytical queries (sales by category, customer demographics, temporal trends)
- Indexed foreign keys for fast join operations
- Denormalized dimension tables for query performance

<img width="425" height="753" alt="Diagram" src="https://github.com/user-attachments/assets/5a034dc2-c42f-4e94-9bbd-dc741ce4765c" />


---

### Task 2: ETL Process Implementation

**Objective:** Extract, Transform, and Load retail data into the data warehouse.

**Dataset:** Online Retail Dataset (UCI ML Repository, 541,909 records)

**ETL Pipeline:**

**Extract:**
- Load CSV data using Pandas
- Handle missing values in CustomerID and Description fields
- Convert data types (dates, numeric values)

**Transform:**
- Remove invalid records (negative quantities/prices)
- Calculate TotalSales = Quantity × UnitPrice
- Add product categories using TF-IDF vectorization and KMeans clustering (8 categories)
- Filter data for last year (from August 12, 2024)
- Create dimension extracts (customer summaries, time attributes)

**Load:**
- Create SQLite database (retail_dw.db)
- Load 4 tables: SalesFact, CustomerDim, ProductDim, TimeDim
- Create indexes for optimized query performance

**Files:**
- `etl_retail.ipynb` - Complete ETL notebook with logging
- `retail_dw.db` - SQLite database file
- `requirements.txt` - Python dependencies

**Key Results:**
- Processed 540,000+ records
- Created 4,000+ unique customers
- Generated 4,000+ unique products across 8 categories
- Loaded 300,000+ sales transactions

---

### Task 3: OLAP Queries and Analysis

**Objective:** Perform multidimensional analysis using OLAP operations.

**OLAP Operations Implemented:**

1. **Roll-up:** Total sales by country and quarter (116 country-quarter combinations)
2. **Drill-down:** Monthly sales breakdown for United Kingdom (12 months)
3. **Slice:** Sales analysis by product category (8 categories)

**Files:**
- `olap_queries.sql` - Three SQL queries with comments
- `olap_analysis.ipynb` - Query execution and visualization
- `analysis_report.pdf` - Business insights and recommendations
- `images/` - Visualizations

**Key Findings:**
- United Kingdom dominates with 69% of total revenue (£6.81M)
- Strong seasonality: Q4 accounts for 33% of annual sales
- November 2011: Highest monthly sales (£980,646)
- "Warm Accessories & Gift Items" category leads with 59% market share
- Top 5 countries: UK, Netherlands, EIRE, Germany, France

**Visualizations:**
- Top 10 countries by total sales (bar chart)
- Quarterly sales trends for top 5 countries (line chart)
- UK monthly sales trend (line chart)
- Sales by product category (horizontal bar chart)
- Category market share (pie chart)
- Transactions vs sales by category (dual-axis chart)
- Sales distribution heatmap (15 countries × quarters)

<img width="4172" height="2068" alt="top_countries_sales" src="https://github.com/user-attachments/assets/fab68394-06ec-4eae-9ebb-13ce83beda48" />

<img width="4171" height="2068" alt="quarterly_sales_trend" src="https://github.com/user-attachments/assets/c5a4f5a4-f443-4ae1-940e-1515375a899f" />

<img width="3581" height="2368" alt="sales_by_category" src="https://github.com/user-attachments/assets/59c6aed2-8004-4aa2-9baf-fb716acee2a9" />

<img width="2899" height="3567" alt="sales_heatmap" src="https://github.com/user-attachments/assets/2256db7a-8600-4d1c-9673-5a927d46d0b0" />

---

## Section 2: Data Mining

### Task 1: Data Preprocessing and Exploration

**Objective:** Prepare and explore the Iris dataset for machine learning.

**Dataset:** Iris Dataset (150 samples, 4 features, 3 species)

**Preprocessing Steps:**

1. **Data Loading:** Load Iris dataset from scikit-learn
2. **Missing Value Check:** Verify data completeness (no missing values found)
3. **Normalization:** Apply Min-Max scaling to all features
4. **Label Encoding:** Create one-hot encoded labels for multi-class classification
5. **Train-Test Split:** 80/20 split with stratification (120 train, 30 test)

**Exploratory Analysis:**

- Summary statistics (mean, std, min, max per species)
- Pairplot showing feature relationships by species
- Correlation heatmap (petal length & width: 0.96 correlation)
- Boxplots for outlier detection (minimal outliers in sepal width)
- Distribution plots for each feature by species

**Files:**
- `preprocessing_iris.ipynb` - Complete preprocessing pipeline
- `iris_preprocessed.csv` - Normalized dataset
- `images/` - 4 visualization plots

**Key Insights:**
- Petal features show stronger species discrimination than sepal features
- Setosa clearly separable from Versicolor and Virginica
- Moderate overlap between Versicolor and Virginica
- High correlation between petal length and width suggests redundancy

<img width="4097" height="3840" alt="pairplot" src="https://github.com/user-attachments/assets/d9e0b1a4-2c26-4cd4-ac82-9e6ed63f0e98" />

<img width="2625" height="2370" alt="correlation_heatmap" src="https://github.com/user-attachments/assets/aa6374c3-7984-4b5b-97a5-fe1def6ec22a" />

**<img width="4170" height="2955" alt="boxplots_outliers" src="https://github.com/user-attachments/assets/b17338b1-ab7f-4214-89a3-ecd3f924d0b1" />**
**<img width="4167" height="2955" alt="feature_distributions" src="https://github.com/user-attachments/assets/34fb8147-72be-4774-98ed-8732607096f2" />**

---

### Task 2: Clustering

**Objective:** Apply K-Means clustering to discover natural groupings in the data.

**Methodology:**

1. **Primary Clustering:** K-Means with k=3 (matching 3 species)
2. **Experimentation:** Test k=2 and k=4 for comparison
3. **Validation:** Elbow method, Silhouette score, Adjusted Rand Index

**Results:**

| k | Inertia | Silhouette Score | Adjusted Rand Index | Accuracy |
|---|---------|------------------|---------------------|----------|
| 2 | 12.13 | 0.630 | 0.568 | - |
| 3 | 6.98 | 0.505 | 0.716 | 88.67% |
| 4 | 5.52 | 0.445 | 0.623 | - |

**Optimal k Selection:** k=3 justified by:
- Highest ARI (0.716) indicating strong agreement with true labels
- Clear elbow in inertia curve at k=3
- Good silhouette score (0.505 > 0.5 threshold)
- Matches biological reality (3 species)

**Cluster Quality:**
- Perfect Setosa separation (50/50 correct)
- Good Versicolor identification (47/50 correct)
- Moderate Virginica accuracy (36/50 correct)
- Total: 133/150 correctly clustered (88.67%)

**Confusion Pattern:**
- 3 Versicolor misclassified as Virginica
- 14 Virginica misclassified as Versicolor
- Confusion concentrated at species boundary

**Files:**
- `clustering_iris.ipynb` - Complete clustering analysis
- `clustering_report.pdf` - Detailed findings and applications
- `images/` - 5 visualization plots

**Real-World Applications:**
- Customer segmentation in retail
- Patient stratification in healthcare
- Market structure discovery
- Product categorization

<img width="5370" height="1469" alt="elbow_curve" src="https://github.com/user-attachments/assets/ab7a8317-d6ee-48c9-ab1a-4ed08867df44" />

<img width="3534" height="1469" alt="clusters_petal_features" src="https://github.com/user-attachments/assets/52edd158-e6c7-488d-8b13-3d23dc980405" />

<img width="5327" height="1469" alt="comparison_k_values" src="https://github.com/user-attachments/assets/d7c78f75-6eb3-4e4e-92c4-6adbf823e548" />


---

### Task 3: Classification and Association Rule Mining

#### Part A: Classification

**Objective:** Build and compare classification models for species prediction.

**Models Implemented:**

1. **Decision Tree Classifier**
   - Accuracy: 80.0%
   - Precision: 1.00 (weighted)
   - Recall: 0.80 (weighted)
   - F1-Score: 0.89 (weighted)

2. **K-Nearest Neighbors (k=5)**
   - Accuracy: 83.3%
   - Precision: 1.00 (weighted)
   - Recall: 0.83 (weighted)
   - F1-Score: 0.91 (weighted)

**Winner:** K-Nearest Neighbors outperforms Decision Tree by 3.3% accuracy

**Why KNN is Better:**
- Smooth decision boundaries handle gradual species overlap
- Distance-based approach adapts to local patterns
- Neighborhood voting reduces impact of outliers
- Better suited for continuous, overlapping distributions

**When to Use Each Model:**
- **Decision Tree:** When interpretability is critical, real-time speed needed
- **KNN:** When maximum accuracy is priority, computational resources available
- 
<img width="1200" height="800" alt="decision_tree" src="https://github.com/user-attachments/assets/003348f0-b3f9-42d4-9227-afca19e95bb1" />


---

#### Part B: Association Rule Mining

**Objective:** Discover frequent itemset patterns in retail transactions.

**Dataset:** 30 synthetic transactions with 20 grocery items

**Parameters:**
- Minimum Support: 0.2 (20%)
- Minimum Confidence: 0.5 (50%)

**Top 5 Association Rules:**

| Rule | Support | Confidence | Lift | Interpretation |
|------|---------|------------|------|----------------|
| {Diapers} → {Bananas, Milk} | 20% | 60% | 3.0 | Strong |
| {Diapers} → {Bananas, Milk, Baby Food} | 20% | 60% | 3.0 | Strong |
| {Baby Food, Diapers} → {Bananas, Milk} | 20% | 60% | 3.0 | Strong |
| {Bananas, Milk, Baby Food} → {Diapers} | 20% | 100% | 3.0 | Very Strong |
| {Bananas, Milk} → {Diapers} | 20% | 100% | 3.0 | Very Strong |

**Key Rule Analysis: {Bananas, Milk} → {Diapers}**

- **Confidence: 100%** - Every transaction with bananas and milk contains diapers
- **Lift: 3.0** - Items purchased together 3x more than random chance
- **Business Insight:** Identifies "young family" shopping pattern

**Retail Applications:**

1. **Store Layout:** Position diapers near dairy and produce sections
2. **Promotional Bundling:** Create "New Parent Starter Pack" with 10% discount
3. **Personalized Marketing:** Send diaper coupons when customers buy bananas + milk
4. **Inventory Management:** Increase diaper stock when banana/milk sales spike
5. **Revenue Impact:** Estimated $8,320 annual incremental revenue per store

**Files:**
- `mining_iris_basket.ipynb` - Classification and association rule mining
- `analysis_report.pdf` - Detailed findings and business recommendations
- `images/` - Visualizations

---

## Technical Requirements

### Python Libraries

```
pandas
numpy
scikit-learn
matplotlib
seaborn
mlxtend
sqlite3 (built-in)
```

### Installation

```bash
pip install pandas numpy scikit-learn matplotlib seaborn mlxtend
```

### Database Systems

- SQLite 3.x (for ETL output)
- MySQL 8.x (for schema design, optional)

---

## How to Run the Project

### Section 1: Data Warehousing

1. **Task 1 - Schema Design:**
   ```sql
   mysql -u username -p < Section1_datawarehousing/task1_datawarehousedesign/schema.sql
   ```

2. **Task 2 - ETL Process:**
   - Place `online_retail.csv` in `task2_etlprocess/` directory
   - Open `etl_retail.ipynb` in Jupyter Notebook
   - Run all cells sequentially
   - Output: `retail_dw.db` created

3. **Task 3 - OLAP Analysis:**
   - Ensure `retail_dw.db` exists from Task 2
   - Open `olap_analysis.ipynb`
   - Run all cells to generate visualizations and analysis
   - Review `analysis_report.pdf` for business insights

### Section 2: Data Mining

1. **Task 1 - Preprocessing:**
   - Open `preprocessing_iris.ipynb`
   - Run all cells (Iris dataset loads automatically from scikit-learn)
   - Output: `iris_preprocessed.csv` and visualization images

2. **Task 2 - Clustering:**
   - Ensure `iris_preprocessed.csv` exists from Task 1
   - Open `clustering_iris.ipynb`
   - Run all cells for K-Means analysis
   - Review `clustering_report.pdf` for detailed analysis

3. **Task 3 - Classification and Association Rules:**
   - Open `mining_iris_basket.ipynb`
   - Run all cells for both Part A and Part B
   - Review `analysis_report.pdf` for findings

---

## Key Learnings

### Data Warehousing

1. **Star Schema Design:** Denormalized structures optimize analytical query performance
2. **ETL Processes:** Data quality and transformation logic are critical for reliable analytics
3. **OLAP Operations:** Multidimensional analysis reveals business patterns invisible in raw data
4. **Product Categorization:** ML techniques (TF-IDF + KMeans) can automate taxonomy creation

### Data Mining

1. **Preprocessing Importance:** Normalization and proper data preparation significantly impact model performance
2. **Clustering Validation:** Multiple metrics (ARI, Silhouette, Elbow) provide robust cluster validation
3. **Model Selection:** Algorithm choice depends on data characteristics and business requirements
4. **Association Rules:** Transaction patterns enable targeted marketing and inventory optimization

---

## Business Impact

### Data Warehousing Insights

- **Revenue Concentration Risk:** 69% dependency on UK market requires diversification strategy
- **Seasonal Planning:** Q4 represents 33% of annual revenue, demanding 150-200% capacity increases
- **Category Opportunities:** Premium categories (Home Metal Decor, Fashion Accessories) show untapped pricing power
- **Market Expansion:** Netherlands, Germany, France present growth opportunities with stable performance

### Data Mining Applications

- **Customer Segmentation:** 88.67% clustering accuracy enables automated market segmentation
- **Predictive Classification:** 83.3% species prediction accuracy demonstrates viability for automated identification
- **Cross-Selling:** Association rules generate estimated $832K annual incremental revenue chain-wide
- **Inventory Optimization:** 100% confidence rules enable predictive stock management

---

## Conclusion

This project demonstrates end-to-end implementation of data warehousing and data mining techniques, bridging theoretical concepts with practical business applications. The combination of structured data warehousing (for historical analysis) and data mining (for pattern discovery and prediction) provides a comprehensive framework for data-driven decision making.

Key achievements include:
- Functional star schema data warehouse with 300K+ sales transactions
- Successful ETL pipeline processing 540K+ records with automated categorization
- OLAP analysis revealing critical business patterns and seasonal trends
- 88.67% unsupervised clustering accuracy matching biological classifications
- 83.3% supervised classification accuracy for species prediction
- High-value association rules with 3x lift and 100% confidence

These implementations showcase practical skills in database design, Python programming, statistical analysis, machine learning, and business intelligence—essential competencies for data professionals in modern organizations.

---

## References

- UCI Machine Learning Repository: Online Retail Dataset
- Scikit-learn Documentation: Iris Dataset and ML Algorithms
- MLxtend Library: Apriori Algorithm Implementation
- Fisher, R.A. (1936): "The use of multiple measurements in taxonomic problems"

---

## Contact

For questions or clarifications about this project, please contact aimemuganga07@gmail.com.

**Project Completed:** December 2025
