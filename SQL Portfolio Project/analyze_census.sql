select * from Project1.dbo.Data1;

select * from Project1.dbo.Data2;

--number of rows into our dataset

select COUNT(*) from Project1..Data1;

select COUNT(*) from Project1..Data2;

--dataset for jharkhand and bihar

select * from Project1..Data1 where state in ('Jharkhand','Bihar');

---population of india

select SUM(population)  from  Project1..Data2; --when we can execute this line it will display the sum population it will not showing table name 

		--To display sum of population along with column name 
		select SUM(population) as Total_population from  project1..Data2;

--average growth(present in Data1) 
	--it will give avg growth

	select avg(growth) as avg_growth from Project1..Data1;

		--we can try to convert into percentage 

		select AVG(growth)*100 as avg_growth from Project1..Data1;

		--write  a query which group by state and average of growth rate.

		select state,AVG(growth)*100 as avg_growth from Project1..Data1 group by state;

		--avg sex ratio

		select state,round(avg(Sex_Ratio),0) avg_sex_ratio from Project1..data1 group by state order by avg_sex_ratio desc;

		--avg literacy rate which is greater then 90

		select state,round(avg(literacy),0) avg_literacy_ratio from Project1..data1 group by state 
		having round(avg(literacy),0)>90  order by avg_literacy_ratio desc ;

		--top 3 state showing highest growth ratio

		select top 3 state,avg(growth)*100 avg_growth from Project1..data1 group by state order by avg_growth desc  ;

		--bottom 3 state showing lowest sex ratio

		select top 3 state,round(avg(Sex_Ratio),0) avg_sex_ratio from Project1..data1 group by state order by avg_sex_ratio asc;

		--top and bottom 3 states in literacy state

		drop table if exists topstate;
		create table topstate 
		(state nvarchar(255),
		 topstate float

		 )


		 insert into topstate 
		 	select state,round(avg(literacy),0) avg_literacy from Project1..data1 group by state order by avg_literacy desc;

		select top 3 * from topstate order by topstate.topstate desc;


		--bottom table 

		drop table if exists bottomstate;
		create table bottomstate 
		(state nvarchar(255),
		 topstate float

		 )


		 insert into bottomstate 
		 	select state,round(avg(literacy),0) avg_literacy from Project1..data1 group by state order by avg_literacy desc;

		select top 3 * from bottomstate order by bottomstate.topstate asc;


		--union operator

		select * from (
		select top 3 * from topstate order by topstate.topstate desc)a

		union
		
		select * from (
		select top 3 * from bottomstate order by bottomstate.topstate asc)b;

		--states starting with letter a

		select distinct state from project1..data1 where lower(state) like 'a%';

		--states end with letter d

		select distinct state from project1..data1 where lower(state) like '%d';