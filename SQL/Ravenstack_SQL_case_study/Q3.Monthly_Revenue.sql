/*Query 3: Monthly Churn Trend

Business Question:
How has churn volume changed month over month?

Business Value:
Helps identify churn patterns over time and
highlights periods where customer attrition
increases significantly.

Business Interpretation:
Churn remained relatively stable during the
first half of the year but increased sharply
from August onwards. The highest churn was
recorded in December, indicating a significant
rise in customer attrition toward the end of
the year.

Recommendation:
Investigate the factors contributing to the
increase in churn during the later months of
the year. Review customer feedback, renewal
patterns, pricing changes, and product usage
to identify potential causes and reduce future
customer losses.
*/

SELECT
MONTHNAME(end_date) AS month,
COUNT(subscription_id) AS churned_subscriptions
FROM subscriptions
WHERE churn_flag = 'True'
GROUP BY MONTH(end_date), MONTHNAME(end_date)
ORDER BY MONTH(end_date);