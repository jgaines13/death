view: above_avg_causes_by_state {
  derived_table: {
    sql:
      with nat_avg as
          (
            SELECT
              case when icd10_subchapter = 'proteinuria and hypertensive disorders in pregnancy childbirth and the puerperium' then 'Oedema proteinuria and hypertensive disorders in pregnancy childbirth and the puerperium' else icd10_subchapter end as icd10_subchapter,
              ((1.00 * sum(deaths)/(SELECT sum(deaths) FROM death_by_county)) * 1000) as nat_death_rate,
               sum(deaths) nat_total_deaths
            FROM death_by_county
            GROUP by 1
          )
      , state_total_deaths as
          (
            SELECT
              trim( both ' ' from state) state,
              sum(deaths) as state_death_rate
            FROM death_by_county
            GROUP by 1
          )
      , icdstate_deaths as
          (
            SELECT
              trim( both ' ' from state) state,
              case when icd10_subchapter = 'proteinuria and hypertensive disorders in pregnancy childbirth and the puerperium' then 'Oedema proteinuria and hypertensive disorders in pregnancy childbirth and the puerperium' else icd10_subchapter end as icd10_subchapter,
              sum(deaths) as icd_state_deaths
            FROM death_by_county d
            GROUP by 1,2
          )
      , state_death_rate as
          (
            SELECT
              d.*,
              ((1.00 * d.icd_state_deaths)/s.state_death_rate) * 1000 cause_state_rate
            FROM icdstate_deaths d
            INNER JOIN state_total_deaths s
              ON s.state=d.state
          )
      , difference as
          (
            SELECT
              state,
              s.icd10_subchapter,
              (cause_state_rate/nat_death_rate)  as icddifferencial
            FROM state_death_rate s
            INNER JOIN nat_avg n
              ON s.icd10_subchapter = n.icd10_subchapter
            WHERE s.icd10_subchapter not like '%heart disease%'
              AND s.icd10_subchapter not like '%Malignant neoplasms%'
              AND s.icd10_subchapter not like '%eneral%'
              AND s.icd10_subchapter<>'Event of undetermined intent'
              AND s.icd10_subchapter not like '%not elsewhere classified'
          )
        --and s.icd10_subchapter not like '%ther%' and s.icd10_subchapter not like '%eneral%')
      , ranking as
        (
          SELECT
            *,
            row_number() over (partition by state order by icddifferencial desc)
          FROM difference
        )

      , top_causes as
        (
          SELECT * FROM ranking where row_number = 1
          )

       SELECT
        t.state,
        t.icd10_subchapter,
        icddifferencial,
         1.00 * icd_state_deaths/nat_total_deaths percent_of_total,
        dense_rank() over (order by lower(t.icd10_subchapter)) as icdbucket
        FROM top_causes t
        inner join nat_avg n on t.icd10_subchapter = n.icd10_subchapter
        inner join icdstate_deaths td on td.icd10_subchapter = t.icd10_subchapter and t.state = td.state
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: icd10_subchapter {
    type: string
    sql: ${TABLE}.icd10_subchapter ;;
  }

  dimension: icddifferencial {
    type: number
    sql: ${TABLE}.icddifferencial ;;
  }
  dimension: percent_of_total {
    type: number
    sql: ${TABLE}.percent_of_total;;
    value_format_name: percent_2
  }

  dimension: icdbucket {
    type: number
    sql: ${TABLE}.icdbucket ;;
    html: {{ above_avg_causes_by_state.icd10_subchapter._value }} | {{ above_avg_causes_by_state.percent_of_total._rendered_value }} ;;
  }

  set: detail {
    fields: [state, icd10_subchapter, icddifferencial, icdbucket]
  }
}
