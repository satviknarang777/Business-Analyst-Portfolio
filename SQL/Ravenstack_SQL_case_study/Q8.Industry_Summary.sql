/*Query 8: Multi-Metric Industry Summary

Business Question:
What is the overall performance of each industry segment?

Business Value:
Provides a consolidated view of customer count,
subscription volume, revenue, ARR, and churn,
helping compare the overall performance of
different industries.

Business Interpretation:
FinTech generates the highest MRR and ARR among
all industries while maintaining a relatively
lower churn rate. DevTools and Cybersecurity also
contribute significant revenue but experience
higher churn rates. EdTech has the lowest churn
rate, while HealthTech generates comparatively
lower revenue despite having a similar customer
base to other industries.

Recommendation:
Continue investing in high-performing industries
such as FinTech while investigating the factors
driving higher churn in DevTools and Cybersecurity.
Identify successful practices from lower-churn
industries and explore opportunities to improve
retention across all segments.
*/

SELECT
a.industry,
COUNT(DISTINCT a.account_id) AS total_accounts,
COUNT(s.subscription_id) AS total_subscriptions,
SUM(s.mrr_amount) AS total_mrr,
SUM(s.arr_amount) AS total_arr,
SUM(CASE WHEN s.churn_flag = 'True' THEN 1 ELSE 0 END) AS churned_subscriptions,
ROUND((SUM(CASE WHEN s.churn_flag = 'True' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.subscription_id),2) AS churn_rate
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id
GROUP BY a.industry
ORDER BY total_arr DESC;