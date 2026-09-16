{{
    config(
        materialized = 'view',
        description = 'Granular invoice data'
    )
}}

SELECT
    --ids
    id AS invoice_id,
    customer_remote_id,
    subsidiary_id,
    company_detail_id,
    check_remit_item_id,
    number AS external_system_id,

    --strings
    currency AS currency_iso3_code,

    --dates/timestamps
    paid_on_date::date AS invoice_paid_on_date,
    created_at AS invoice_created_datetime,
    _updated_at AS system_updated_datetime

FROM {{ source('accounting_system','invoices') }}
