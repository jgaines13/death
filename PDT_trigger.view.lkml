explore: pdt_trigger {
  hidden: yes
}
explore: pdt_dg {
  hidden: yes
}
view: pdt_trigger {
  derived_table: {
    sql: select * from public.activitycode  ;;
    sql_trigger_value: SELECT DATE_PART('hour', NOW()) ;;
    indexes: ["code"]
  }

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

datagroup: everyhour {
  sql_trigger: SELECT DATE_PART('hour', NOW()) ;;
}
view: pdt_dg {
  derived_table: {
    sql: select * from public.activitycode  ;;
    datagroup_trigger: everyhour
    indexes: ["code"]
  }

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
