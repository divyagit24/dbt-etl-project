select 
os.CustomerID,
c.cUSTOMERNAME,
sum(os.OrderCount) as OrderCount,
sum(os.Revenue) as Revenue
from 
{{ ref ('orders_fact')}} os 
JOIN
{{ ref('stg_customers')}} c on os.CustomerID = c.CustomerID
group BY
os.CustomerID,
c.cUSTOMERNAME