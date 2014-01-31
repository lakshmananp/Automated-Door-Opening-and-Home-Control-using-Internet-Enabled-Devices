create database project;
use project;
drop table users;
create table users
(serverip varchar(50) primary key NOT NULL,
username char(20) NOT NULL,
emailid char(40) NOT NULL,
pswd varchar(20) NOT NULL,
phone1 varchar(50) NOT NULL,
phone2 varchar(50),
phone3 varchar(50),
red varchar(5),
blue varchar(5),
white varchar(5));

insert into users values('127.0.0.1','ani','anibharadwaj007@gmail.com','aniina','9962213111','9962585404','9962455674','off','off','off');
