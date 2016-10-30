- view: maritalstatus
  sql_table_name: public.maritalstatus
  fields:

  - dimension: code
    type: string
    sql: ${TABLE}.code

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - measure: count
    type: count
    drill_fields: []

