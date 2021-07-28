{{ config(schema="_AIRBYTE_TEST_NORMALIZATION", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'ID',
        'CURRENCY',
        ADAPTER.QUOTE('DATE'),
        ADAPTER.QUOTE('HKD@__TERS'),
        'HKD___TERS',
        'NZD',
        'USD',
    ]) }} as _AIR__SHID
from {{ ref('EXCH__RATE_AB2') }}
-- EXCH__RATE

