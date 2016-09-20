- view: death_by_month
  sql_table_name: public.death_by_month
  fields:

  - dimension: deaths
    type: number
    sql: ${TABLE}.deaths

  - dimension: icd_sub
    type: string
    sql: ${TABLE}.icd_sub

  - dimension: icd_sub_code
    type: string
    sql: ${TABLE}.icd_sub_code

  - dimension: month
    type: string
    sql: ${TABLE}.month

  - measure: count
    type: count
    drill_fields: []

