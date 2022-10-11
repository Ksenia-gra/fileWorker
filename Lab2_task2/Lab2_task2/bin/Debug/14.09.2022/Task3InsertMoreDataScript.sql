/*
Подготовьте скрипты заполнения таблиц тестовыми данными, 
достаточными для выполнения заданий ниже.
*/
USE BankOperations;
insert ignore into clients values (4, 'Решетников Андрей Андреевич', 'Россия, Ленинградская облать, г. Кировск', str_to_date('02.02.2002','%d.%m.%Y'), 'Россия, Ленинградская облать, г. Кировск, ул. Ленина, д. 5', '5555 777777, выдан ОВД г. Кировск, 11.02.2016');
insert ignore into clients values (5, 'Алентьев Вадим Вадимович', 'Россия, Московская облать, г. Балашиха', str_to_date('03.04.2003','%d.%m.%Y'), 'Россия, Московская облать, г. Балашиха, ул. Пушкина, д. 7', '4444 666666, выдан ОВД г. Балашиха, 12.03.2017');

insert ignore into products values (4, 1, 'Кредитный договор с Решетниковым А.А.', 4, str_to_date('01.06.2016','%d.%m.%Y'), null);
insert ignore into products values (5, 2, 'Депозитный договор с Решетниковым А.А.', 4, str_to_date('01.08.2018','%d.%m.%Y'), null);
insert ignore into products values (6, 2, 'Депозитный договор с Алентьевым В.В.', 5, str_to_date('01.08.2018','%d.%m.%Y'), null);
insert ignore into products values (7, 3, 'Карточный договор с Алентьевым В.В.', 5, str_to_date('01.08.2017','%d.%m.%Y'), null);

insert ignore into accounts values (4, 'Кредитный договор с Решетниковым А.А.', -2000, 4, str_to_date('01.06.2016','%d.%m.%Y'), null, 4, '45502810401020000044');
insert ignore into accounts values (5, 'Депозитный счет для Решетникова А.А.', 6000, 4, str_to_date('01.08.2018','%d.%m.%Y'), null, 5, '42301810400000000004');
insert ignore into accounts values (6, 'Депозитный счет для Алентьева В.В.', 8000, 5, str_to_date('01.08.2018','%d.%m.%Y'), null, 6, '40817810700000000005');
insert ignore into accounts values (7, 'Карточный счет для Алентьева В.В.', 8000, 5, str_to_date('01.08.2017','%d.%m.%Y'), null, 7, '40817810700000000005');

insert ignore into records values (16, 1, 7000, 4, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (17, 1, 9000, 4, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (18, 1, 4000, 6, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (19, 1, 2000, 6, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (20, 0, 1000, 5, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (21, 1, 3000, 5, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (22, 1, 3000, 4, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (23, 1, 3000, 5, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (24, 0, 4000, 4, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (25, 0, 9000, 7, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (26, 0, 5000, 5, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (27, 0, 1000, 6, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (28, 1, 1000, 4, str_to_date('01.10.2019','%d.%m.%Y'));

insert ignore into records values (29, 1, 5000, 7, str_to_date('01.10.2019','%d.%m.%Y'));
insert ignore into records values (30, 1, 2000, 7, str_to_date('01.10.2019','%d.%m.%Y'));


insert ignore into records values (31, 0, 14000, 4, str_to_date('13.10.2020','%d.%m.%Y'));
insert ignore into records values (32, 0, 5000, 6, str_to_date('26.10.2020','%d.%m.%Y'));
insert ignore into records values (33, 0, 5000, 5, str_to_date('14.11.2020','%d.%m.%Y'));
insert ignore into records values (34, 0, 13000, 6, str_to_date('01.11.2020','%d.%m.%Y'));
insert ignore into records values (35, 0, 6000, 7, str_to_date('04.12.2020','%d.%m.%Y'));

insert ignore into records values (36, 0, 2000, 6, str_to_date('01.08.2022','%d.%m.%Y'));
insert ignore into records values (37, 0, 5000, 6, str_to_date('01.08.2022','%d.%m.%Y'));
insert ignore into records values (38, 1, 10000, 4, str_to_date('01.08.2022','%d.%m.%Y'));
insert ignore into records values (39, 1, 5000, 7, str_to_date('14.08.2022','%d.%m.%Y'));
insert ignore into records values (40, 1, 7000, 4, str_to_date('29.08.2022','%d.%m.%Y'));
insert ignore into records values (41, 0, 1000, 4, str_to_date('29.08.2022','%d.%m.%Y'));
insert ignore into records values (42, 1, 9000, 7, str_to_date('29.08.2022','%d.%m.%Y'));

insert ignore into records values (43, 1, 2000, 6, str_to_date('01.09.2022','%d.%m.%Y'));
insert ignore into records values (44, 0, 5000, 7, str_to_date('03.09.2022','%d.%m.%Y'));
insert ignore into records values (45, 0, 7000, 4, str_to_date('11.09.2022','%d.%m.%Y'));
insert ignore into records values (46, 1, 5000, 6, str_to_date('12.09.2022','%d.%m.%Y'));
insert ignore into records values (47, 1, 1000, 4, str_to_date('12.09.2022','%d.%m.%Y'));
insert ignore into records values (48, 0, 9000, 7, str_to_date('12.09.2022','%d.%m.%Y'));
insert ignore into records values (49, 0, 10000, 4, str_to_date('12.09.2022','%d.%m.%Y'));