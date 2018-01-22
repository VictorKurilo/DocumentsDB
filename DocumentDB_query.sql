

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
('Oleg','Propenko', 'MC', 98415435),
('Ivan','Drojnoi', 'AA', 24154543),
('Sandra','Bajova', 'MP', 65425412),
('Sasha','Shevchenka', 'PK', 65253945),
('Artem','Lesyatkov', 'RU', 71255471),
('Alina','Mushigina', 'TU', 37146551),
('Mikhail','Svobodnu', 'ME', 45875819),
('Olga','Melova', 'EU', 49366462),
('Anton','Meloikoi', 'US', 31090430),
('Victor','Makar', 'PP', 70798724),
('Victor','Cukov', 'ML', 71628952),
('Irinia','Surova', 'MC', 98415625),
('Yulya','Tristoba', 'AA', 24158973),
('Oksana','Jokirina', 'MP', 18925412),
('Irina','Legovna', 'PK', 75258945),
('Misha','Luskov', 'RU', 71254671),
('Alex','Kilinin', 'TU', 37142651),
('Victor','Vernovu', 'ME', 45365819),
('Yaroslav','Retur', 'EU', 49375462),
('Artem','Bolshoi', 'US', 31098430),
('Sasha','Lmitrovna', 'PP', 10793624),
('Victor','Leskova', 'ML', 78034952)


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
