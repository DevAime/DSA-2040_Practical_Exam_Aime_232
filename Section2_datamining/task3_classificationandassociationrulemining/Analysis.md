# Analysis of Results

## Part A: Classification Models (Decision Tree vs KNN)

### Overview

In Part A, two supervised machine learning models were trained and evaluated: a **Decision Tree classifier** and a **K-Nearest Neighbors (KNN) classifier**. Model performance was assessed using accuracy and a detailed classification report including precision, recall, and F1-score.

### Decision Tree Results

* **Accuracy:** 0.80 (80%)
* The model correctly classified 24 out of 30 instances.
* Class `2` dominates the dataset, with a recall of **0.80** and an F1-score of **0.89**, indicating that the model performs reasonably well in identifying this class.
* Class `1` has **zero support**, meaning there were no samples of this class in the test set. As a result, precision, recall, and F1-score for this class are all 0.00.

**Interpretation:**
The Decision Tree model shows good overall accuracy, but its evaluation is limited by class imbalance. Since only one class is present in the test data, the reported accuracy mainly reflects how well the model predicts the majority class rather than its ability to generalize across multiple classes.

### KNN Results

* **Accuracy:** 0.83 (83.33%)
* The KNN model slightly outperforms the Decision Tree in terms of accuracy.
* For class `2`, the recall increased to **0.83** and the F1-score to **0.91**, showing improved predictive performance.
* Similar to the Decision Tree, class `1` has zero support, leading to zero values for its metrics.

**Observation:**
KNN demonstrates better performance than the Decision Tree on this dataset. However, the same limitation applies: the absence of class `1` samples in the test set prevents a complete and fair evaluation of the classifier’s discriminative ability.

### Comparison and Conclusion

* KNN performs slightly better than the Decision Tree based on accuracy and F1-score.
* Both models suffer from **class imbalance**, which reduces the reliability of macro-averaged metrics.
* To improve evaluation quality, future work should ensure balanced class representation or apply techniques such as stratified sampling.

---

## Part B: Association Rule Mining Using Apriori

### Transaction Data

A synthetic transactional dataset was generated, where each transaction contains a subset of items such as *milk, bananas, beer, diapers,* and *baby_food*. These transactions simulate customer purchase behavior in a retail setting.

### One-Hot Encoding

Before applying the Apriori algorithm, transactions were converted into a **one-hot encoded format**, where:

* Each row represents a transaction.
* Each column represents an item from a pool of 20 items.
* Boolean values (`True` / `False`) indicate whether an item was purchased in a given transaction.

**Purpose:**
This transformation is required because the Apriori algorithm operates on binary transactional data.

### Frequent Itemsets (Apriori Output)

Using the Apriori algorithm, frequent itemsets were identified based on minimum support thresholds.

Key observations:

* Single items such as **butter**, **baby_food**, and **cheese** show relatively high support values (above 0.55).
* The itemset **(cheese, butter)** appears frequently together, indicating a strong co-occurrence pattern.
* **Bananas** also emerge as a commonly purchased item.

**Observation:**
Items with high support represent popular products, while multi-item sets reveal products that are often bought together.

### Association Rules

Association rules were generated from the frequent itemsets using confidence and lift as evaluation metrics.

Key rules identified:

* Customers who buy **bananas and milk** are very likely to also buy **diapers** (confidence = 1.0, lift = 3.0).
* The combination of **baby_food, bananas, and milk** strongly implies the purchase of **diapers**.
* A lift value of **3.0** across several rules indicates a strong positive association, meaning these items are purchased together much more frequently than expected by chance.

**Interpretation:**
These rules highlight meaningful purchasing patterns, especially for household and baby-related products. Such insights can be used for product bundling, targeted promotions, and shelf placement strategies.

### Conclusion (Part B)

* Apriori successfully identified frequent items and strong association rules.
* The strongest relationships involve **diapers, baby_food, milk, and bananas**, reflecting realistic consumer behavior.
* Association rule mining proves effective for uncovering hidden patterns in transactional data that are not captured by traditional predictive models.

---