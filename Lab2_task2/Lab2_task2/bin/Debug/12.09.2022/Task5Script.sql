/*Сформируйте выборку, которая содержит средние движения по 
счетам в рамках одного произвольного дня, в разрезе типа 
продукта.*/
SELECT oper_date as 'Выбранная дата',
product_type.name as 'Тип продукта',
AVG(records.sum) as 'Среднее движения по счетам'
FROM records INNER JOIN (accounts INNER JOIN 
(products INNER JOIN product_type 
ON products.product_type_id=product_type.id)
ON accounts.product_ref=products.id)
ON records.acc_ref=accounts.id
WHERE oper_date =str_to_date('01.10.2019','%d.%m.%Y')
GROUP BY product_type.name
