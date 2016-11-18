view: population {
  derived_table: {
    sql:
    select 'Under 5 years' as age_group,  15363848 as white,  3659359 as black, 560829 as American_indian, 1440869 as Asian, 145031 as Pacific_islander
    union all
    select '5 - 9 years' as age_group, 15908736 as white,  3679469 as black, 562394 as American_indian,  1443837 as Asian, 140439 as Pacific_islander
    union all
    select '10 - 14 years' as age_group, 16085177 as white,  3568388 as black, 540460 as American_indian,  1381207 as Asian, 126876 as Pacific_islander
    union all
    select '15 - 19 years' as age_group, 16341761 as white,  3638966 as black, 539734 as American_indian,  1339193 as Asian, 121622 as Pacific_islander
    union all
    select '20 - 24 years' as age_group, 17445892 as white,  4012268 as black, 567087 as American_indian,  1562292 as Asian, 132573 as Pacific_islander
    union all
    select '25 - 29 years' as age_group, 16874643 as white,  3427414 as black, 497717 as American_indian,  1688618 as Asian, 126438 as Pacific_islander
    union all
    select '30 - 34 years' as age_group, 16640025 as white,  3156919 as black, 474087 as American_indian,  1696435 as Asian, 119438 as Pacific_islander
    union all
    select '35 - 39 years' as age_group, 15411599 as white,  2870950 as black, 425335 as American_indian,  1576334 as Asian, 100418 as Pacific_islander
    union all
    select '40 - 44 years' as age_group, 16062142 as white,  2873901 as black, 408397 as American_indian,  1559045 as Asian, 89475 as Pacific_islander
    union all
    select '45 - 49 years' as age_group, 16580921 as white,  2838318 as black, 392479 as American_indian,  1338322 as Asian, 81662 as Pacific_islander
    union all
    select '50 - 54 years' as age_group, 18239956 as white,  2934513 as black, 402606 as American_indian,  1243590 as Asian, 78829 as Pacific_islander
    union all
    select '55 - 59 years' as age_group, 17598075 as white,  2665133 as black, 355303 as American_indian,  1108403 as Asian, 64734 as Pacific_islander
    union all
    select '60 - 64 years' as age_group, 15410974 as white,  2111499 as black, 276167 as American_indian,  928967 as Asian,  49039 as Pacific_islander
    union all
    select '65 - 69 years' as age_group, 12985667 as white,  1534371 as black, 205078 as American_indian,  716242 as Asian,  36402 as Pacific_islander
    union all
    select '70 - 74 years' as age_group, 9481618 as white, 1040784 as black, 134158 as American_indian,  492876 as Asian,  23716 as Pacific_islander
    union all
    select '75 - 79 years' as age_group, 6811594 as white, 723555 as black,  86377 as American_indian, 347589 as Asian,  15562 as Pacific_islander
    union all
    select '80 - 84 years' as age_group, 5022581 as white, 478627 as black,  53353 as American_indian, 231018 as Asian,  9973 as Pacific_islander
    union all
    select '85 years and over' as age_group,  5443924 as white, 465575 as black,  47546 as American_indian, 216462 as Asian,  8796 as Pacific_islander


    ;;
  }

  dimension: age_group {
    primary_key: yes
  }
  dimension: white {
    type: number
  }
  dimension: black {
    type: number
  }
  dimension: American_indian {
    type: number
  }
  dimension: Asian {
    type: number
  }
  dimension: pacific_islander {
    type: number
  }
  measure:  avg_black {
    type:average
    sql: ${black};;
  }
  measure:  avg_white {
    type: average
    sql: ${white};;
  }
  measure: percent_of_total_white {
    type: number
    sql: (100 * (${deathrecords.count}/${avg_white}));;
    value_format_name: percent_2
  }
  measure: percent_of_total_black {
    type: number
    sql: (100 * (${deathrecords.count}/${avg_black})) ;;
    value_format_name: percent_2
  }
}
