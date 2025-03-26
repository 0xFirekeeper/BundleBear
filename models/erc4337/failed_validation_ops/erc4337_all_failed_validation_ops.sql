{{ config
(
    materialized = 'table',
    copy_grants=true
)
}}

SELECT  *, 'arbitrum' AS chain FROM {{ ref('erc4337_arbitrum_failed_validation_ops') }}
UNION ALL
SELECT  *, 'avalanche' AS chain FROM {{ ref('erc4337_avalanche_failed_validation_ops') }}
UNION ALL
SELECT  *, 'base' AS chain FROM {{ ref('erc4337_base_failed_validation_ops') }}
UNION ALL
SELECT  *, 'ethereum' AS chain FROM {{ ref('erc4337_ethereum_failed_validation_ops') }}
UNION ALL
SELECT  *, 'optimism' AS chain FROM {{ ref('erc4337_optimism_failed_validation_ops') }}
UNION ALL
SELECT  *, 'polygon' AS chain FROM {{ ref('erc4337_polygon_failed_validation_ops') }}
UNION ALL
SELECT  *, 'bsc' AS chain FROM {{ ref('erc4337_bsc_failed_validation_ops') }}
UNION ALL
SELECT  *, 'linea' AS chain FROM {{ ref('erc4337_linea_failed_validation_ops') }}
UNION ALL
SELECT  *, 'celo' AS chain FROM {{ ref('erc4337_celo_failed_validation_ops') }}
UNION ALL
SELECT  *, 'arbitrum_nova' AS chain FROM {{ ref('erc4337_arbitrum_nova_failed_validation_ops') }}
UNION ALL
SELECT  *, 'gnosis' AS chain FROM {{ ref('erc4337_gnosis_failed_validation_ops') }}
UNION ALL
SELECT  *, 'worldchain' AS chain FROM {{ ref('erc4337_worldchain_failed_validation_ops') }}