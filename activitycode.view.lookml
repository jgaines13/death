- view: activitycode
  sql_table_name: public.activitycode
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

