create table Movie(
movie_id int primary key,
movie_name varchar(30),
relese_year int ,
box_office_collection int
)
sp_help Movie

create table roles(
roll_id int primary key,
roll_name varchar(30)
)
sp_help roles

 create table celebrety(
 celebrety_id int primary key,
 celebrety_name varchar(50),
 birthdate int,
 phone_no int,
 email varchar(20)
 )
 sp_help celebrety

  create table BollywoodData(
  BollywoodData_id int,
  celebrety_id int foreign key(celebrety_id)references celebrety(celebrety_id),
  movie_id int foreign key (movie_id)references Movie(movie_id),
  roll_id int foreign key(roll_id)references roles(roll_id)
  )
  sp_help BollywoodData

