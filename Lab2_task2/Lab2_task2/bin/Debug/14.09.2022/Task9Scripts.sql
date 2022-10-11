/*
Закройте продукты (установите дату закрытия равную текущей) 
типа КРЕДИТ, у которых произошло полное погашение, 
но при этом не было повторной выдачи.
*/
UPDATE accounts
SET close_date=CURRENT_DATE()
WHERE saldo=0 AND product_ref IN
(SELECT products.id
FROM products INNER JOIN product_type 
ON products.product_type_id=product_type.id
WHERE product_type.name='КРЕДИТ')