use travego;

-- a.How many female passengers traveled a minimum distance of 600 KMs
select count(*) as female_passengers from passenger where Gender = 'F' and Distance >= 600;

-- b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. 
select * from passenger where Distance > 500 and Bus_type='Sleeper';

-- c.Select passenger names whose names start with the character 'S'
select * from passenger where passenger_name like 'S%';

select * from price;
-- d.Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,Destination City, Bus type, and Price in the output

select p.passenger_name,p.boarding_city,p.Destination_city,p.bus_type,pr.price
from passenger p left join price pr on p.Distance=pr.distance and p.bus_type=pr.bus_type;

-- e.What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus

select p.passenger_name,pr.price,p.distance
from passenger p  join price pr on p.passenger_id 
where p.Distance> 1000 and p.Bus_type = 'Sitting'=pr.id;

-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select passenger_name,pr.bus_type,pr.price
from passenger p left join price pr on p.distance = pr.distance
where p.passenger_name = 'Pallavi';

-- g.Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
set sql_safe_updates=0; update passenger set category = 'Non-Ac' where Bus_type='Sleeper';
select * from passenger;

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
set autocommit = 0;
commit;
delete from passenger where passenger_name = 'Piyush';

-- i. Truncate the table passenger and comment on the number of rows in the table
truncate table passenger;
select * from passenger;
-- There is no data in the table Passenger because Trucate() will remove all the data without deleting the structure of the table. 

-- j.Delete the table passenger from the database.
drop Table Passenger;


show tables;
