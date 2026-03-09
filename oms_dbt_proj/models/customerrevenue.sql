select
    os.CUSTOMERID,
    c.CUSTOMERNAME,
    SUM(os.OrderCount) as OrderCount,
    SUM(os.Revenue)    as Revenue
from {{ ref('orders_fact') }} os
join {{ ref('stg_customers') }} c on os.CUSTOMERID = c.CUSTOMERID
group by
    os.CUSTOMERID,
    c.CUSTOMERNAME
