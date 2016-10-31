view: icd10_code_mapping {
  sql_table_name: public.icd10_complete_mapping ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_short {
    type: string

    case: {
      when: {
        sql: ${category} = 'Certain infectious and parasitic diseases' ;;
        label: "Infection"
      }

      when: {
        sql: ${category} = 'Diseases of the circulatory system' ;;
        label: "Circulatory"
      }

      when: {
        sql: ${category} =  'Diseases of the respiratory system' ;;
        label: "Respiratory"
      }

      when: {
        sql: ${category} = 'Diseases of the nervous system' ;;
        label: "Nervous"
      }

      when: {
        sql: ${category} = 'Mental and behavioural disorders' ;;
        label: "Mental"
      }

      when: {
        sql: ${category} = 'Endocrine nutritional and metabolic diseases' ;;
        label: "Endocrine"
      }

      when: {
        sql: ${category} = 'External causes of morbidity and mortality' ;;
        label: "External Causes"
      }

      when: {
        sql: ${category} =  'Diseases of the digestive system' ;;
        label: "Digestive"
      }

      when: {
        sql: ${category} = 'Diseases of the genitourinary system' ;;
        label: "Genitourinary"
      }

      when: {
        sql: ${category} =   'Neoplasms' ;;
        label: "Cancer"
      }

      when: {
        sql: ${category} =  'Diseases of the musculoskeletal system and connective tissue' ;;
        label: "Musculoskeletal"
      }

      when: {
        sql: ${category} = 'Certain conditions originating in the perinatal period' ;;
        label: "Perinatal"
      }

      when: {
        sql: ${category} = 'Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism' ;;
        label: "Immune"
      }

      when: {
        sql: ${category} = 'Congenital malformations deformations and chromosomal abnormalities' ;;
        label: "Congenital"
      }

      when: {
        sql: ${category} =   'Diseases of the skin and subcutaneous tissue' ;;
        label: "Skin"
      }

      when: {
        sql: ${category} = 'Pregnancy childbirth and the puerperium' ;;
        label: "Pregnancy"
      }

      else: "Other"
    }
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: subcategory_code {
    type: string
    sql: ${TABLE}.subcategory_code ;;
  }

  dimension: cause_of_death {
    type: string
    sql: ${TABLE}.cause_of_death ;;
  }

  dimension: cause_of_death_code {
    type: string
    sql: ${TABLE}.cause_of_death_code ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
