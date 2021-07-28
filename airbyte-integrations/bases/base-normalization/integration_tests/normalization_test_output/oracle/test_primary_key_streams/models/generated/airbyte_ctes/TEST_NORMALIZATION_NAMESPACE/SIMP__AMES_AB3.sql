{{ config(schema="_AIRBYTE_TEST_NORMALIZATION_NAMESPACE", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'ID',
        ADAPTER.QUOTE('DATE'),
    ]) }} as _AIR__SHID
from {{ ref('SIMP__AMES_AB2') }}
-- SIMP__AMES

