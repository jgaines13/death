view: cause_by_year {
  sql_table_name: public.cause_by_year ;;

  dimension: cause_of_death {
    type: string
    sql: ${TABLE}.cause_of_death ;;
  }

  dimension: cause_of_death_code {
    type: string
    sql: ${TABLE}.cause_of_death_code ;;
  }

  dimension: crude_rate {
    type: number
    sql: ${TABLE}.crude_rate ;;
  }

  #       (case when ${TABLE}.crude_rate='NULL' or ${TABLE}.crude_rate='Unreliable' or ${TABLE}.crude_rate='Not Applicable' then NULL
  #       else ${TABLE}.crude_rate::decimal
  #       end)

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: death_total {
    type: sum
    sql: ${deaths} ;;
  }

  measure: avg_crude_deaths {
    type: average
    sql: ${crude_rate} ;;
  }
}
