create table devices(
        id serial primary key,
        name varchar(255),
        price float
);

create table people(
       id serial primary key,
       name varchar(255)
);

create table devices_people(
       id serial primary key,
       device_id int references devices(id),
       people_id int references people(id)
);

insert into devices(name, price) values
('IPhone 5', 22000),
('IPhone 10', 30000),
('IPhone 12', 50000),
('Samsung A', 15000),
('Samsung B', 20000),
('Samsung C', 25000),
('Nokia 2100', 5000),
('Nokia 3100', 6000),
('Nokia 4100', 7000);
insert into people(name) values
('Steve'),
('Mike'),
('Bernard');

insert into devices_people(device_id, people_id) values (1, 1);
insert into devices_people(device_id, people_id) values (2, 1);
insert into devices_people(device_id, people_id) values (3, 1);

insert into devices_people(device_id, people_id) values (4, 2);
insert into devices_people(device_id, people_id) values (5, 2);
insert into devices_people(device_id, people_id) values (6, 2);

insert into devices_people(device_id, people_id) values (7, 3);
insert into devices_people(device_id, people_id) values (8, 3);
insert into devices_people(device_id, people_id) values (9, 3);

//Вывожу девайсы Стива
select * from devices_people dp
                  join people p on p.id = dp.people_id
                  join devices d on d.id = dp.device_id
where p.name = 'Steve';

//Средняя цена всех девайсов
select avg(price) from devices;

select avg(price) from devices_people dp
                  join people p on p.id = dp.people_id
                  join devices d on d.id = dp.device_id
where p.name = 'Steve';

select avg(price) from devices_people dp
                           join people p on p.id = dp.people_id
                           join devices d on d.id = dp.device_id
where p.name = 'Mike';

select avg(price) from devices_people dp
                           join people p on p.id = dp.people_id
                           join devices d on d.id = dp.device_id
where p.name = 'Bernard' ;

select avg(price) from devices_people dp
                           join people p on p.id = dp.people_id
                           join devices d on d.id = dp.device_id
where p.name = 'Bernard' having avg(d.price) > 5000;


