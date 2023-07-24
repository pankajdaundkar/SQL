create table BOOK(
book_id int primary key,
book_name varchar(30),
author_id int ,
price numeric (6,2)
)
alter table BOOK add constraint authoridfk foreign key(author_id) references author(author_id)

sp_help BOOK

create table author(
author_id int primary key,
author_name varchar (30),
phone_no varchar(10),
email varchar(10),
address varchar(50),
city varchar(20)
)
 create table award(
 award_id int,
 award_type int ,
 author_id int,
 book_id int ,
 constraint award_type_fk foreign key (award_type)references award_master(award_type_id),
  constraint author_id_fk foreign key (author_id)references author (author_id) ,
  constraint book_id_fk foreign key (book_id)references BOOK(book_id)
 )

 
 sp_help award

 create table award_master(
 award_type_id int primary key,
 award_name varchar(30),
 award_price numeric(6,2)
 )
 sp_help award_master
