- view: all_causes
  sql_table_name: public.all_causes
  fields:

  - dimension: cause
    type: string
    sql: ${TABLE}.cause

  - dimension: code
    type: string
    sql: ${TABLE}.code

  - dimension: deaths
    type: number
    sql: ${TABLE}.deaths
  
  - dimension: subcode
    type: string
    sql: split_part(${code}, '.', 1),

  - measure: count
    type: count
    drill_fields: []

