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
  dimension: simple_desc {
    type: string
    sql:
      case when ${education2003revision.description}='Doctorate or professional degree' OR ${education2003revision.description} like 'Master%' OR ${education2003revision.description} like 'Bachelor%' OR ${education2003revision.description}='Associate degree' OR ${education2003revision.description}='some college credit, but no degree' OR ${education2003revision.description} like 'Master%' OR ${education2003revision.description} like 'Bachelor%' OR ${education2003revision.description}='Associate degree' OR ${education2003revision.description}='high school graduate or GED completed' then 'higher education'
      else 'high school or less'
      end;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
