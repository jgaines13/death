view: sql_runner_query_1 {
  derived_table: {
    sql: select * from all_causes as all_causes2
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cause {
    type: string
    sql: ${TABLE}.cause ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  set: detail {
    fields: [cause, code, deaths]
  }
}
