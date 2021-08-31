FROM python:3.8

COPY requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir -p /app/.dbt

COPY models/ /app/models
COPY macros /app/macros
COPY dbt-package-new/relation.py /usr/local/lib/python3.8/site-packages/dbt/contracts/relation.py
COPY dbt-package-new/adapter/relation.py /usr/local/lib/python3.8/site-packages/dbt/adapters/base/relation.py
COPY dbt-package-new/impl.py /usr/local/lib/python3.8/site-packages/dbt/adapters/bigquery/impl.py
COPY dbt-package-new/connections.py /usr/local/lib/python3.8/site-packages/dbt/adapters/bigquery/connections.py
COPY dbt-package-new/stored_procedure.sql /usr/local/lib/python3.8/site-packages/dbt/include/bigquery/macros/materializations/stored_procedure.sql

WORKDIR /app


EXPOSE 8080