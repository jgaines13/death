view: death_by_county {
  derived_table: {
    sql: select row_number() OVER(ORDER BY county || state) AS prim_key,* from public.death_by_county ;;
  }

  dimension: prim_key {
    type: number
    sql: ${TABLE}.prim_key ;;
    primary_key: yes
    hidden: yes
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
    order_by_field: age_order
  }

  dimension: age_order {
    type: number
    hidden: yes
    sql: case when ${age_group} = '< 1 year' then .5
      when ${age_group} = '85+ years' then 85
      when ${age_group} = 'Not Stated' then 100
      else split_part(trim(trailing 'years' from ${age_group}), '-', 1)::integer
      end
       ;;
  }

  dimension: title {
    type: string
    sql: 1 ;;
    html:
    <h1 style="font-size:300%"> Let's talk about death.</h1>
    <img src="http://i.giphy.com/mo8MAe2maHrva.gif" />
      ;;
  }

  dimension: all_done {
    sql: 1 ;;
    html:
    <h1> And One Last Cat Gif </h1>
    <img src="http://i.giphy.com/iPiUxztIL4Sl2.gif" />;;
  }
  dimension: lifespan_title {
    type: string
    sql: 1 ;;
    html:
    <h1 style="background: #c4d4ed;color: black;"> <font size="50%"> Lifespan Statistics </font> <br> <i> When do people die? Doing what? </i> </h1>
      ;;
  }
  dimension: seperator {
    sql: 1 ;;
    html:
      <h1 style="background: #c4d4ed;color: #c4d4ed;"> mwhahha mystery text  </h1>
 ;;
  }
  dimension: Time_title {
    type: string
    sql: 1 ;;
    html:
    <h1 style="background: #c4d4ed;color: black;"> <font size="50%"> Time of Death Statistics </font> <br> <i> When are you most likely to die? </i> </h1>
      ;;
  }
  dimension: Cause_title {
    type: string
    sql: 1 ;;
    html:
    <h1 style="background: #c4d4ed;color:black ;"> <font size="50%"> Cause of Death Statistics </font> <br> <i> Let's bucket them! </i> </h1>
      ;;
  }

  dimension: Hypersensitized_title {
    type: string
    sql: 1 ;;
    html:
    <h1 style="background: #c4d4ed;color:black ;"> <font size="50%"> Causes of Death by Race and Gender </font> <br> <i> Graphs that could easily be disguised as hypersensitized news stories </i> </h1>
      ;;
  }
  dimension: age_group_code {
    type: string
    sql: ${TABLE}.age_group_code ;;
    hidden: yes
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: county_code {
    type: number
    sql: ${TABLE}.county_code ;;
    hidden: yes
  }

  dimension: crude_rate {
    type: number
    sql: (case when ${TABLE}.crude_rate='NULL' or ${TABLE}.crude_rate='Unreliable' or ${TABLE}.crude_rate='Not Applicable' then NULL
      else ${TABLE}.crude_rate::decimal
      end)
       ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: gender_code {
    type: string
    sql: ${TABLE}.gender_code ;;
    hidden: yes
  }

  dimension: icd10_subchapter {
    type: string
    sql: ${TABLE}.icd10_subchapter ;;
  }

  dimension: icd10_subchapter_code {
    type: string
    sql: ${TABLE}.icd10_subchapter_code ;;
    hidden: yes
  }

  dimension: percent_total_deaths {
    type: number
    sql: ${TABLE}.percent_total_deaths ;;
  }

  dimension: population {
    type: string
    sql: case when ${TABLE}.population='NULL' or ${TABLE}.population='Not Applicable' then NULL
      else ${TABLE}.population::integer
      end
       ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: race_code {
    type: string
    sql: ${TABLE}.race_code ;;
    hidden: yes
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: TRIM(BOTH FROM ${TABLE}.state) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: category_short {
    type: string
    sql: ${icd10_code_mapping.category_short} ;;
  }
  measure: total_deaths {
    type: sum
    sql: ${deaths} ;;
    drill_fields: [icd10_subchapter, count]
#     html:
#       {% if icd10_code_mapping.category_short._value == 'Cancer' %}
#         <a href="https://localhost:9999/explore/death/deathrecords?qid=5xUT46OLeN2Id8avGpJCQ8&toggle=vis"> {{ value }}  </a>
#       {% elsif icd10_code_mapping.category_short._value == 'Circulatory' %}
#         <a href="https://localhost:9999/explore/death/deathrecords?qid=5xUT46OLeN2Id8avGpJCQ8&toggle=vis"> {{ value }}  </a>
#       {% elsif icd10_code_mapping.category_short._value == 'Congenital' %}
#         <a> {{value}} </a>
#       {% elsif icd10_code_mapping.category_short._value == 'Digestive' %}
#         <a> {{value}} </a>
#       {% elsif icd10_code_mapping.category_short._value == 'Endocrine' %}
#         <a> {{value}} </a>
#       {% elsif icd10_code_mapping.category_short._value == 'External Causes' %}
#        <a> {{value}} </a>
#       {% else %}
#         {{value}}
#       {% endif %} ;;
  }

  measure: total_population {
    type: sum
    sql: ${population} ;;
  }

  measure: weighted_death {
    type: number
    sql: ((${total_deaths} * 1.000)/nullif(${total_population},0)) * 1000 ;;
  }

  measure: percent_of_deaths {
    type: average
    sql: ${percent_total_deaths} ;;
  }

  measure: crude_deaths {
    type: max
    sql: (${crude_rate}/10) ;;
  }

#     html:
#        {% if icd10_code_mapping.category_short._value == 'Cancer' %}
#        <a href="https://localhost:9999/looks/54">  {{ rendered_value }} </a>
#       {% else %}
#       <p> {{ rendered_value }} </p>
#     {% endif %};;

}

#   - measure: display_value
#     type: number
#     sql: ${death_by_pop}
#     value_format_name: percent_4
#     html: |
#       {{ county._rendered_value }} || {{ rendered_value }}
