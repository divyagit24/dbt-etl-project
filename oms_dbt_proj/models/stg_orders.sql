select
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS as StatusCD,
    CASE
        WHEN STATUS = '01' THEN 'In Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS = '03' THEN 'Cancelled'
        ELSE NULL
    END AS StatusDesc,
    UPDATED_AT
from {{ source('L1_LANDING', 'orders') }}
