select
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE,
    UPDATED_AT,
    CONCAT(FIRSTNAME, ' ', LASTNAME) as CUSTOMERNAME
from {{ source('L1_LANDING', 'customers') }}
