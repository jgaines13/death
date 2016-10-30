- view: fips_codes
  sql_table_name: public.fips_codes
  fields:

  - dimension: classfp
    type: string
    sql: ${TABLE}.classfp

  - dimension: countyfp
    type: string
    sql: |
      case when char_length(${TABLE}.countyfp) = 3 then ${TABLE}.countyfp
      when char_length(${TABLE}.countyfp) = 2 then '0' || ${TABLE}.countyfp
      when char_length(${TABLE}.countyfp) = 1 then '00' || ${TABLE}.countyfp
      end

  - dimension: countyname
    type: string
    sql: ${TABLE}.countyname

  - dimension: state
    type: string
    sql: ${TABLE}.state
    map_layer: us_states

  - dimension: statefp
    type: string
    sql: |
      case when char_length(${TABLE}.statefips) = 2 then ${TABLE}.statefips
      when char_length(${TABLE}.statefips) = 1 then '0' || ${TABLE}.statefips
      end
  
  - dimension: fip_code
    type: string
    map_layer: us_counties_fips
    sql: ${statefp} || ${countyfp}
    html: |
      {{ countyname._rendered_value }}
    

  - measure: count
    type: count
    drill_fields: [countyname]

