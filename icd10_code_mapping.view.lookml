- view: icd10_code_mapping
  sql_table_name: public.icd10_complete_mapping
  fields:

  - dimension: category
    type: string
    sql: ${TABLE}.category
    
  - dimension: category_short
    type: string
    sql_case:
      Infection: ${category} = 'Certain infectious and parasitic diseases'
      Circulatory: ${category} = 'Diseases of the circulatory system'
      Respiratory: ${category} =  'Diseases of the respiratory system'
      Nervous: ${category} = 'Diseases of the nervous system'
      Mental: ${category} = 'Mental and behavioural disorders'
      Endocrine: ${category} = 'Endocrine nutritional and metabolic diseases'
      External Causes: ${category} = 'External causes of morbidity and mortality'
      Digestive: ${category} =  'Diseases of the digestive system'
      Genitourinary: ${category} = 'Diseases of the genitourinary system'
      Cancer: ${category} =   'Neoplasms'
      Musculoskeletal: ${category} =  'Diseases of the musculoskeletal system and connective tissue'
      Perinatal: ${category} = 'Certain conditions originating in the perinatal period'
      Immune: ${category} = 'Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism'
      Congenital: ${category} = 'Congenital malformations deformations and chromosomal abnormalities'
      Skin: ${category} =   'Diseases of the skin and subcutaneous tissue'
      Pregnancy: ${category} = 'Pregnancy childbirth and the puerperium'
      else: Other
    

  - dimension: category_code
    type: string
    sql: ${TABLE}.category_code

  - dimension: subcategory
    type: string
    sql: ${TABLE}.subcategory

  - dimension: subcategory_code
    type: string
    sql: ${TABLE}.subcategory_code
  
  - dimension: cause_of_death
    type: string
    sql: ${TABLE}.cause_of_death
  
  - dimension: cause_of_death_code
    type: string
    sql: ${TABLE}.cause_of_death_code
  

  - measure: count
    type: count
    drill_fields: []

