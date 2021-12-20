SELECT
    sk_context_of_import,
    exporter_group,
    volume,
    commodity_deforestation_risk,
    volume / nullif(
        sum(volume) OVER(PARTITION BY sk_context_of_import), 0
    ) AS volume_pct,
    rank() OVER(
        PARTITION BY sk_context_of_import ORDER BY volume DESC NULLS LAST
    ) AS volume_rank,
    commodity_deforestation_risk / nullif(
        sum(
            commodity_deforestation_risk
        ) OVER(PARTITION BY sk_context_of_import),
        0
    ) AS commodity_deforestation_risk_pct,
    rank() OVER(
        PARTITION BY
            sk_context_of_import
        ORDER BY commodity_deforestation_risk DESC NULLS LAST
    ) AS commodity_deforestation_risk_rank
FROM {{ ref("metrics_by_exporter") }}
