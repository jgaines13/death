- view: entityaxisconditions
  sql_table_name: public.entityaxisconditions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: deathrecordid
    type: number
    value_format_name: id
    # hidden: true
    sql: ${TABLE}.deathrecordid

  - dimension: icd10code
    type: string
    sql: ${TABLE}.icd10code

  - dimension: line
    type: number
    sql: ${TABLE}.line

  - dimension: part
    type: number
    sql: ${TABLE}.part

  - dimension: sequence
    type: number
    sql: ${TABLE}.sequence

  - measure: count
    type: count
    drill_fields: [id, deathrecords.id]

