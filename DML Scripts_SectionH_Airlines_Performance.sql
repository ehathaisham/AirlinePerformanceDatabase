/* Two insert statments */
insert into manufacturer values (105, 500, 'Airbus', 999);
insert into aircraft_type values (900,105,900,105);

-- Two UPDATE statements
update manufacturer set SSD_NAME_ID = 200 where Manufacturer = 'DASSAULT FALCON';
update baggage set Airline = 'Hawaiian Airlines' where Airline_ID = 2;

-- A DELETE Statement
delete from aircraft_type where AC_typeID = 900;

-- A simple SELECT statement
select * from baggage;

-- Two JOIN statements
select aircraft_type.Manufacturer_Manufacturer_ID from aircraft_type inner join manufacturer ON aircraft_type.Manufacturer_ID=manufacturer.Manufacturer_ID;
select airline.Flight_ID, airline.Airline, airline.Airport_ID from airline inner join country ON airline.Country_Country_ID=country.Country_ID;

-- Two Summary statements
select count(Airport_ID) from airline where IATA_code_airline_IATA_Code_Airline = 'AA';
select count(Manufacturer) from manufacturer where AC_TYPEID=10;

-- A multitable query
select Manufacturer, SSD_NAME_ID from manufacturer join aircraft_type ON manufacturer.Manufacturer_ID = aircraft_type.Manufacturer_Manufacturer_ID;

-- A query of my own choice "GROUP BY"
select count(Manufacturer) from manufacturer group by Manufacturer_ID order by count(AC_TYPEID) desc;

