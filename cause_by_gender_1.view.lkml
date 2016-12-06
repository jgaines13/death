explore: cause_by_gender_1 {
  label: "Cause By Gender"
}
view: cause_by_gender_1 {
  derived_table: {
    sql: with percents as (
      select
        icd10code,
        ((1.00 * count(*))/(select count(*) from deathrecords) * 1000) as nat_percent,
       ((1.00 * sum(case when sex = 'F' then 1 else 0 end))/(select count(*) from deathrecords))*1000 as f_percent,
       (( 1.00 * sum(case when sex = 'M' then 1 else 0 end))/(select count(*) from deathrecords))*1000 as m_percent
      from deathrecords group by 1)
      , differential as (
      select
      icd10code,
      f_percent-m_percent f_leaning,
      m_percent-f_percent m_leaning
      from percents)

      select *, (case when f_highest < 11 then 'F' else 'M' end) as sex_leaning from (
      select
      description,
      row_number() over (order by f_leaning desc) f_highest,
      row_number() over (order by m_leaning desc) m_highest
      from differential d
      inner join icd10code i on d.icd10code = i.code) a
      where
      f_highest < 11 OR m_highest <11


       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description;;
  }

  measure: description_list {
    type: list
    list_field: description
  }
  measure: top_icd10_codes_f{
    type: string
    sql: replace(replace(replace(${description_list}, '|RECORD|', '                                                        '), 'unspecified', ''), ',', '') ;;
     html:
      <span style="white-space: pre-wrap; color: #7b3294; font-size: 125%">{{ value }} </span>;;

  }
  measure: top_icd10_codes_m{
    type: string
    sql: replace(replace(replace(replace(replace(${description_list}, '|RECORD|', '                                                                           '), 'unspecified', ''), ',', ' '), 'so described', ''), 'not elsewhere classified', '')          ;;
    html:
      <span style="white-space: pre-wrap; color:#008837; font-size: 125%">{{ value }} </span>;;

    }
  dimension: femalepic {
    type: string
    sql: 1 ;;
    html:
   <img src="https://s-media-cache-ak0.pinimg.com/236x/06/cd/8d/06cd8d416a2620a6b526e3104dc9a05a.jpg" width="200" height="500" > ;;
  }
  measure: malegraphic {
    type: average
    sql: 1 ;;
    html:
    <img src="http://samawaterco.moonfruit.com/communities/1/004/011/425/891/images/4583663045_139x318.jpg" width="200" height="500"  >;;
  }

  dimension: f_highest {
    type: number
    sql: ${TABLE}.f_highest ;;
  }

  dimension: m_highest {
    type: number
    sql: ${TABLE}.m_highest ;;
  }

  dimension: sex_leaning {
    type: string
    sql: ${TABLE}.sex_leaning ;;
  }

  set: detail {
    fields: [description, f_highest, m_highest, sex_leaning]
  }
}
