view: ca_cause_of_death {
  sql_table_name: public.ca_cause_of_death ;;

  dimension: cause_of_death {
    type: string
    sql: ${TABLE}.cause_of_death ;;
  }

  dimension: cause_of_death_code {
    type: string
    sql: ${TABLE}.cause_of_death_code ;;
  }

  dimension: gun_deaths {
    type: yesno
    sql: (${cause_of_death} like '%discharge%' AND  ${cause_of_death} not in  ('Urethral discharge',
       'Discharge of firework',
       'Legal intervention involving firearm discharge'))
 ;;
  }

  dimension: vehicle_deaths {
    type: yesno
    sql: (${cause_of_death} like '%vehicle%') ;;
  }

  dimension: crude_rate {
    type: number
    sql: ${TABLE}.crude_rate ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: percent_of_total_deaths {
    type: number
    sql: ${TABLE}.percent_of_total_deaths ;;
    value_format_name: percent_2
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_code {
    type: number
    sql: ${TABLE}.state_code ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: crude_rate_avg {
    type: average
    sql: ${crude_rate} ;;
  }

  measure: total_deaths {
    type: sum
    sql: ${deaths} ;;
  }
}
