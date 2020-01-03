view: county_fips_codes {
  sql_table_name: FIPS.COUNTY_FIPS_CODES ;;

  dimension: county_name {
    type: string
    sql: ${TABLE}."COUNTY_NAME" ;;
  }

  dimension: fips_code {
    type: string
    sql: ${TABLE}."FIPS_CODE" ;;
  }

  dimension: location_name {
    type: string
    sql: ${county_name} || ', ' || ${state_code} ;;
  }
  dimension: state_code {
    type: string
    sql: ${TABLE}."STATE_CODE" ;;
    link: {
      label: "{{value}} Detailed Weather Dashboard"
      url: "/dashboards/745?State={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  measure: count {
    type: count
    drill_fields: [county_name]
  }
}
