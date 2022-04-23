create table users (
    id serial primary key,
    name varchar(255),
    age int
);

create table pets (
    id serial primary key,
    name varchar(255),
    species varchar(255),
    owner int references users(id) unique
);

insert into users(name, age) values('Yaroslav', 25);
insert into users(name, age) values('Mark', 35);
insert into users(name, age) values('Ann', 26);


insert into pets(species, owner) values('Собака', 1);
insert into pets(species, owner) values('Кошка', 2);
insert into pets(species, owner) values('Белка', 3);

update pets set name='Альма' where species = 'Собака';
update pets set name='Тимофей' where species = 'Кошка';
update pets set name='Бельчиха' where species = 'Белка';

select * from pets join users u on pets.owner = u.id;
select id as Идентификатор, name as Имя from users;
select id as идентификатор, name as кличка, owner as владелец, species as животное from pets;