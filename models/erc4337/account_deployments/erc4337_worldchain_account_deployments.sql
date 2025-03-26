{{ config
(
    materialized = 'incremental',
    unique_key = ['op_hash','tx_hash']
)
}}

SELECT
    l.BLOCK_TIMESTAMP as block_time,
    l.TRANSACTION_HASH as tx_hash,
    l.PARAMS:"userOpHash"::STRING as op_hash,
    l.PARAMS:"sender"::STRING as account_address,
    l.PARAMS:"factory"::STRING as factory,
    COALESCE(f.name, 'Unknown') as factory_name,
    t.FROM_ADDRESS as bundler,
    COALESCE(b.name, 'Unknown') as bundler_name,
    l.PARAMS:"paymaster"::STRING as paymaster,
    COALESCE(pay.name, 'Unknown') as paymaster_name,
    CASE WHEN t.GAS_PRICE = 0 THEN 0 
    ELSE (t.RECEIPT_L1_FEE + (t.RECEIPT_GAS_USED*t.GAS_PRICE)) / 1e18
    END AS txn_cost,
    p.PRICE * 
    (CASE WHEN t.GAS_PRICE = 0 THEN 0 
    ELSE (t.RECEIPT_L1_FEE + (t.RECEIPT_GAS_USED*GAS_PRICE)) / 1e18 
    END) as txn_cost_usd
FROM {{ source('worldchain_decoded', 'logs') }} l
INNER JOIN {{ source('worldchain_raw', 'transactions') }} t 
    ON t.HASH = l.TRANSACTION_HASH
    AND l.NAME = 'AccountDeployed' 
    AND t.TO_ADDRESS IN
    ('0x5ff137d4b0fdcd49dca30c7cf57e578a026d2789', 
    '0x0000000071727de22e5e9d8baf0edac6f37da032',
    '0x4337084d9e255ff0702461cf8895ce9e3b5ff108')
LEFT JOIN {{ ref('erc4337_labels_factories') }} f ON f.address = l.PARAMS:"factory"::STRING
LEFT JOIN {{ ref('erc4337_labels_paymasters') }} pay ON pay.address = l.PARAMS:"paymaster"::STRING
LEFT JOIN {{ ref('erc4337_labels_bundlers') }} b ON b.address = t.FROM_ADDRESS
INNER JOIN {{ source('common_prices', 'hourly') }} p 
    ON p.TIMESTAMP = date_trunc('hour', t.BLOCK_TIMESTAMP) 
    AND p.ADDRESS = '0x0000000000000000000000000000000000000000' 
    AND CHAIN = 'ethereum'
{% if is_incremental() %}
    AND l.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
{% endif %}