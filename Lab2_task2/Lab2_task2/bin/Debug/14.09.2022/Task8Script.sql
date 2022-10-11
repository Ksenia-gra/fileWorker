/*
Сформируйте выборку, который содержит информацию о клиентах, 
которые полностью погасили кредит, но при этом не закрыли 
продукт и пользуются им дальше 
(по продукту есть операция новой выдачи кредита).
*/
SELECT clients.*
FROM clients INNER JOIN (accounts 
INNER JOIN ( products INNER JOIN product_type 
ON products.product_type_id=product_type.id)
ON accounts.product_ref=products.id)
ON clients.id=accounts.client_ref
WHERE accounts.saldo=0 AND
accounts.close_date is null
AND product_type.name='КРЕДИТ'
