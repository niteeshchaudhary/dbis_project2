CREATE USER 'ishifree'@'localhost' IDENTIFIED BY 'Freelancer@9876'; 
CREATE DATABASE if not exists ishifree;
GRANT ALL PRIVILEGES ON ishifree.* TO 'ishifree'@'localhost';

-- Freelancers

create table  if not exists freelancers (Id varchar(20) primary key,
password varchar(20) not null
);

create table  if not exists  freewallet (Id varchar(20) primary key,
amount int default 0 check (amount>=0),
foreign key(Id) references freelancers(Id)
);

create table  if not exists  freedetails (Id varchar(20) primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
photo mediumblob,
gender varchar(1) not null,
company varchar(100) not null,
position varchar(100) not null,
phone_no int(10) not null check (work_phone > 1000000000 AND work_phone< 9999999999), 
street varchar(30),
city varchar(15)not null,
state varchar(15) not null,
pincode varchar(6) not null
);

create table  if not exists  freeeducation (Id varchar(20),
university varchar(30) not null,
degree varchar(10),
year_start date not null, 
year_end date CHECK (year_start<=year_end),
primary key(Id, university, year_start),
foreign key(Id) references freelancers(Id)
);

create table  if not exists freeexperience (Id varchar(20),
company varchar(30) not null,
title varchar(10),
start_date date not null, 
end_date date CHECK (start_date<=end_date),
description varchar(300),
primary key(Id, company, title, start_date),
foreign key(Id) references freelancers(Id)
);

-- employer

create table  if not exists  employer (Id varchar(20) primary key,
password varchar(20) not null
);

create table  if not exists  empwallet (Id varchar(20) primary key,
amount int default 0 check (amount>=0),
foreign key(Id) references freelancers(Id)
);

create table  if not exists  empdetails (Id varchar(20) primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
photo mediumblob,
gender varchar(1) not null,
company varchar(100) not null,
position varchar(100) not null,
phone_no int(10) not null check(phone_no > 1000000000 AND phone_no< 9999999999), 
street varchar(30),
city varchar(15)not null,
state varchar(15) not null,
pincode varchar(6) not null,
);


create table  if not exists  jobs (job_id varchar(20),
role varchar(20),
emp_id varchar(20),
status int(2) not null check (status=0 or status=1),
duration int not null check (duration>=1 AND duration<=12),
budget varchar(10) not null check (budget>0),
skill varchar(60) not null,
description text(800) not null,
post_date date not null, 
exp_date date not null,
primary key(job_id),
foreign key(emp_id) references employer(Id)
);

create table  if not exists  proposals (
proposal_id varchar(20),
job_id varchar(20),
free_id varchar(20),
emp_id varchar(20),
status int(2) not null check (status=0 or status=1 or status=2),
duration int not null,
budget int not null,
coverletter text(800) not null,
post_date date not null, 
primary key(proposal_id),
foreign key(emp_id) references employer(Id),
foreign key(free_id) references freelancers(Id),
foreign key(job_id) references jobs(job_id)
);