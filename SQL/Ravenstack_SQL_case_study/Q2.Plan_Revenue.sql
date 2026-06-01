/*Query 2: Plan Tier Revenue Contribution

Business Question:
Which plan tier generates the most MRR?

Business Value:
Helps identify which subscription plans contribute
the most to recurring revenue so that retention,
pricing, and growth strategies can be prioritized
accordingly.

Business Interpretation:
The Enterprise plan generates nearly 75% of the
company's total MRR, making it the largest revenue
contributor by a significant margin. While the Pro
and Basic plans have a similar number of subscriptions,
their contribution to overall revenue is much lower.

Recommendation:
Focus on retaining Enterprise customers as they have
the highest impact on revenue. Additionally, identify
opportunities to upsell Basic and Pro customers to
higher-tier plans to increase overall MRR.
*/

SELECT
plan_tier,
COUNT(subscription_id) AS total_subscriptions,
SUM(mrr_amount) AS total_mrr,
ROUND(
(SUM(mrr_amount) * 100.0) /
(SELECT SUM(mrr_amount) FROM subscriptions),2) AS revenue_contribution_percentage
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_mrr DESC;