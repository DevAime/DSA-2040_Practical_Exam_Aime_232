## Star Schema Design Explanation

We chose a star schema over a snowflake schema for this retail data warehouse because it provides better query performance through simplified joins and is easier to understand for business users. The denormalized structure of dimension tables in a star schema means that analytical queries require fewer joins, resulting in faster response times for business intelligence reports. Additionally, the star schema's simpler structure makes it more maintainable and reduces the complexity of ETL processes, which is particularly beneficial for a retail environment where quick access to sales trends and customer analytics is crucial.

This design includes:

SalesFact table with measures (Quantity, SalesAmount, Discount, NetSales)
CustomerDim for customer demographics analysis
ProductDim for product and category analysis
TimeDim for temporal analysis (quarters, years)

The indexes are added to optimize the common queries mentioned in the requirements (sales by product category per quarter, customer demographics, etc.).