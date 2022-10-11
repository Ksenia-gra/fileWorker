/*
Закройте возможность открытия 
(установите дату окончания действия) для типов продуктов, 
по счетам продуктов которых, 
не было движений более одного месяца.
*/
Use BankOperations;
UPDATE product_type
SET end_date=CURRENT_DATE()
WHERE id IN 
(SELECT product_type_id
FROM products INNER JOIN accounts
ON products.id = accounts.product_ref
WHERE accounts.id IN (SELECT acc_ref
FROM records
GROUP BY acc_ref
HAVING MAX(oper_date)<CURRENT_DATE()-INTERVAL 1 MONTH
ORDER BY acc_ref)) AND id<>0