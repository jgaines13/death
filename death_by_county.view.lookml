- view: death_by_county
  derived_table: 
    sql: select row_number() OVER(ORDER BY county || state) AS prim_key,* from public.death_by_county
  fields:

  - dimension: prim_key
    type: number
    sql: ${TABLE}.prim_key
    primary_key: true
    hidden: true
    
  - dimension: age_group
    type: string
    sql: ${TABLE}.age_group
    order_by_field: age_order
    
  - dimension: age_order
    type: number
    hidden: true
    sql: |
      case when ${age_group} = '< 1 year' then .5
      when ${age_group} = '85+ years' then 85
      when ${age_group} = 'Not Stated' then 100
      else split_part(trim(trailing 'years' from ${age_group}), '-', 1)::integer
      end


  - dimension: age_group_code
    type: string
    sql: ${TABLE}.age_group_code
    hidden: true

  - dimension: county
    type: string
    sql: ${TABLE}.county
    

  - dimension: county_code
    type: number
    sql: ${TABLE}.county_code
    hidden: true

  - dimension: crude_rate
    type: string
    sql: ${TABLE}.crude_rate

  - dimension: deaths
    type: number
    sql: ${TABLE}.deaths

  - dimension: gender
    type: string
    sql: ${TABLE}.gender

  - dimension: gender_code
    type: string
    sql: ${TABLE}.gender_code
    hidden: true

  - dimension: icd10_subchapter
    type: string
    sql: ${TABLE}.icd10_subchapter

  - dimension: icd10_subchapter_code
    type: string
    sql: ${TABLE}.icd10_subchapter_code
    hidden: true

  - dimension: percent_total_deaths
    type: number
    sql: ${TABLE}.percent_total_deaths

  - dimension: population
    type: string
    sql: |
      case when ${TABLE}.population='NULL' or ${TABLE}.population='Not Applicable' then NULL
      else ${TABLE}.population::integer
      end

  - dimension: race
    type: string
    sql: ${TABLE}.race

  - dimension: race_code
    type: string
    sql: ${TABLE}.race_code
    hidden: true

  - dimension: state
    type: string
    map_layer: us_states
    sql: TRIM(BOTH FROM ${TABLE}.state)

  - measure: count
    type: count
    drill_fields: []
  
  - measure: total_deaths
    type: sum
    sql: ${deaths}
  
  - measure: total_population
    type: sum
    sql: ${population}
    
  - measure: death_by_pop
    type: number
    value_format_name: percent_4
    sql: (${total_deaths} * 1.000)/nullif(${total_population},0)
    
#   - measure: display_value
#     type: number
#     sql: ${death_by_pop}
#     value_format_name: percent_4
#     html: |
#       {{ county._rendered_value }} || {{ rendered_value }}

