with customer_orders as (
    select
        c.CUSTOMERID,
        c.CUSTOMERNAME,
        COUNT(o.ORDERID) as No_Of_Orders
    from {{ ref('stg_customers') }} c
    inner join {{ ref('stg_orders') }} o on c.CUSTOMERID = o.CUSTOMERID
    group by
        c.CUSTOMERID,
        c.CUSTOMERNAME
)

select
    CUSTOMERID,
    CUSTOMERNAME,
    No_Of_Orders
from customer_orders
order by No_Of_Orders desc
