/*
Question: What is the month with the most total revenue across all locations?
- Identify the month with the highest total revenue across all product categories.
- Focuses on understanding overall seasonal trends to optimize promotional strategies.
- BONUS: Suggest promotions for months with lower sales to boost overall revenue.
- Why? Helps in planning and executing targeted promotions during low-revenue months to maximize revenue across all product categories.
*/

SELECT
    transaction_month,
    SUM(transactions.transaction_qty * unit_price) AS total_revenue
FROM
    transaction_details
JOIN
    transactions
    ON transaction_details.transaction_id = transactions.transaction_id
GROUP BY
    transaction_month
ORDER BY
    total_revenue DESC;

/*
Analysis:

Question: What is the month with the most total revenue across all locations?
- June: Highest total revenue with $166,485.88. This suggests that late spring and early summer 
    may bring higher consumer spending, possibly due to outdoor events, tourism, and increased demand for cold beverages like iced coffees and tea.
- May: Total revenue of $156,727.76.
- April: With $118,941.08.
- March: Total revenue of $98,834.68.
- January: Revenue of $81,677.74, which may reflect post-holiday sales or new year promotions, but still lower than spring and summer months, 
    likely due to winter slowdown in consumer spending from the holidays.
- February: The lowest total revenue at $76,145.19, likely due to the post-holiday lull and fewer special events or holidays that drive higher sales.

Key Insights:
- June is the clear peak month for revenue, likely driven by warmer weather, outdoor activities, and seasonal demand for beverages. 
    To optimize sales, promotions targeting outdoor or summer-themed products could be emphasized.
- May and April show strong performance, indicating that spring months are a time of high consumer spending. 
    Thus, offering early summer promotions or discounts could help maintain this momentum.
- January and February show a decrease in revenue, especially February. 
    Targeted campaigns offering discounts or focusing on post-holiday consumer needs could help boost sales in these slower months.
- Overall, there is a steady increase in revenue from January to June, at a rate of approximately 118% from the initial monthly count.
    The dataset provided may or may not assume the launch of a new cafe franchise, indicating the progression of sales and attention.
    Regardless, the business is doing well in terms of revenue growth.
Why: Understanding seasonal revenue patterns allows businesses to optimize their promotional strategies by targeting the months with lower sales 
    and capitalizing on high-revenue months with seasonal or event-driven promotions.
*/
