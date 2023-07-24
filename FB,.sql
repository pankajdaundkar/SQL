create table FB_Users(
user_id int primary key,
user_name varchar(30),
email varchar(20),
phone_no varchar(20),
total_posts int
)
create table Post(
post_id int primary key,
user_id int foreign key (user_id)references FB_Users(user_id),
Postid int,
post_image varchar(20),
post_video varchar(40)
)

create table Friendship(
user_id int foreign key (user_id)references FB_Users(user_id),
friend_id int primary key,
friendship_statuscode int
)

create table Friendship_status(
friendship_statuscode int,
status int
)