--Manufacturing Downtime & Production Analytics


--Create Machine Table 
CREATE TABLE machines (
    machine_id VARCHAR(10) PRIMARY KEY,
    machine_name VARCHAR(50) NOT NULL,
    machine_type VARCHAR(30) NOT NULL,
    production_line VARCHAR(20) NOT NULL,
    installation_date DATE NOT NULL
);


--Create Products Table 
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL,
    sub_category VARCHAR(30) NOT NULL,
    standard_cost NUMERIC(12,2) NOT NULL CHECK (standard_cost > 0)
);


--Creation of Pr
CREATE TABLE production (
    production_id VARCHAR(10) PRIMARY KEY,
    machine_id VARCHAR(10) NOT NULL REFERENCES machines(machine_id),
    product_id VARCHAR(10) NOT NULL REFERENCES products(product_id),
    production_datetime TIMESTAMP NOT NULL,
    shift CHAR(1) NOT NULL CHECK (shift IN ('A','B','C')),
    planned_units INTEGER NOT NULL CHECK (planned_units > 0),
    produced_units INTEGER NOT NULL CHECK (produced_units >= 0),
    defective_units INTEGER NOT NULL CHECK (defective_units >= 0)
);


CREATE TABLE maintenance (
    maintenance_id VARCHAR(10) PRIMARY KEY,
    machine_id VARCHAR(10) NOT NULL REFERENCES machines(machine_id),
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(20) NOT NULL,
    maintenance_cost NUMERIC(12,2) NOT NULL CHECK (maintenance_cost >= 0)
);




--Check tables 

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';



--Check data in table

select * from machines;
select * from products;
select * from production;
select * from maintenance;



--Check the number of records in each table

select count(*) from machines;
select count(*) from products;
select count(*) from production;
select count(*) from maintenance;



select * from production
limit 10;


--check null value in data

select * from production
where machine_id Is null
   or product_id Is null
   or production_datetime Is null
   or shift Is null
   or planned_units Is null
   or produced_units Is null
   or defective_units Is null;



--Check for Duplicate Records

select  machine_id,
    product_id,
    production_datetime,
    shift,
    planned_units,
    produced_units,
    defective_units,
    count(*) AS duplicate_count
from production
group by 1,2,3,4,5,6,7
having count(*) > 1;


--total planned units and total produced units

select sum(planned_units),
sum(produced_units) 
from production;




--overall production achievement percentage

select sum(planned_units) as Plan_unit,
sum(produced_units) as prod_unit, 
(sum(produced_units)::numeric(10,2)/sum(planned_units))*100 as Production_archevement
from production;


--shift has the highest total number of produced units

select sum(produced_units) as prod_unit,shift 
from production
group by 2
order by prod_unit desc;



--product has the highest total number of produced units

select pdc.product_id,pdc.product_name,sum(pdt.produced_units) as prod_unit
from production pdt
join products pdc
on pdc.product_id=pdt.product_id
group by 1,2
order by prod_unit desc;


--product has the highest defect rate?

select product_id,sum(defective_units) as Plan_unit,
sum(produced_units) as prod_unit, 
SUM(defective_units)::decimal(8,2) / SUM(produced_units) * 100 as defect_rate
from production
group by 1
order by defect_rate desc ;


--product category generates the highest total production volume

select pdc.category,sum(pdt.produced_units) as prod_unit
from production pdt
join products pdc
on pdc.product_id=pdt.product_id
group by 1
order by prod_unit desc;



--product category has the highest defect rate

select pdc.category,
(sum(pdt.defective_units)::numeric(10,2)/sum(pdt.produced_units))*100 as Defect_Rate
from production pdt
join products pdc
on pdc.product_id=pdt.product_id
group by 1
order by Defect_Rate desc;



--machine has the highest production achievement percentage

select machine_id,
sum(produced_units) as prod_unit,
sum(planned_units) as plan_unit,
sum(produced_units)::numeric/sum(planned_units) * 100 as achievement_percentage
from production 
group by machine_id
order by achievement_percentage desc;


--machine produces the highest number of defective units

select machine_id,
sum(defective_units) as def_unit
from production 
group by machine_id
order by 2 desc;



--machine has the highest defect rate

select machine_id,
sum(defective_units) as def_unit,
sum(produced_units) as prod_unit,
sum(defective_units)::numeric/sum(produced_units) * 100 as Defect_Rate
from production 
group by machine_id
order by 4 desc;



--product has the highest average production achievement per production record

select product_id,
sum(produced_units) as prod_unit,
sum(planned_units) as plan_unit,
avg(produced_units::numeric / planned_units *100) as achievement_percentage
from production 
group by product_id
order by achievement_percentage desc;



--machine has the highest average production output per record

select machine_id,
avg(produced_units) as prod_unit
from production 
group by machine_id
order by 2 desc;



--product generates the highest total production volume 
--while maintaining a defect rate below 2%

select product_id,
sum(produced_units) as prod_unit,
sum(defective_units) as def_unit,
sum(defective_units)::numeric/sum(produced_units) * 100 as Defect_Rate
from production 
group by product_id
having sum(defective_units)::numeric / sum(produced_units) * 100 < 2 
order by 2 desc ;


--product category has the highest total production volume
--among categories with a defect rate below 2%


select pt.category,
SUM(pd.produced_units) AS prod_unit,
sum(pd.defective_units)::numeric / sum(pd.produced_units) * 100 as Defect_Rate
from production pd
join products pt
on pd.product_id=pt.product_id
group by category
having sum(pd.defective_units)::numeric / sum(pd.produced_units) * 100 < 2 
order by 2 desc ;













