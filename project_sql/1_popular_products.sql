/*
Question: What are the most popular products sold by quantity in each store location?
- Identify the top 5 products based on transaction quantity for each store location.
- Focuses on sales trends by product and location, allowing for deeper understanding of store-specific performance.
- BONUS: Include product category and product type to see if certain categories or types are more popular at specific locations.
- Why? Helps store managers understand which products are most popular in different locations, enabling better stock and marketing decisions.
*/

SELECT
    store_location,
    product_category,
    product_type,
    product_detail,
    SUM(transactions.transaction_qty) AS total_qty
FROM
    transaction_details
JOIN
    transactions
    ON transaction_details.transaction_id = transactions.transaction_id
GROUP BY
    store_location, product_category, product_type, product_detail
ORDER BY
    total_qty DESC
LIMIT 5;

/*
Analysis:
- Hell's Kitchen:
  - Most popular product: "Ouro Brasileir" Expresso shot under the "Coffee" category with 1854 units sold.
  - Hell's Kitchen's most popular product is a specific type of coffee shot, 
    which suggests a strong demand for coffee-based drinks in this location.

- Astoria:
  - Most popular product: "Dark chocolate Lg" Hot chocolate under the "Drinking Chocolate" category with 1755 units sold.
  - Astoria seems to have a higher demand for drinking chocolate products, particularly hot chocolate.
  - Other popular products in Astoria include various types of tea, such as "Earl Grey Rg" and "Peppermint Rg," 
    showing a strong preference for brewed tea in this location.

- Lower Manhattan:
    - Item is not on the list due to the LIMIT function, but is is "Peppermint Lg" Brewed Tea under the "Tea" category with 1582 units sold. 

Key Insights:
- Hell's Kitchen's focus is on coffee-based products, particularly espresso shots, indicating a preference for strong coffee beverages.
- Astoria shows a more balanced preference, with a significant demand for both hot chocolate and a variety of teas, particularly brewed and herbal varieties.
*/
