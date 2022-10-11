/*
Сформируйте выборку, в который попадут клиенты, у 
которых были операции по счетам за прошедший месяц от 
текущей даты. Выведите клиента и 
сумму операций за день в разрезе даты.
*/
USE BankOperations;
SELECT clients.id,clients.name as 'Имя клиента',
oper_date as 'Дата операции',SUM(sum) as 'Сумма операций клиента'
FROM clients LEFT JOIN (accounts INNER JOIN records 
ON accounts.id=records.acc_ref) 
ON clients.id=accounts.client_ref 
WHERE records.id IN 
(SELECT records.id
FROM records
WHERE (oper_date>=CURRENT_DATE()-INTERVAL 1 MONTH) 
AND MONTH(oper_date)<>MONTH(CURRENT_DATE()) ) 
GROUP BY clients.id,records.oper_date
ORDER BY oper_date