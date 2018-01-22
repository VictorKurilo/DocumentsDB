

	-- creating database DocumentsDB--
create database DocumentstDB

use DocumentstDB
	
	-- creating table Document --
create table Document
(
	First_Name nvarchar(20) not null,
	Last_Name nvarchar(20) not null,
	Serial nvarchar(2) not null,
	Number int not null
)

	-- making unique key on First_Name and Last_Name
alter table Document
add constraint UQ_Document
unique (First_Name, Last_Name)

	-- Phone limitation to 9 chars --
alter table Document
add constrant CK_Document_Number
Check(number like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	-- inserting values into table Documents --
insert into Document (First_Name, Last_Name, Serial, Number)
values
('Михаил','Крепчук', 'MC', 98415435),
('Иван','Крук', 'AA', 24154543),
('Оксана','Буткова', 'MP', 65425412),
('Андрей','Шевченков', 'PK', 65253945),
('Анатолий','Дмитри', 'RU', 71255471),
('Иван','Петрухин', 'TU', 37146551),
('Виктор','Суботницки', 'ME', 45875819),
('Ольга','Белова', 'EU', 49366462),
('Виктор','Мелова', 'US', 31090430),
('Михаил','Буткова', 'PP', 70798724),
('Виктор','Крава', 'ML', 71628952),
('Виктор','Прокопенко', 'MC', 98415625),
('Антон','Крук', 'AA', 24158973),
('Оксана','Десятова', 'MP', 18925412),
('Антонина','Шевченко', 'PK', 75258945),
('Анатолий','Дмитров', 'RU', 71254671),
('Иван','Кобзар', 'TU', 37142651),
('Виктор','Грачь', 'ME', 45365819),
('Ольга','Буткова', 'EU', 49375462),
('Алина','Мелова', 'US', 31098430),
('Михаил','Савицкий', 'PP', 10793624),
('Артем','Крава', 'ML', 78034952)


	-- creating view --
--select * from Document where Serial = 'MC' and number like '%5%';

create view doc_view 
as select First_Name, Last_name as Full_Name, Serial, Number
from Document



	-- examples of using view --

-- shows all members --
select * from doc_view 

-- shows only user with with specific serial and passport number
select * from doc_view 
where Serial = 'PP' and Number='10793624'

-- shows all users with MC serial and number 5 in their passport
select * from doc_view 
where Serial = 'MC' and Number like'%5%'
