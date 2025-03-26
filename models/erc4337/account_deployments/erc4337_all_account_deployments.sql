{{ config
(
    materialized = 'table',
    copy_grants=true
)
}}

SELECT  *, 'arbitrum' AS chain FROM {{ ref('erc4337_arbitrum_account_deployments') }}
UNION ALL
SELECT  *, 'avalanche' AS chain FROM {{ ref('erc4337_avalanche_account_deployments') }}
UNION ALL
SELECT  *, 'base' AS chain FROM {{ ref('erc4337_base_account_deployments') }}
UNION ALL
SELECT  *, 'ethereum' AS chain FROM {{ ref('erc4337_ethereum_account_deployments') }}
UNION ALL
SELECT  *, 'optimism' AS chain FROM {{ ref('erc4337_optimism_account_deployments') }}
UNION ALL
SELECT  *, 'polygon' AS chain FROM {{ ref('erc4337_polygon_account_deployments') }}
UNION ALL
SELECT  *, 'bsc' AS chain FROM {{ ref('erc4337_bsc_account_deployments') }}
UNION ALL
SELECT  *, 'linea' AS chain FROM {{ ref('erc4337_linea_account_deployments') }}
UNION ALL
SELECT  *, 'celo' AS chain FROM {{ ref('erc4337_celo_account_deployments') }}
UNION ALL
SELECT  *, 'arbitrum_nova' AS chain FROM {{ ref('erc4337_arbitrum_nova_account_deployments') }}
UNION ALL
SELECT  *, 'gnosis' AS chain FROM {{ ref('erc4337_gnosis_account_deployments') }}
UNION ALL
SELECT  *, 'worldchain' AS chain FROM {{ ref('erc4337_worldchain_account_deployments') }}