
{% macro bigquery__handle_existing_table_sp(full_refresh, old_relation) %}
    {%- if full_refresh -%}
      {{ adapter.drop_relation(old_relation) }}
    {%- else -%}
      {{ exceptions.relation_wrong_type(old_relation, 'procedure') }}
    {%- endif -%}
{% endmacro %}


{% materialization stored_procedure, adapter='bigquery' -%}
    {{ return(create_or_replace_procedure(run_outside_transaction_hooks=False)) }}
{%- endmaterialization %}
