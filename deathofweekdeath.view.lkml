view: deathofweekdeath {
  sql_table_name: public.deathofweekdeath ;;

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    order_by_field: code
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
