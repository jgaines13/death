view: agerecode12 {
  sql_table_name: public.agerecode12 ;;

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: case when ${TABLE}.description = '5 - 14 years' or ${TABLE}.description = '1 - 4 years' then '1 - 14 years'
    else ${TABLE}.description end;;
    }

  measure: count {
    type: count
    drill_fields: []
  }
}
