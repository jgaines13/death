- view: recordaxisconditions
  sql_table_name: public.recordaxisconditions
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

  - measure: count
    type: count
    drill_fields: [id, deathrecords.id]

