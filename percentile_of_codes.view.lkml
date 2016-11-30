view: percentile_of_codes {
  derived_table: {
    sql:
    with cte as
      (SELECT
        row_number() over ( order by ((1.00 * COUNT(*))/(select count(*) from deathrecords) * 100) desc),
        icd10code.description  AS "icd10code_description",
        ((1.00 * COUNT(*))/(select count(*) from deathrecords) * 100) AS "percent_total_deaths"
        FROM public.deathrecords  AS deathrecords
      LEFT JOIN public.icd10code  AS icd10code ON deathrecords.icd10code = icd10code.code
      GROUP BY 2)
      (select max(0), sum(0) )
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<2)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<3)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<6)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<11)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<26)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<51)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<76)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<101)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<151)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte where row_number<201)
      union all
      (select max(row_number), sum(percent_total_deaths) from cte)
       ;;
  }

  measure: count {
    type: count
  }

  dimension: count_icd_codes {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: percent_of_total {
    type: number
    sql: ${TABLE}.sum ;;
  }


}
