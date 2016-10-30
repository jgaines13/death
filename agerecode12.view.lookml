- view: agerecode12
  sql_table_name: public.agerecode12
  fields:

  - dimension: code
    type: number
    sql: ${TABLE}.code

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - measure: count
    type: count
    drill_fields: []

