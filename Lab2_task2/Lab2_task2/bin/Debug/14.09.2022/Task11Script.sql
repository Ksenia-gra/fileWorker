/*
В модель данных добавьте сумму договора по продукту. 
Заполните поле для всех продуктов суммой максимальной 
дебетовой операции по счету для продукта типа КРЕДИТ, 
и суммой максимальной кредитовой операции по счету 
продукта для продукта 
типа ДЕПОЗИТ или КАРТА.
*/
Use BankOperations;

ALTER TABLE  products
ADD sum_contract  FLOAT(10, 2);


UPDATE products INNER JOIN product_type ON 
products.product_type_id=product_type.id

SET sum_contract = CASE 
WHEN
products.product_type_id =
(SELECT id
FROM product_type
WHERE name='КРЕДИТ') 
THEN (SELECT MAX(sum)
FROM records,accounts,product_type
WHERE records.acc_ref=accounts.id
AND products.id=accounts.product_ref
AND product_type.name='КРЕДИТ'
AND records.dt=1
GROUP BY product_type.name)
WHEN products.product_type_id =
(SELECT id
FROM product_type
WHERE name='ДЕПОЗИТ' ) 
THEN (SELECT MAX(sum)
FROM records,accounts,product_type
WHERE records.acc_ref=accounts.id
AND products.id=accounts.product_ref
AND product_type.name='ДЕПОЗИТ'
AND records.dt=0
GROUP BY product_type.name)
WHEN products.product_type_id =
(SELECT id
FROM product_type
WHERE name='КАРТА' )
THEN (SELECT MAX(sum)
FROM records,accounts,product_type
WHERE records.acc_ref=accounts.id
AND products.id=accounts.product_ref
AND product_type.name='КАРТА'
AND records.dt=0
GROUP BY product_type.name)
END;