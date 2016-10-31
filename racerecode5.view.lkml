view: racerecode5 {
  sql_table_name: public.racerecode5 ;;

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
