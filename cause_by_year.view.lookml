- view: cause_by_year
  sql_table_name: public.cause_by_year
  fields:

  - dimension: cause_of_death
    type: string
    sql: ${TABLE}.cause_of_death

  - dimension: cause_of_death_code
    type: string
    sql: ${TABLE}.cause_of_death_code

  - dimension: crude_rate
    type: number
    sql: ${TABLE}.crude_rate

  - dimension: deaths
    type: number
    sql: ${TABLE}.deaths

  - dimension: population
    type: number
    sql: ${TABLE}.population

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: []

