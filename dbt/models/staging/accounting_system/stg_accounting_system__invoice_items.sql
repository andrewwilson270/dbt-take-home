{{
    config(
        materialized = 'view',
        description = 'Granular invoice items data'
    )
}}

SELECT
    --ids
    id AS invoice_items_id,
    invoice_id,
    item_remote_id,

    --numbers
    quantity,
    unit_price,
    total_amount,

    --dates/timestamps
    _updated_at AS system_updated_datetime

FROM {{ source('accounting_system','invoice_items') }}
