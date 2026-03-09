select
    o.ORDERID,
    o.ORDERDATE,
    o.CUSTOMERID,
    o.EMPLOYEEID,
    o.STOREID,
    o.StatusCD,
    o.StatusDesc,
    COUNT(DISTINCT o.ORDERID) as OrderCount,
    SUM(oi.TotalPrice)        as Revenue,
    o.UPDATED_AT
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderitems') }} oi on o.ORDERID = oi.ORDERID
group by
    o.ORDERID,
    o.ORDERDATE,
    o.CUSTOMERID,
    o.EMPLOYEEID,
    o.STOREID,
    o.StatusCD,
    o.StatusDesc,
    o.UPDATED_AT
