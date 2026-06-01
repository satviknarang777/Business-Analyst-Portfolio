/*Query 5: Accounts Above Average MRR Using CTE

Business Question:
Which accounts generate above-average revenue?

Business Value:
Helps identify high-value customers who contribute
more revenue than the average account and may
require additional retention focus.

Business Interpretation:
Several accounts generate significantly more revenue
than the average customer. These accounts represent
a valuable portion of the customer base and contribute
a disproportionate share of recurring revenue.

Recommendation:
Monitor high-value accounts closely and maintain
strong customer relationships through proactive
engagement and support. Retaining these customers
can have a greater impact on revenue than acquiring
multiple lower-value accounts.
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

SELECT *
FROM account_mrr
WHERE total_mrr > (
SELECT AVG(total_mrr)
FROM account_mrr)
ORDER BY total_mrr DESC;