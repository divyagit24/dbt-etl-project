select
    ORDERITEMID,
    ORDERID,
    PRODUCTID,
    QUANTITY,
    UNITPRICE,
    QUANTITY * UNITPRICE as TotalPrice,
    UPDATED_AT
from {{ source('L1_LANDING', 'orderitems') }}
