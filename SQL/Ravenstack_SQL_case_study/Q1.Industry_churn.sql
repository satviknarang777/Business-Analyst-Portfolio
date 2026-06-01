/*Query 1: Industry-wise Churn Rate Analysis

Business Question:
Which industries have the highest churn rate?

Business Value:
Helps identify industries where customers are
leaving at a higher rate, enabling targeted
retention strategies and churn reduction efforts.

Business Interpretation:
DevTools has the highest churn rate, followed by
Cybersecurity and HealthTech. Customers in these
industries are leaving more frequently than others
and may require further investigation.

Recommendation:
Analyze customer feedback, product usage, pricing,
and support experience in the highest-churn
industries and implement targeted retention
strategies where needed.*/

select
a.industry,
count(s.subscription_id) as total_subscriptions,
sum(case when s.churn_flag = 'True' then 1 else 0 end) as total_churned_subscriptions,
round(((sum(case when s.churn_flag = 'True' then 1 else 0 end))*100)/(count(s.subscription_id)),2) as churn_rate
from accounts a 
join subscriptions s
on a.account_id = s.account_id
group by a.industry
order by churn_rate desc;
