view: icd10code {
  sql_table_name: public.icd10code ;;

  dimension: code {
    type: string
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
