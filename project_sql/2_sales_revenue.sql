/*
Question: What is the average sales revenue per product category per store location?
- Calculate the average sales revenue for each product category at each store location.
- Focuses on revenue generation trends by category and location.
- BONUS: Include average unit price for each category to see how pricing affects sales.
- Why? Helps identify which product categories contribute the most to revenue at specific locations, aiding in sales strategy and pricing.
*/

SELECT
    store_location,
    product_category,
    ROUND(AVG(unit_price * transactions.transaction_qty),2) AS avg_revenue,
    ROUND(AVG(unit_price),2) AS avg_unit_price,
    SUM(unit_price * transactions.transaction_qty) AS total_revenue_per_unit

FROM
    transactions
JOIN
    transaction_details
    ON transactions.transaction_id = transaction_details.transaction_id
GROUP BY
    store_location, product_category
ORDER BY
    total_revenue_per_unit DESC;

/*
Analysis:

Question: What is the average sales revenue per product category per store location?
- Coffee: The average revenue for Coffee at Hell's Kitchen is $4.52, at Astoria is $4.48, and at Lower Manhattan is $4.89. 
    Hell's Kitchen has the highest total revenue per unit ($91,222.65), followed by Astoria ($89,744.30) and Lower Manhattan ($88,985.50).
- Tea: Tea has an average revenue of $4.17 at Astoria, $4.24 at Hell's Kitchen, and $4.59 at Lower Manhattan. 
    Lower Manhattan has the highest total revenue per unit for Tea ($63,864.75).
- Bakery: The average revenue for Bakery is relatively similar across all locations, with Hell's Kitchen and Astoria 
    averaging around $3.60 and Lower Manhattan averaging $3.59. 
    Hell's Kitchen has the highest total revenue per unit ($27,386.95).
- Drinking Chocolate: Drinking Chocolate shows high average revenues with Hell's Kitchen at $6.27, Astoria at $6.12, and Lower Manhattan at $6.61. 
    Lower Manhattan leads in total revenue per unit ($22,494.50).
- Coffee Beans: Hell's Kitchen leads with the highest average revenue ($25.88) and total revenue per unit ($18,635.10).
    Lower Manhattan and Astoria follow with $21.15 and $20.36 respectively.
- Branded: The average revenue for Branded items is highest in Astoria ($19.56) and Hell's Kitchen ($16.32). 
    Astoria also has the highest total revenue per unit ($5,457.00).
- Flavours: Add-on Flavours have very low average revenue, with Hell's Kitchen at $1.21 and Lower Manhattan at $1.29. 
    Both locations have low total revenue per unit, with Hell's Kitchen leading at $2,876.80.
- Loose Tea: The average revenue for Loose Tea is around $9.20 to $9.34 across locations. 
    Lower Manhattan and Hell's Kitchen have relatively similar total revenue per unit, around $3,558.25 and $4,461.35, respectively.
- Packaged Chocolate: Packaged Chocolate's average revenue is highest in Astoria ($9.91) and Hell's Kitchen ($8.62), 
    with the highest total revenue per unit at Hell's Kitchen ($1,698.77).

Key Insights:
- Coffee dominates the highest revenue generation, particularly at Hell's Kitchen and Astoria. 
    This is the product category that contributes towards the most revenue in these locations.
- Lower Manhattan has been consistently the top performer for Tea, Bakery, Drinking Chocolate, and Loose Tea.
- High-priced products such as Coffee Beans show significant revenue generation at Hell's Kitchen, 
    highlighting this location's success in selling premium products.
- Flavours and Branded products generate lower revenue but still contribute meaningfully in their respective locations.
- The average unit price generally correlates with revenue, with higher-priced items like Coffee Beans, Drinking Chocolate, 
    and Branded products seeing higher average revenues. However, revenue can fluctuate due to store locations, such as 
    Hell's Kitchen having a higher population count and tourist tractions.

Why: Understanding revenue patterns across product categories and locations can allow businesses 
    to focus on products that drive the most revenue, identify areas for pricing adjustments, 
    and target stores that may need strategic marketing or promotional focus to boost lower-performing products.
*/



