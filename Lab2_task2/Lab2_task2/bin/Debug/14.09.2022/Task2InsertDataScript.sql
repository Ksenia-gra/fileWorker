/*Заполните таблицы примерами из приложенного скрипта.*/
USE BankOperations;
insert into tarifs values (1,'Тариф за выдачу кредита', 10);
insert into tarifs values (2,'Тариф за открытие счета', 10);
insert into tarifs values (3,'Тариф за обслуживание карты', 10);

insert into product_type values (1, 'КРЕДИТ', str_to_date('01.01.2018','%d.%m.%Y'), null, 1);
insert into product_type values (2, 'ДЕПОЗИТ', str_to_date('01.01.2018','%d.%m.%Y'), null, 2);
insert into product_type values (3, 'КАРТА', str_to_date('01.01.2018','%d.%m.%Y'), null, 3);

insert into clients values (1, 'Сидоров Иван Петрович', 'Россия, Московская облать, г. Пушкин', str_to_date('01.01.2001','%d.%m.%Y'), 'Россия, Московская облать, г. Пушкин, ул. Грибоедова, д. 5', '2222 555555, выдан ОВД г. Пушкин, 10.01.2015');
insert into clients values (2, 'Иванов Петр Сидорович', 'Россия, Московская облать, г. Клин', str_to_date('01.01.2001','%d.%m.%Y'), 'Россия, Московская облать, г. Клин, ул. Мясникова, д. 3', '4444 666666, выдан ОВД г. Клин, 10.01.2015');
insert into clients values (3, 'Петров Сиодр Иванович', 'Россия, Московская облать, г. Балашиха', str_to_date('01.01.2001','%d.%m.%Y'), 'Россия, Московская облать, г. Балашиха, ул. Пушкина, д. 7', '4444 666666, выдан ОВД г. Клин, 10.01.2015');

insert into products values (1, 1, 'Кредитный договор с Сидоровым И.П.', 1, str_to_date('01.06.2015','%d.%m.%Y'), null);
insert into products values (2, 2, 'Депозитный договор с Ивановым П.С.', 2, str_to_date('01.08.2017','%d.%m.%Y'), null);
insert into products values (3, 3, 'Карточный договор с Петровым С.И.', 3, str_to_date('01.08.2017','%d.%m.%Y'), null);


insert into accounts values (1, 'Кредитный счет для Сидоровым И.П.', -2000, 1, str_to_date('01.06.2015','%d.%m.%Y'), null, 1, '45502810401020000022');
insert into accounts values (2, 'Депозитный счет для Ивановым П.С.', 6000, 2, str_to_date('01.08.2017','%d.%m.%Y'), null, 2, '42301810400000000001');
insert into accounts values (3, 'Карточный счет для Петровым С.И.', 8000, 3, str_to_date('01.08.2017','%d.%m.%Y'), null, 3, '40817810700000000001');

insert into records values (1, 1, 5000, 1, str_to_date('01.06.2015','%d.%m.%Y'));
insert into records values (2, 0, 1000, 1, str_to_date('01.07.2015','%d.%m.%Y'));
insert into records values (3, 0, 2000, 1, str_to_date('01.08.2015','%d.%m.%Y'));
insert into records values (4, 0, 3000, 1, str_to_date('01.09.2015','%d.%m.%Y'));
insert into records values (5, 1, 5000, 1, str_to_date('01.10.2015','%d.%m.%Y'));
insert into records values (6, 0, 3000, 1, str_to_date('01.10.2015','%d.%m.%Y'));

insert into records values (7, 0, 10000, 2, str_to_date('01.08.2017','%d.%m.%Y'));
insert into records values (8, 1, 1000, 2, str_to_date('05.08.2017','%d.%m.%Y'));
insert into records values (9, 1, 2000, 2, str_to_date('21.09.2017','%d.%m.%Y'));
insert into records values (10, 1, 5000, 2, str_to_date('24.10.2017','%d.%m.%Y'));
insert into records values (11, 0, 6000, 2, str_to_date('26.11.2017','%d.%m.%Y'));

insert into records values (12, 0, 120000, 3, str_to_date('08.09.2017','%d.%m.%Y'));
insert into records values (13, 1, 1000, 3, str_to_date('05.10.2017','%d.%m.%Y'));
insert into records values (14, 1, 2000, 3, str_to_date('21.10.2017','%d.%m.%Y'));
insert into records values (15, 1, 5000, 3, str_to_date('24.10.2017','%d.%m.%Yclients'));

commit;
