{{
    config(
        materialized = 'view',
        description = 'Granular Invoice line items data'
    )
}}

SELECT
    --ids
    ii.invoice_items_id,
    ii.invoice_id,
    it.item_id,
    i.customer_remote_id,
    i.subsidiary_id,
    i.company_detail_id,
    i.check_remit_item_id,
    i.external_system_id

    --strings
    i.currency_iso3_code,
    it.item_name,

    --numbers
    ii.quantity,
    ii.unit_price,
    ii.total_amount,

    --dates/timestamps
    i.invoice_paid_on_date
    i.invoice_created_datetime

FROM {{ ref('stg_accounting_system__invoices') }} i
INNER JOIN  {{ ref('stg_accounting_system__invoice_items') }} ii
    ON i.invoice_id = ii.invoice_id
INNER JOIN  {{ ref('stg_accounting_system__items') }} it
    ON ii.item_remote_id = it.item_remote_id
