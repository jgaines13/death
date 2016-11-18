view: multiplecauses {
  derived_table: {
    sql:
      select i.description, i.code, multiplecauses, count(*) as count
      from deathrecords d
      left outer join (
        SELECT deathrecordid, count(*) multiplecauses
        FROM public.entityaxisconditions
        left outer join deathrecords d on deathrecordid=d.id
        group by deathrecordid having count(*) > 2) m
      on m.deathrecordid=d.id
      left outer join icd10code i on d.icd10code = i.code
      where multiplecauses >1
      group by i.description, i.code, multiplecauses ;;
  }
  dimension: icd10description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: icd10code {
    type: number
    sql: ${TABLE}.code ;;
  }
  dimension:  multiples {
    type: number
    sql: ${TABLE}.multiplecauses ;;
  }
  dimension:  count_occurances {
    type: number
    sql: ${TABLE}.count ;;
  }
  measure: avg_multiples {
    type: average
    sql: ${multiples} ;;
  }
  measure: avg_count {
    type: average
    sql: ${count_occurances} ;;
  }
}
