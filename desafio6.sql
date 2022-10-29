SELECT
  ROUND(MIN(plan_value), 2) AS faturamento_minimo,
  ROUND(MAX(plan_value), 2) AS faturamento_maximo,
  ROUND(AVG(plan_value), 2) AS faturamento_medio,
  ROUND(SUM(plan_value), 2) AS faturamento_total
FROM SpotifyClone.plan AS plan
INNER JOIN SpotifyClone.users AS users
  ON plan.plan_id = users.plan_id;