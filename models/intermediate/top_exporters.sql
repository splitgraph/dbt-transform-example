SELECT
    sk_context_of_import,
    sum(
        CASE WHEN volume_rank <= 5 THEN volume_pct ELSE 0 END
    ) AS volume_top_5_pct,
    sum(
        CASE
            WHEN
                commodity_deforestation_risk_rank <= 5 THEN commodity_deforestation_risk_pct
            ELSE 0
        END
    ) AS commodity_deforestation_risk_top_5_pct
FROM {{ ref("exporter_ranking") }}
GROUP BY 1
