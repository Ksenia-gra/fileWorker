/*
Сформируйте отчет, который содержит все счета, 
относящиеся к продуктам типа ДЕПОЗИТ, принадлежащих клиентам, 
у которых нет открытых продуктов типа КРЕДИТ.
*/
USE BankOperations;
SELECT 'счет',NOW() as 'Время запроса',
accounts.*
FROM accounts,products
WHERE products.id=accounts.product_ref 
AND accounts.client_ref NOT IN (SELECT products.client_ref
FROM products,product_type
WHERE product_type.id=products.product_type_id 
AND product_type.name='КРЕДИТ' 
) 
AND accounts.product_ref IN (SELECT products.id
FROM products,product_type
WHERE product_type.id=products.product_type_id 
AND product_type.name='ДЕПОЗИТ' 
)