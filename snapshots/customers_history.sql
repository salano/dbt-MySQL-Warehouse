{% snapshot customers_history %}

    {{
        config(
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='CUSTOMERID',
          updated_at='updated_at',
          invalidate_hard_deletes=True,
        )
    }}

    select * from {{ source('landing', 'cust') }}

{% endsnapshot %}