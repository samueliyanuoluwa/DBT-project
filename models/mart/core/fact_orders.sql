With Orders as (
    Select 
        order_id,
        customer_id,
        order_date,
        status
    From {{ref('stg_orders')}} 
),

payment as (
   Select 
        Order_Id,
        Sum(case when Status='Success' then Amount else 0 end) as Amount
    From {{ref('stg_payments')}} 
    Group by 1
),

fact_orders as (
    Select  
        Orders.order_id,
        Orders.customer_id,
        Orders.order_date, 
        payment.Amount
    From Orders
    Left Join payment using (Order_Id) 
)
Select * from fact_orders