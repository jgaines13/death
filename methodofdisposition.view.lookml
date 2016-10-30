- view: methodofdisposition
  sql_table_name: public.methodofdisposition
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

