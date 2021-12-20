SELECT
    metrics_by_context.*,
    top_exporters.volume_top_5_pct,
    top_exporters.commodity_deforestation_risk_top_5_pct
FROM {{ ref("metrics_by_context") }} metrics_by_context
LEFT JOIN {{ ref("top_exporters") }} top_exporters
          ON
        metrics_by_context.sk_context_of_import = top_exporters.sk_context_of_import
