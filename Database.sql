create database Human_Resource;
use Human_Resource;

create table Employees
(
kennitala int,
firstName varchar(55),
lastName varchar(55),
email varchar(75),
phonenumber char(7),
hire_date date,
salary int,
constraint Employees_Pk primary key(kennitala)
);

create table location
(
ID int auto_increment,
city varchar(75),
zipcode varchar(32),
constraint Location_PK primary key(ID)
);


create table Department
(
ID int auto_increment,
manager int,
name varchar(75),
location int,
constraint Department_Pk primary key(ID),
constraint Manager_Fk foreign key(manager) references Employees(kennitala),
constraint Location_Fk foreign key(location) references location(ID)
);

create table works_at
(
ID int auto_increment,
Employe int,
department int,
constraint Work_at_Pk primary key(ID),
constraint Employe_Fk foreign key(Employe) references Employees(kennitala),
constraint Department_Fk foreign key(department) references Department(ID)
);

create table Jobs
(
ID int auto_increment,
title varchar(125),
max_salary int,
min_salary int,
constraint Job_Pk primary key(ID)
);

-- Stands for current job
create table cur_job
(
ID int auto_increment,
Employe int,
Job int,
Salary int,
constraint Curent_Job_PK primary key(ID),
constraint Empolye_FK foreign key(Employe) references Employees(kennitala),
constraint Job_FK foreign key(Job) references Jobs(ID)
);