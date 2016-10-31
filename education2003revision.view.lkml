view: education2003revision {
  sql_table_name: public.education2003revision ;;

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
