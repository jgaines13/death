view: entityaxisconditions {
  sql_table_name: public.entityaxisconditions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: deathrecordid {
    type: number
    value_format_name: id
    # hidden: true
    sql: ${TABLE}.deathrecordid ;;
  }

  dimension: icd10code {
    type: string
    sql: ${TABLE}.icd10code ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }

  dimension: part {
    type: number
    sql: ${TABLE}.part ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  measure: count {
    type: count
    drill_fields: [id, deathrecords.id]
  }
}
