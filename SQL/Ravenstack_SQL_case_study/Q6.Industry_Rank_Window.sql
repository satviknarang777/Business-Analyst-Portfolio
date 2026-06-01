/*Query 6: Ranking Accounts by MRR Within Each Industry

Business Question:
Who are the top-performing accounts within each
industry segment?

Business Value:
Helps identify the highest revenue-generating
accounts in each industry and highlights which
customers contribute the most within their segment.

Business Interpretation:
The ranking shows the top revenue-generating
accounts within each industry based on MRR.
This makes it easier to compare customers within
the same industry and identify the accounts that
have the greatest revenue impact.

Recommendation:
Focus on retaining and strengthening relationships
with the highest-ranked accounts in each industry.
These customers contribute a significant share of
revenue within their segment and should be monitored
closely for growth and retention opportunities.
*/

WITH account_mrr AS (
SELECT
a.account_id,
a.account_name,
a.industry,
SUM(s.mrr_amount) AS total_mrr
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id
GROUP BY a.account_id, a.account_name, a.industry
)

SELECT
account_id,
account_name,
industry,
total_mrr,
RANK() OVER(
PARTITION BY industry
ORDER BY total_mrr DESC) AS industry_rank
FROM account_mrr
ORDER BY industry, industry_rank;