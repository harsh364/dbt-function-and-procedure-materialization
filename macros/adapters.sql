{% macro create_procedure(relation, sql) -%}

  create or replace procedure {{ relation }}({{config.get('parameters')}})
  {{ bigquery_table_options(config, model, temporary=false) }}
    BEGIN
    {{ sql }};
    END;
{% endmacro %}