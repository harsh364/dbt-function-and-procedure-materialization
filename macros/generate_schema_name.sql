{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == "prod" -%}

        prod_reports

    {%- elif target.name == "dev" -%}

        dev_reports
    {%- elif target.name == "uat" -%}

        uat_reports
    {%- elif target.name == "stg" -%}

        stg_reports

    {%- endif -%}

{%- endmacro %}