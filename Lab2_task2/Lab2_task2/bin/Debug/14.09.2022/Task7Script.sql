/*
В результате сбоя в базе данных разъехалась 
информация между остатками и операциями по счетам. 
Напишите нормализацию (процедуру выравнивающую данные),
которая найдет 
такие счета и восстановит остатки по счету.
*/
USE BankOperations;

UPDATE accounts a
INNER JOIN (SELECT SUM(IF (dt=1,(-1)*sum,sum))as 'newsum' ,
acc_ref
FROM records
WHERE dt=0 OR dt=1
GROUP BY acc_ref
ORDER BY acc_ref) s ON a.id=s.acc_ref
SET saldo =newsum
WHERE a.saldo<>s.newsum AND a.id<>0