-- define records count for each table

{% set expected_counts = {

    'cust': 5,
    'emp': 5,
    'stores': 5,
    'suppl': 5,
    'prod': 5,
    'ordritms': 5,
    'ordr': 5
}

%}

--Test the count of records in each table
{% for table, expected_count in expected_counts.items() %}
select '{{ table }}' as table_name,
    (select count(1) from {{ source('landing', table) }}) as record_count,
    {{ expected_count }} as expected_count
where 
     (select count(1) from {{ source('landing', table) }}) < {{ expected_count }} 
     {% if not loop.last %}
        UNION ALL
     {% endif %}
{% endfor %}