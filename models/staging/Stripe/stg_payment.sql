/*With payments as (
    Select
        ID,
        orderid as Order_Id,
        Paymentmethod,
        Status,
        amount / 100 as amount,
        created as created_at
    From raw.stripe.payment
)
Select * From payments*/

Select
    ID,
    orderid as Order_Id,
    Paymentmethod,
    Status,
    amount / 100 as amount,
    created as created_at
from {{ source('stripe', 'payment') }}