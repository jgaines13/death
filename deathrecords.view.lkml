view: deathrecords {
  sql_table_name: public.deathrecords ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activitycode {
    type: number
    sql: ${TABLE}.activitycode ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: agerecode12 {
    type: number
    sql: ${TABLE}.agerecode12 ;;
  }

  dimension: agerecode27 {
    type: number
    sql: ${TABLE}.agerecode27 ;;
  }

  dimension: agerecode52 {
    type: number
    sql: ${TABLE}.agerecode52 ;;
  }

  dimension: agesubstitutionflag {
    type: number
    sql: ${TABLE}.agesubstitutionflag ;;
  }

  dimension: agetype {
    type: number
    sql: ${TABLE}.agetype ;;
  }

  dimension: autopsy {
    type: string
    sql: ${TABLE}.autopsy ;;
  }

  dimension: bridgedraceflag {
    type: number
    sql: ${TABLE}.bridgedraceflag ;;
  }

  dimension: causerecode113 {
    type: number
    sql: ${TABLE}.causerecode113 ;;
  }

  dimension: causerecode358 {
    type: number
    sql: ${TABLE}.causerecode358 ;;
  }

  dimension: causerecode39 {
    type: number
    sql: ${TABLE}.causerecode39 ;;
  }

  dimension: currentdatayear {
    type: string
    sql: ${TABLE}.currentdatayear ;;
  }

  dimension: dayofweek {
    type: string
    sql: ${TABLE}.dayofweek ;;
  }

  dimension: education1989revision {
    type: number
    sql: ${TABLE}.education1989revision ;;
  }

  dimension: education2003revision {
    type: number
    sql: ${TABLE}.education2003revision ;;
  }

  dimension: educationreportingflag {
    type: number
    sql: ${TABLE}.educationreportingflag ;;
  }

  dimension: hispanicorigin {
    type: number
    sql: ${TABLE}.hispanicorigin ;;
  }

  dimension: hispanicoriginracerecode {
    type: number
    sql: ${TABLE}.hispanicoriginracerecode ;;
  }

  dimension: icd10code {
    type: string
    sql: ${TABLE}.icd10code ;;
  }

  dimension: infantagerecode22 {
    type: number
    sql: ${TABLE}.infantagerecode22 ;;
  }

  dimension: infantcauserecode130 {
    type: number
    sql: ${TABLE}.infantcauserecode130 ;;
  }

  dimension: injuryatwork {
    type: string
    sql: ${TABLE}.injuryatwork ;;
  }

  dimension: mannerofdeath {
    type: number
    sql: ${TABLE}.mannerofdeath ;;
  }

  dimension: maritalstatus {
    type: string
    sql: ${TABLE}.maritalstatus ;;
  }

  dimension: methodofdisposition {
    type: string
    sql: ${TABLE}.methodofdisposition ;;
  }

  dimension: monthofdeath {
    type: number
    sql: ${TABLE}.monthofdeath ;;
  }

  dimension: numberofentityaxisconditions {
    type: number
    sql: ${TABLE}.numberofentityaxisconditions ;;
  }

  dimension: numberofrecordaxisconditions {
    type: number
    sql: ${TABLE}.numberofrecordaxisconditions ;;
  }

  dimension: placeofdeathandstatus {
    type: number
    sql: ${TABLE}.placeofdeathandstatus ;;
  }

  dimension: placeofinjury {
    type: number
    sql: ${TABLE}.placeofinjury ;;
  }

  dimension: race {
    type: number
    sql: ${TABLE}.race ;;
  }

  dimension: raceimputationflag {
    type: number
    sql: ${TABLE}.raceimputationflag ;;
  }

  dimension: racerecode3 {
    type: number
    sql: ${TABLE}.racerecode3 ;;
  }

  dimension: racerecode5 {
    type: number
    sql: ${TABLE}.racerecode5 ;;
  }

  dimension: residentstatus {
    type: number
    sql: ${TABLE}.residentstatus ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  measure: count {
    type: count
    drill_fields: [id, entityaxisconditions.count, recordaxisconditions.count]
  }
}
