SELECT
    sk_context_of_import,
    exporter_group,
    sum(volume) AS volume,
    sum(commodity_deforestation_risk) AS commodity_deforestation_risk
FROM {{ ref('base') }}
GROUP BY 1, 2
