-- query1 ans
SELECT 
    dr.region_name AS region, 
    dd.date_value, 
    COALESCE(SUM(fam.cost) / NULLIF(SUM(fam.impressions), 0) * 1000, 0) AS CPM
FROM fact_ad_metrics_daily fam
JOIN dim_date dd ON fam.date_id = dd.date_id
JOIN dim_region dr ON fam.region_id = dr.region_id
WHERE dd.date_value >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY dr.region_name, dd.date_value
ORDER BY dd.date_value, dr.region_name;


-- query2 ans
SELECT 
    da.age_range AS age_group, 
    dg.gender_name AS gender, 
    dd.date_value, 
    SUM(fam.custom_metrics->>'likes')::INT AS total_likes
FROM fact_ad_metrics_daily fam
JOIN dim_date dd ON fam.date_id = dd.date_id
JOIN dim_age_group da ON fam.age_id = da.age_id
JOIN dim_gender dg ON fam.gender_id = dg.gender_id
WHERE dd.date_value >= CURRENT_DATE - INTERVAL '14 days'
GROUP BY da.age_range, dg.gender_name, dd.date_value
ORDER BY dd.date_value, da.age_range, dg.gender_name;

-- query3 ans

SELECT 
    fam.platform_id AS account_id,
    dp.platform_name AS account_name,
    dd.date_value,
    COALESCE(SUM(fam.cost) / NULLIF(SUM(fam.clicks), 0), 0) AS CPC
FROM fact_ad_metrics_daily fam
JOIN dim_date dd ON fam.date_id = dd.date_id
JOIN dim_platform dp ON fam.platform_id = dp.platform_id
WHERE dd.date_value >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY fam.platform_id, dp.platform_name, dd.date_value
ORDER BY dd.date_value, dp.platform_name;

