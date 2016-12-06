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
  dimension: Transport {
    type: string
    drill_fields: [icd10code_description]
    sql:
       case when ${icd10code_description} like '%Motorcycle%' or ${icd10code_description} like 'Occupant of three-wheeled motor vehicle%' then 'Motorcycle'
       when ${icd10code_description} like '%Car occupant%' then 'Car'
       when ${icd10code_description} like '%railway%' then 'Railway'
       when ${icd10code_description} like '%edestrian%' then 'Pedestrian'
       when ${icd10code_description} like '%Bus occupant%' then 'Bus'
       when ${icd10code_description} like 'Occupant of heavy transport vehicle%' then 'Heavy Transport Vehicle'
       when ${icd10code_description} like 'Pedal cyclist%' then 'Bicycle'
       when ${icd10code_description} like '%aircraft%' then 'Airplane'
       when ${icd10code_description} like 'Balloon%' then 'Balloon'
       when ${icd10code_description} like 'animal-drawn%' then 'Animal-drawn vehicle'
       when ${icd10code_description} like '%ship' or ${icd10code_description} like '%boat%' then 'Boat'
       when ${icd10code_description} like '%ccupant of pick-up truck%' then 'Pickup Truck'
       when ${icd10code_description} like '%special agricultural vehicle%' then 'Tractor'
       when ${icd10code_description} like '%special constuction vehicle%' then 'Construction vehicle'
       when ${icd10code_description} like '%special industrial vehicle%' then 'Industrial vehicle'
       when ${icd10code_description} like '%vehicle%' or ${icd10code_description} like '%motor%' then 'other vehicle'
      else null
      end;;
      html:
       {% if value == 'Car' %}
        <img src="https://static.pexels.com/photos/2394/lights-clouds-dark-car.jpg" width="100" height="100" >
        {% elsif value == 'Motorcycle' %}
        <img src="http://www.asphaltandrubber.com/wp-content/uploads/2012/11/motorcycle-crash1.jpg" width="100" height="100" >
      {% elsif value == 'Pedestrian' %}
        <img src="http://f.tqn.com/y/dc/1/W/V/N/2/pedestrian.jpg" width="100" height="100" >
      {% elsif value == 'Pickup Truck' %}
        <img src="https://s-media-cache-ak0.pinimg.com/originals/03/f1/d3/03f1d32e3e378dbe5d3c3f9ca7d3e389.jpg" width="100" height="100" >
      {% elsif value == 'Bicycle' %}
        <img src="http://f.tqn.com/y/bicycling/1/W/x/J/-/-/road_bike_102285244.jpg" width="100" height="100" >
      {% elsif value == 'Railway' %}
        <img src="http://weknowyourdreams.com/images/railway/railway-02.jpg" width="100" height="100" >
      {% elsif value == 'Tractor' %}
        <img src="https://www.deere.com/common/media/images/products/equipment/tractors/E-series/r4d073222-5E-762x458.jpg" width="100" height="100" >
      {% elsif value == 'Airplane' %}
        <img src="https://media.licdn.com/mpr/mpr/jc/AAEAAQAAAAAAAAMiAAAAJGVlYTU5Y2YyLWQwMzYtNDlmZS04MDdlLWI0ZjJjZWRhYjk4ZQ.jpg" width="100" height="100" >
      {% elsif value == 'Heavy Transport Vehicle' %}
        <img src="https://upload.wikimedia.org/wikipedia/commons/c/cb/Wind_turbine_mast_transport.jpg" width="100" height="100" >
      {% else %}
        {{ value }}
      {% endif %}
        ;;
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
    sql: ${TABLE}.dayofweek::integer ;;
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
  dimension: icd10code_description {
    type: string
    sql: ${icd10code.description} ;;
  }
  dimension: format_topcauses {
    type: string
    sql:
      case when ${icd10code.description}='Atherosclerotic heart disease' then 'Atherosclerosis'
      when ${icd10code.description}='Unspecified dementia' then 'dementia'
      when ${icd10code.description}='Malignant neoplasm: Bronchus or lung, unspecified' then 'Lung_cancer'
      when ${icd10code.description}='Acute myocardial infarction, unspecified' then 'Myocardial_infarction'
      when ${icd10code.description}='Chronic obstructive pulmonary disease, unspecified' then 'Chronic_obstructive_pulmonary_disease'
      when ${icd10code.description}='Alzheimer disease, unspecified' then 'Alzheimers_disease'
      when ${icd10code.description}='Stroke, not specified as haemorrhage or infarction' then 'stroke'
      when ${icd10code.description}='Atherosclerotic cardiovascular disease, so described' then 'Coronary artery disease'
      when ${icd10code.description}='Congestive heart failure' then 'Heart_failure'
      when ${icd10code.description}='Pneumonia, unspecified' then 'Pneumonia'
      else ${icd10code.description}
      end;;
  }
  dimension: topcauseswikilinks {
    type: string
    sql: ${format_topcauses} ;;
    html:
    href="http://en.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&exsentences=1&titles={{ value }}";;
  }
  dimension: wiki {
    type: string
    sql: ${format_topcauses} ;;
    html:
     <a href="https://en.wikipedia.org/wiki/{{ value }}"> {{ deathrecords.icd10code_description }} </a>;;
  }

  dimension: wiki_api_search {
    type: string
    sql:
      case when description like '%alignant neoplasm%'
        then ((split_part(replace(regexp_replace(regexp_replace(lower(icd10code.description), '([,:])', '', 'g'), 'unspecified','', 'g'), 'malignant neoplasm', 'cancer'), 'cancer',2)) ||' cancer')
      else (regexp_replace(regexp_replace(lower(icd10code.description), '([,:])', '', 'g'), 'unspecified','', 'g'))
      end;;
    html:
    <a href="http://www.wikipedia.org/search-redirect.php?family=wikipedia&search={{ value }}&language=en"> {{ deathrecords.icd10code_description }} </a>;;
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
  dimension:  marital_status {
    type: yesno
    sql: (${maritalstatus} = 'W') ;;
  }

  measure: testyesno {
    type: count
    filters: {
      field: marital_status
      value: "yes"
    }
  }
  dimension:  maritalstatus_combined {
    type: string
    sql:
      case when ${maritalstatus} = 'W' or ${maritalstatus} = 'M' then 'M'
      else ${maritalstatus}
      end;;
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
    drill_fields: [icd10code_description, count]
  }

  measure: count_formatted {
    type: count
    hidden: yes
    drill_fields: [icd10code_description, count]
  }

  dimension: all_records {
    type: string
    sql: '' ;;
  }
  measure: count_autopsy {
    type: count
    filters: {
      field: autopsy
      value: "Y"
    }
  }
  measure: count_natural {
    type: count
    filters: {
      field: mannerofdeath.description
      value: "Natural"
    }
  }
  measure: count_external {
    type: count
    filters: {
    field: mannerofdeath.description
    value: "Accident, Homicide, Suicide"
  }
  }
  measure: count_vehicle {
    type: count
    filters: {
      field: icd10code.description
      value: "%vehicle%, %traffic%"
    }
  }
  measure: count_homicide {
    type: count
    filters: {
      field: mannerofdeath
      value: "3"
    }
  }
  measure: count_suicide {
    type: count
    filters: {
      field: mannerofdeath
      value: "2"
    }
  }
  measure: count_gun {
    type: count
    filters: {
      field: icd10code.description
      value: "%discharge%, -Urethral discharge, -Discharge of firework, -Legal intervention involving firearm discharge"
      }
      }

 measure: count_gun_white {
   type: number
  sql: ((${count_gun}*1.00)/95645900 )* 100 ;;
 }
measure:  count_gun_black {
  type: number
  sql: ((1.00 *${count_gun})/39257300 )*100;;
}

dimension: total_deaths  {
  type: number
  sql: (select count(*) from deathrecords) ;;
}

measure: cohort {
  type: percent_of_total
  sql: .5 * ${count} ;;
}
  measure: count_vehicle_white {
    type: number
    sql: ((${count_vehicle}*1.00)/95645900 )* 100 ;;
  }
  measure:  count_vehicle_black {
    type: number
    sql: ((1.00 *${count_vehicle})/39257300 )*100;;
  }
  measure: avg_age {
    type: average
    sql: ${age} ;;
  }

  measure: count_code {
    type: count_distinct
    sql: ${icd10code} ;;
  }
  measure: avg_entity {
    type: average
    sql: ${numberofentityaxisconditions} ;;
  }
}
