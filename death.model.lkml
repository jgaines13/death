connection: "postgres"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: deathrecords {
  persist_for: "1000 hours"
  join: activitycode {
    relationship: many_to_one
    sql_on: ${deathrecords.activitycode} = ${activitycode.code} ;;
  }

  join: agerecode12 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode12} = ${agerecode12.code} ;;
  }

  join: agerecode52 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode52} = ${agerecode52.code} ;;
  }

  join: agerecode27 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode27} = ${agerecode27.code} ;;
  }
  join: population {
    relationship: one_to_one
    sql_on: ${agerecode27.description} = ${population.age_group} ;;
  }

  join: agetype {
    relationship: many_to_one
    sql_on: ${deathrecords.agetype}= ${agetype.code} ;;
  }

  join: bridgeraceflag {
    relationship: many_to_one
    sql_on: ${deathrecords.bridgedraceflag}= ${bridgeraceflag.code} ;;
  }

  join: deathofweekdeath {
    relationship: many_to_one
    sql_on: ${deathrecords.dayofweek}= ${deathofweekdeath.code} ;;
  }

  join: education1989revision {
    relationship: many_to_one
    sql_on: ${deathrecords.education1989revision}= ${education1989revision.code} ;;
  }

  join: education2003revision {
    relationship: many_to_one
    sql_on: ${deathrecords.education2003revision}= ${education2003revision.code} ;;
  }

  join: educationreportingflag {
    relationship: many_to_one
    sql_on: ${deathrecords.educationreportingflag}= ${educationreportingflag.code} ;;
  }

  join: hispanicorigin {
    relationship: many_to_one
    sql_on: ${deathrecords.hispanicorigin}= ${hispanicorigin.code} ;;
  }

  join: hispanicoriginracerecode {
    relationship: many_to_one
    sql_on: ${deathrecords.hispanicoriginracerecode}= ${hispanicoriginracerecode.code} ;;
  }

  join: icd10code {
    relationship: many_to_one
    sql_on: ${deathrecords.icd10code} = ${icd10code.code} ;;
  }

  join: infantagerecode22 {
    relationship: many_to_one
    sql_on: ${deathrecords.infantagerecode22} = ${infantagerecode22.code} ;;
  }

  join: mannerofdeath {
    relationship: many_to_one
    sql_on: ${deathrecords.mannerofdeath} = ${mannerofdeath.code} ;;
  }

  join: maritalstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.maritalstatus} = ${maritalstatus.code} ;;
  }

  join: methodofdisposition {
    relationship: many_to_one
    sql_on: ${deathrecords.methodofdisposition} = ${methodofdisposition.code} ;;
  }

  join: placeofdeathanddecendentsstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.placeofdeathandstatus} = ${placeofdeathanddecendentsstatus.code} ;;
  }

  join: placeofinjury {
    relationship: many_to_one
    sql_on: ${deathrecords.placeofinjury} = ${placeofinjury.code} ;;
  }

  join: race {
    relationship: many_to_one
    sql_on: ${deathrecords.race} = ${race.code} ;;
  }

  join: raceimputationflag {
    relationship: many_to_one
    sql_on: ${deathrecords.raceimputationflag} = ${raceimputationflag.code} ;;
  }

  join: racerecode3 {
    relationship: many_to_one
    sql_on: ${deathrecords.racerecode3} = ${racerecode3.code} ;;
  }

  join: racerecode5 {
    relationship: many_to_one
    sql_on: ${deathrecords.racerecode5} = ${racerecode5.code} ;;
  }

  join: residentstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.residentstatus} = ${residentstatus.code} ;;
  }
  join: multiplecauses {
    relationship: one_to_many
    sql_on: ${icd10code.code}=${multiplecauses.icd10code} ;;
  }
}

explore: all_causes {
  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${all_causes.code}=${icd10_code_mapping.cause_of_death_code} ;;
  }
}

explore: ca_cause_of_death {
  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${ca_cause_of_death.cause_of_death_code}=${icd10_code_mapping.cause_of_death_code} ;;
  }
}

explore: cause_by_year {
  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${cause_by_year.cause_of_death_code}=${icd10_code_mapping.cause_of_death_code} ;;
  }
}

explore: by_county {
  persist_for: "20 hours"
  from: fips_codes
  #   access_filter_fields: [death_by_county.gender, death_by_county.race]
  join: death_by_county {
    relationship: one_to_many
    sql_on: ${death_by_county.county} = ${by_county.countyname} and ${death_by_county.state}=${by_county.state} ;;
  }

  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${death_by_county.icd10_subchapter_code}=${icd10_code_mapping.subcategory_code} ;;
  }
}

explore: death_by_county {
  persist_for: "20 hours"
  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${death_by_county.icd10_subchapter_code}=${icd10_code_mapping.subcategory_code} ;;
  }
}

explore: entityaxisconditions {
  join: deathrecords {
    relationship: many_to_one
    sql_on: ${deathrecords.id}=${entityaxisconditions.deathrecordid} ;;
  }
  join: activitycode {
    relationship: many_to_one
    sql_on: ${deathrecords.activitycode} = ${activitycode.code} ;;
  }

  join: agerecode12 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode12} = ${agerecode12.code} ;;
  }

  join: agerecode52 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode52} = ${agerecode52.code} ;;
  }

  join: agerecode27 {
    relationship: many_to_one
    sql_on: ${deathrecords.agerecode27} = ${agerecode27.code} ;;
  }

  join: agetype {
    relationship: many_to_one
    sql_on: ${deathrecords.agetype}= ${agetype.code} ;;
  }

  join: bridgeraceflag {
    relationship: many_to_one
    sql_on: ${deathrecords.bridgedraceflag}= ${bridgeraceflag.code} ;;
  }

  join: deathofweekdeath {
    relationship: many_to_one
    sql_on: ${deathrecords.dayofweek}= ${deathofweekdeath.code} ;;
  }

  join: education1989revision {
    relationship: many_to_one
    sql_on: ${deathrecords.education1989revision}= ${education1989revision.code} ;;
  }

  join: education2003revision {
    relationship: many_to_one
    sql_on: ${deathrecords.education2003revision}= ${education2003revision.code} ;;
  }

  join: educationreportingflag {
    relationship: many_to_one
    sql_on: ${deathrecords.educationreportingflag}= ${educationreportingflag.code} ;;
  }

  join: hispanicorigin {
    relationship: many_to_one
    sql_on: ${deathrecords.hispanicorigin}= ${hispanicorigin.code} ;;
  }

  join: hispanicoriginracerecode {
    relationship: many_to_one
    sql_on: ${deathrecords.hispanicoriginracerecode}= ${hispanicoriginracerecode.code} ;;
  }

  join: icd10code {
    relationship: many_to_one
    sql_on: ${deathrecords.icd10code} = ${icd10code.code} ;;
  }

  join: infantagerecode22 {
    relationship: many_to_one
    sql_on: ${deathrecords.infantagerecode22} = ${infantagerecode22.code} ;;
  }

  join: mannerofdeath {
    relationship: many_to_one
    sql_on: ${deathrecords.mannerofdeath} = ${mannerofdeath.code} ;;
  }

  join: maritalstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.maritalstatus} = ${maritalstatus.code} ;;
  }

  join: methodofdisposition {
    relationship: many_to_one
    sql_on: ${deathrecords.methodofdisposition} = ${methodofdisposition.code} ;;
  }

  join: placeofdeathanddecendentsstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.placeofdeathandstatus} = ${placeofdeathanddecendentsstatus.code} ;;
  }

  join: placeofinjury {
    relationship: many_to_one
    sql_on: ${deathrecords.placeofinjury} = ${placeofinjury.code} ;;
  }

  join: race {
    relationship: many_to_one
    sql_on: ${deathrecords.race} = ${race.code} ;;
  }

  join: raceimputationflag {
    relationship: many_to_one
    sql_on: ${deathrecords.raceimputationflag} = ${raceimputationflag.code} ;;
  }

  join: racerecode3 {
    relationship: many_to_one
    sql_on: ${deathrecords.racerecode3} = ${racerecode3.code} ;;
  }

  join: racerecode5 {
    relationship: many_to_one
    sql_on: ${deathrecords.racerecode5} = ${racerecode5.code} ;;
  }

  join: residentstatus {
    relationship: many_to_one
    sql_on: ${deathrecords.residentstatus} = ${residentstatus.code} ;;
  }
}

explore: death_by_month {
  join: icd10_code_mapping {
    relationship: many_to_one
    sql_on: ${death_by_month.icd_sub_code}=${icd10_code_mapping.subcategory_code} ;;
  }}
explore: above_avg_causes_by_state {}
