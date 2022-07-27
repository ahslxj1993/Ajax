drop table products;

create table products(
id	number(11),
name varchar2(50),
price number,
maker varchar2(30)
);

alter table products
add primary key(id);

select * from products;

delete from products;

insert into products values (1,'È«±æµ¿',1000,'»ï¼º');

create table products_copy
as
select * from products;

delete PRODUCTS;

select max(id) from products;