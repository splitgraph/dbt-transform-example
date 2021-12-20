SELECT
    *,
    country_of_import || '_' || commodity || '_IMPORT_' || year::varchar AS sk_context_of_import
FROM {{ source("trase_supply_chains", "supply-chains") }}
WHERE TRUE
    AND country_of_import != country_of_production  -- no domestic flows
