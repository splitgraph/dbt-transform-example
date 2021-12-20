SELECT
    sk_context_of_import,
    country_of_import,
    commodity,
    "year",
    array_agg(
        DISTINCT country_of_production ORDER BY country_of_production
    ) AS countries_of_production,
    array_agg(DISTINCT product_type ORDER BY product_type) AS product_types,
    array_agg(DISTINCT scale ORDER BY scale) AS scales,
    array_agg(DISTINCT "version" ORDER BY "version") AS "versions",
    sum(volume) AS volume,
    -- how to distinguish zeros from nulls? other metrics too
    sum(commodity_deforestation_risk) AS commodity_deforestation_risk,
    sum(commodity_emissions_risk) AS commodity_emissions_risk,
    sum(fob) AS fob,
    --- ... other metrics here
    count(DISTINCT exporter_group_id) AS exporter_groups_count,
    count(DISTINCT importer_group_id) AS importer_groups_count
-- metrics about deforestation concentration? how much is concentrated in top 10 exporters? etc.
FROM {{ ref("base") }}
GROUP BY 1, 2, 3, 4
ORDER BY 1, 2, 3, 4
