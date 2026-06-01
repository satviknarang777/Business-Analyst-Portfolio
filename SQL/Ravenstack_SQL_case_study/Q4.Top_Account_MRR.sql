/*Query 4: Top 10 Accounts by MRR

Business Question:
Who are our highest-value customers?

Business Value:
Helps identify the accounts contributing the most
recurring revenue so that retention, account
management, and upselling efforts can be focused
on the most valuable customers.

Business Interpretation:
The top revenue-generating accounts contribute
significantly higher MRR compared to the rest of
the customer base. The highest-value customer
generates ₹138,060 MRR, with several other accounts
also contributing substantial recurring revenue.
EdTech and FinTech appear multiple times among the
top accounts, indicating strong revenue concentration
within these industries.

Recommendation:
Maintain strong relationships with high-value
accounts through proactive support, regular account
reviews, and targeted retention initiatives. Monitor
these customers closely, as losing even a few of
them could have a significant impact on overall
revenue.
*/

SELECT
a.account_id,
a.account_name,
a.industry,
SUM(s.mrr_amount) AS total_mrr
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id
GROUP BY a.account_id, a.account_name, a.industry
ORDER BY total_mrr DESC
LIMIT 10;