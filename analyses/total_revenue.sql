with payments as ( 

    select * from {{ ref('stg_payments')}}
),
 final as (

    select created_at,
    sum(amount)

            
    from payments 
    where status = 'success'
    group by 1
    order by 1
)

select * from final