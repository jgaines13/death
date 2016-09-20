- view: ca_cause_of_death
  sql_table_name: public.ca_cause_of_death
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

  - dimension: percent_of_total_deaths
    type: number
    sql: ${TABLE}.percent_of_total_deaths

  - dimension: population
    type: number
    sql: ${TABLE}.population

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: state_code
    type: number
    sql: ${TABLE}.state_code

  - measure: count
    type: count
    drill_fields: []

