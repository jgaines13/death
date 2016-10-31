view: crime_by_city {
  sql_table_name: public.crime_by_city ;;

  dimension: arson {
    type: number
    sql: ${TABLE}.arson ;;
  }

  dimension: assault {
    type: number
    sql: ${TABLE}.assault ;;
  }

  dimension: bulglary {
    type: number
    sql: ${TABLE}.bulglary ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: larcenty_theft {
    type: number
    sql: ${TABLE}.larcenty_theft ;;
  }

  dimension: motor_vehicle_theft {
    type: number
    sql: ${TABLE}.motor_vehicle_theft ;;
  }

  dimension: murders {
    type: number
    sql: ${TABLE}.murders ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: property {
    type: number
    sql: ${TABLE}.property ;;
  }

  dimension: rape_new {
    type: number
    sql: ${TABLE}.rape_new ;;
  }

  dimension: rape_old {
    type: number
    sql: ${TABLE}.rape_old ;;
  }

  dimension: robbery {
    type: number
    sql: ${TABLE}.robbery ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: violent_crime {
    type: number
    sql: ${TABLE}.violent_crime ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
