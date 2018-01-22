

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
('������','�������', 'MC', 98415435),
('����','����', 'AA', 24154543),
('������','�������', 'MP', 65425412),
('������','���������', 'PK', 65253945),
('��������','������', 'RU', 71255471),
('����','��������', 'TU', 37146551),
('������','����������', 'ME', 45875819),
('�����','������', 'EU', 49366462),
('������','������', 'US', 31090430),
('������','�������', 'PP', 70798724),
('������','�����', 'ML', 71628952),
('������','����������', 'MC', 98415625),
('�����','����', 'AA', 24158973),
('������','��������', 'MP', 18925412),
('��������','��������', 'PK', 75258945),
('��������','�������', 'RU', 71254671),
('����','������', 'TU', 37142651),
('������','�����', 'ME', 45365819),
('�����','�������', 'EU', 49375462),
('�����','������', 'US', 31098430),
('������','��������', 'PP', 10793624),
('�����','�����', 'ML', 78034952)


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
