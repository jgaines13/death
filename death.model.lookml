- connection: postgres

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: all_causes

- explore: ca_cause_of_death

- explore: cause_by_year

- explore: crime_by_city

# - explore: death_by_county
#   joins: 
#     - join: fips_codes
#       relationship: one_to_one
#       sql_on: ${death_by_county.county} = ${fips_codes.countyname} and ${death_by_county.state}=${fips_codes.state}

- explore: by_county
  from: fips_codes
  access_filter_fields: [death_by_county.gender, death_by_county.race]
  joins:
      - join: death_by_county
        relationship: one_to_many
        sql_on: ${death_by_county.county} = ${by_county.countyname} and ${death_by_county.state}=${by_county.state}
      - join: icd10_code_mapping
        relationship: many_to_one
        sql_on: ${death_by_county.icd10_subchapter_code}=${icd10_code_mapping.subcategory_code}

- explore: death_by_month

