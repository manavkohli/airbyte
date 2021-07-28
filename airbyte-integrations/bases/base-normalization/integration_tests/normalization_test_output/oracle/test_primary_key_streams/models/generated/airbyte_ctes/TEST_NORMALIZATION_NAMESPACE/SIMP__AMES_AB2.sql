{{ config(schema="_AIRBYTE_TEST_NORMALIZATION_NAMESPACE", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(ID as {{ dbt_utils.type_string() }}) as ID,
    cast({{ ADAPTER.QUOTE('DATE') }} as {{ dbt_utils.type_string() }}) as {{ ADAPTER.QUOTE('DATE') }},
    _airbyte_emitted_at
from {{ ref('SIMP__AMES_AB1') }}
-- SIMP__AMES

