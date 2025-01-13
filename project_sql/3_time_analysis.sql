/*
Question: What is the peak sales time for each product category across all locations?
- Identify the peak sales time (hour) for each product category based on transaction quantities.
- Focuses on understanding the time-based trends in product sales across all locations.
- Why? Provides insights into the best times to promote certain products, allowing for better targeted marketing or staffing strategies.
*/
SELECT
    DISTINCT product_category,
    CASE
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 6 AND 7 THEN '6 AM - 7 AM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 8 AND 9 THEN '8 AM - 9 AM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 10 AND 11 THEN '10 AM - 11 AM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 12 AND 13 THEN '12 PM - 1 PM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 14 AND 15 THEN '2 PM - 3 PM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 16 AND 17 THEN '4 PM - 5 PM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 18 AND 19 THEN '6 PM - 7 PM'
        WHEN EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 20 AND 21 THEN '8 PM - 9 PM'
        ELSE 'Other Hours'
    END AS time_interval,
    SUM(transactions.transaction_qty) AS total_qty
FROM
    transactions
JOIN
    transaction_details
    ON transactions.transaction_id = transaction_details.transaction_id
WHERE 
    EXTRACT(HOUR FROM TO_TIMESTAMP(transaction_hour, 'HH:MI AM')) BETWEEN 6 AND 21 -- Filter only 6 AM to 9 PM
GROUP BY
    product_category, time_interval
ORDER BY
    total_qty DESC;

/*
Analysis:

Question: What is the peak sales time for each product category across all locations?
- Coffee: Peak sales time is 8 AM - 9 AM with 20,366 units sold. Significant secondary peaks occur at 10 AM - 11 AM and 4 PM - 5 PM.
- Tea: Peak sales time is 8 AM - 9 AM with 16,178 units sold. A secondary peak occurs at 10 AM - 11 AM.
- Bakery: Peak sales time is 8 AM - 9 AM with 5,901 units sold. Secondary peak in 10 AM - 11 AM.
- Drinking Chocolate: Peak sales time is 8 AM - 9 AM with 3,840 units sold.
- Flavours: Peak sales time is 8 AM - 9 AM with 3,001 units sold, with a secondary peak at 10 AM - 11 AM.
- Other products (Coffee beans, Loose Tea, Branded, and Packaged Chocolate) show peak sales in the morning, especially from 8 AM - 9 AM.

Key Insights:
- The highest sales volume for most categories occurs during the 8 AM - 9 AM time slot, particularly for Coffee and Tea. 
    Indicating a strong morning demand, which could be leveraged for promotions, inventory, and staffing adjustments.
- Secondary peaks are observed for Coffee (10 AM - 11 AM, 4 PM - 5 PM) and Tea (10 AM - 11 AM), suggesting mid-morning and late afternoon are also important sales windows.
- Bakery products also see consistent demand in the morning (8 AM - 9 AM and 10 AM - 11 AM), indicating the importance of the early hours for purchases together with Coffee/Tea Drink categories.
- Products like Drinking Chocolate, Add-on Flavours, and Packaged Chocolate show their peaks in the morning but at a smaller scale compared to Coffee/Tea, but it makes the 8 AM - 9 AM window key for these items as well.

Why: Understanding peak sales times helps optimize marketing efforts, staffing, and inventory management. Morning hours (8 AM - 9 AM) are particularly important for Coffee, Tea, and Bakery, 
    making them ideal for promotions or targeted marketing and sales strategies.
*/
