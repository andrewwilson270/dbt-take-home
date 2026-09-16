{{
    config(
        materialized = 'view',
        description = 'Granular items data'
    )
}}

SELECT
    --ids
    id AS item_id,
    remote_id AS item_remote_id,
    company_detail_id,

    --strings
    name AS item_name,

    --dates/timestamps
    _updated_at AS system_updated_datetime

FROM {{ source('accounting_system','items') }}
