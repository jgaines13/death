view: icd10code {
  sql_table_name: public.icd10code ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    html:
      {% if value == 'Victim of flood' %}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flood102405.JPG/220px-Flood102405.JPG" width="100" height="100" >
        {% elsif value == 'Victim of lightning' %}
        <img src="http://www.runnersworld.com/sites/runnersworld.com/files/styles/article_main_image_2200px/public/lightningbolts.jpg?itok=0xeOW11X" width="100" height="100" >
      {% elsif value == 'Victim of cataclysmic storm' %}
        <img src="http://beforeitsnews.com/contributor/upload/291278/images/storm.jpg" width="100" height="100" >
      {% elsif value == 'Victim of unspecified effect of earthquake' %}
        <img src="http://i.dailymail.co.uk/i/pix/2016/07/11/16/362A581700000578-3684200-image-a-9_1468251683384.jpg" width="100" height="100" >
      {% else %}
        <img src="http://www.kingcounty.gov/~/media/depts/executive-services/emergency-management/images/hazards/avalanche.ashx?la=en" width="100" height="100" >
      {% endif %}
        ;;}
  measure: count {
    type: count
    drill_fields: []
  }
}
