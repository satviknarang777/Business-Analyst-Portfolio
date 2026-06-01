/*Query 7: Monthly Churn vs Average Churn Using CTE

Business Question:
Which months had higher-than-average churn?

Business Value:
Helps identify periods where customer churn was
significantly above normal levels and may require
further investigation.

Business Interpretation:
The average monthly churn is 40.5 subscriptions.
Churn remained below average for most of the year
but increased sharply in October, November, and
especially December. These months experienced
significantly higher customer losses compared to
the yearly average.

Recommendation:
Investigate the reasons behind the increase in churn
during the final months of the year. Understanding
what changed during this period can help reduce
future churn and improve customer retention.
*/

WITH monthly_churn AS (
SELECT
MONTHNAME(end_date) AS month,
MONTH(end_date) AS month_number,
COUNT(subscription_id) AS churned_subscriptions
FROM subscriptions
WHERE churn_flag = 'True'
GROUP BY MONTH(end_date), MONTHNAME(end_date)
)

SELECT
month,
churned_subscriptions,
ROUND((SELECT
AVG(churned_subscriptions)
FROM monthly_churn),2) AS average_monthly_churn
FROM monthly_churn
ORDER BY month_number;