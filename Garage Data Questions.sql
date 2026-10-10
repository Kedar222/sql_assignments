---GARAGE_DATA_TABLE--

--CUSTOMERS TABLE--
create table Customer_Table (
cid number primary key,
cname varchar2(20),
cadd varchar2(40),
c_contact number,
c_creditdays number,
cj_date date,
sex varchar2(10) );
drop table customer_table
drop table vendors_table

create table Vendors_Table (
vid number primary key,
vname varchar(30),
vadd varchar2(20),
vcontact number,
vcreditdays number,
vj_date date );

drop table  Employee_Table

create table Employee_Table (
eid number primary key,
ename varchar2(30),
ejob varchar2(20),
eadd varchar2(30),
econtact number,
esal number,
edoj date,
edol date);

drop table Sparepart_Table

create table Sparepart_Table (
spid number primary key,
spname varchar2(30),
sprate number,
spunit varchar2(20) );

drop table Purchase_Table 

create table Purchase_Table  (
pid number primary key,
vid number, foreign key(vid) references Vendors_Table(vid),
spid number, foreign key(spid) references Sparepart_Table(spid),
pqty number,
sprate number,
spgst varchar2(30),
spdate date,
transcost number,
total varchar2(20),
eid number, foreign key(eid) references Employee_Table );

SER_DET 

create table SER_DET  (
srid number primary key,
cid number, foreign key (cid) references Customer_Table(cid),
eid number, foreign key(eid) references Employee_Table(eid),
spid number, foreign key(spid) references Sparepart_Table(spid),
typ_veh varchar2(30),
veh_no varchar2(30),
typ_ser varchar2(20),
ser_date date,
qty number,
sp_rate number,
sp_amt number,
sp_garage number,
ser_amt number,
comm number,
total number );
drop table ser_det
insert into Customer_Table values (1001,'cyona blake','new york',1235684,20,to_date('20-jan-2011','dd-mon-yyyy'),'female');
insert into Customer_Table values (1002,'john smith','new jersi',1341684,20,to_date('21-feb-2011','dd-mon-yyyy'),'male');
insert into Customer_Table values (1003,'jodan wood','prag',1805184,20,to_date('22-mar-2011','dd-mon-yyyy'),'male');
insert into Customer_Table values (1004,'christna','manhatton',1125684,31,to_date('20-apr-2013','dd-mon-yyyy'),'female');
insert into Customer_Table values (1005,'tom hill','london',1239284,10,to_date('25-jun-2015','dd-mon-yyyy'),'male');
insert into Customer_Table values (1006,'kamila joseph','parise',124568,9,to_date('28-jul-2011','dd-mon-yyyy'),'female');
insert into Customer_Table values (1007,'andru symon','taxes',125654,15,to_date('01-apr-2016','dd-mon-yyyy'),'male');
insert into Customer_Table values (1008,'sanju samson','new york',12346341,4,to_date('20-jan-2016','dd-mon-yyyy'),'male');

insert into Vendors_Table values (2001,'kiran patil','pune',20535535,20,to_date('20-jan-2010','dd-mon-yyyy'));
insert into Vendors_Table values (2002,'prakash jain','mumbai',2063564,10,to_date('05-nov-2011','dd-mon-yyyy'));
insert into Vendors_Table values (2003,'swapnil thete','nashik',25355352,15,to_date('18-mar-2010','dd-mon-yyyy'));
insert into Vendors_Table values (2004,'amol shende','satara',23674776,18,to_date('07-apr-2015','dd-mon-yyyy'));
insert into Vendors_Table values (2005,'karan sintre','buldhana',256756,30,to_date('22-apr-2009','dd-mon-yyyy'));
insert into Vendors_Table values (2006,'ram kulkarni','osmanabad',20367454,21,to_date('09-jul-2010','dd-mon-yyyy'));

insert into Employee_Table values (3001,'steven king','painter','new york',10367454,1200,to_date('09-jul-2010','dd-mon-yyyy'),null);
insert into Employee_Table values (3002,'david austin','fitter','man haton',10367434,1100,to_date('19-aug-2010','dd-mon-yyyy'),null);
insert into Employee_Table values (3003,'bruce ernst','mechanic','new jercey',10367264,2200,to_date('08-sep-2010','dd-mon-yyyy'),null);
insert into Employee_Table values (3004,'luis popp','mechanic','new jercey',10367264,1100,to_date('19-oct-2009','dd-mon-yyyy'),to_date('06-sep-2010','dd-mon-yyyy'));
insert into Employee_Table values (3005,'sheri gomes','fitter','paris',10327264,1100,to_date('19-oct-2009','dd-mon-yyyy'),to_date('01-aug-2010','dd-mon-yyyy'));
insert into Employee_Table values (3000,'james phillip','fitter','paris',10322264,0,to_date('08-jan-2008','dd-mon-yyyy'),null);

insert into Sparepart_Table values (4001,'two wheeler tube',250,'nos');
insert into Sparepart_Table values (4002,'two wheeler engine oil',400,'ltrs');
insert into Sparepart_Table values (4003,'four wheeler engine oil',5000,'ltrs');
insert into Sparepart_Table values (4004,'two wheeler carborator',680,'nos');
insert into Sparepart_Table values (4005,'two wheeler clutch wire',129,'mtrs');
insert into Sparepart_Table values (4006,'two wheeler tail light',100,'nos');
insert into Sparepart_Table values (4007,'two wheeler indicators',100,'nos');
insert into Sparepart_Table values (4008,'two wheeler gaskit',13400,'nos');
insert into Sparepart_Table values (4009,'white color',340,'ltrs');
insert into Sparepart_Table values (4010,'black color',240,'ltrs');
insert into Sparepart_Table values (4011,'two wheeler side mirror',250,'nos');
insert into Sparepart_Table values (4012,'four wheeler side mirror',450,'nos');
insert into Sparepart_Table values (4013,'two wheeler shockup',1320,'pair');
insert into Sparepart_Table values (4014,'four wheeler bumper',6000,'nos');
insert into Sparepart_Table values (4015,'four wheeler front glass',7000,'pcs');

insert into Purchase_Table  values (5001,2001,4001,10,250,350,to_date('01-jan-2011','dd-mon-yyyy'),1300,4150,3001);
insert into Purchase_Table  values (5002,2002,4002,4,4000,288,to_date('02-mar-2011','dd-mon-yyyy'),100,1988,3001);
insert into Purchase_Table  values (5003,2003,4004,8,680,761.6,to_date('12-jun-2011','dd-mon-yyyy'),50,6251.6,3003);
insert into Purchase_Table  values (5004,2004,4005,10,129,154.8,to_date('22-aug-2011','dd-mon-yyyy'),125,1569.8,3004);
insert into Purchase_Table  values (5005,2005,4006,20,100,300,to_date('07-sep-2011','dd-mon-yyyy'),20,2320,3003);
insert into Purchase_Table  values (5006,2006,4007,30,150,630,to_date('12-oct-2011','dd-mon-yyyy'),60,5190,3000);
insert into Purchase_Table  values (5007,2001,4003,20,5000,14000,to_date('07-sep-2011','dd-mon-yyyy'),1000,115000,3000);
insert into Purchase_Table  values (5008,2006,4005,1,129,15.48,to_date('12-oct-2011','dd-mon-yyyy'),50,194.48,3005);
insert into Purchase_Table  values (5009,2006,4005,1,129,15.48,to_date('12-oct-2011','dd-mon-yyyy'),50,194.98,3005);
insert into Purchase_Table  values (5010,2006,4009,5,340,238,to_date('20-oct-2011','dd-mon-yyyy'),0,2938,3005);

insert into SER_DET  values (6001,1001,3001,4001,'two wheeler','mh15ca3228','tube damaged',to_date('02-jan-2011','dd-mon-yyyy'),1,250,250,35,50,0,335);
insert into SER_DET  values (6002,1002,3002,4002,'two wheeler','mh-16u5713','full servicing',to_date('04-mar-2011','dd-mon-yyyy'),1,400,400,52,300,50,752);
insert into SER_DET  values (6003,1003,3004,4005,'two wheeler','mh12pq1313','clutch wire',to_date('22-aug-2011','dd-mon-yyyy'),1,129,129,0,10,0,139);
insert into SER_DET  values (6004,1002,3002,4002,'two wheeler','mh15ca3227','full servicing',to_date('05-may-2011','dd-mon-yyyy'),1,400,400,52,300,50,752);
insert into SER_DET  values (6005,1004,3001,4009,'two wheeler','mh14pa335','color',to_date('21-oct-2011','dd-mon-yyyy'),2.5,340,850,119,500,150,1469);
insert into SER_DET  values (6006,1006,3001,4009,'two wheeler','mh12we334','color',to_date('01-dec-2011','dd-mon-yyyy'),2.5,340,850,119,500,150,1469);
insert into SER_DET  values (6007,1007,3001,4001,'four wheeler','mh17bb1345','tube damaged',to_date('01-jan-2012','dd-mon-yyyy'),1,250,250,35,150,0,435);

-----------------------------------------------------

Q.1 List all the customers serviced.

select * from customer_table
where cid in (select cid from SER_DET );


Q.2 Customers who are not serviced.

select * from customer_table
where cid not in (select cid from SER_DET );
-----------------------------------------------------


Q.3 Employees who have not received the commission.

select distinct e.eid, e.ename from Employee_Table e
where e.eid not in (
select eid from SER_DET 
where comm > 0
);

Q.4 Name the employee who have maximum Commission.

-----------------------------------------------------

select *
from(select e.ename, s.eid ,comm, dense_rank()over ( order by comm desc) drn
from ser_det s 
join employee_table e 
on s.eid=e.eid)
where drn = 1;

-----------------------------------------------------

Q.5 Show employee name and minimum commission amount received by an employee.

select e.ename, min(d.comm) as min_commission
from Employee_Table e
join SER_DET  d
on e.eid = d.eid
group by e.ename;

-----------------------------------------------------


Q.6 Display the Middle record from any table.

select * from Customer_Table
where cid =( select median(cid) from Customer_Table
);


Q.7 Display last 4 records of any table.

select * from(
select * from Customer_Table
order by cid desc
)
where rownum <= 4;


-----------------------------------------------------


Q.8 Count the number of records without count function from any table.

select sum(1) as total_records from employee_Table;

-----------------------------------------------------

Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).

delete from SER_DET 
where srid not in (select min(srid) from SER_DET 
group by cid
);
rollback;

-------------------------------------------------------------

Q.10 Show the name of Customer who have paid maximum amount 

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
where d.total = ( select max(total) from SER_DET 
);

-----------------------------------------------------


Q.11 Display Employees who are not currently working.

select eid, ename from Employee_Table
where edol is not null;

-----------------------------------------------------


Q.12 How many customers serviced their two wheelers.

select count(distinct cid) as total_customers from SER_DET 
where typ_veh = 'TWO WHEELER';

-----------------------------------------------------


Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.

select distinct spname, spunit from sparepart_table c
join ser_det s
on c.spid = s.spid

-----------------------------------------------------


Q.14 Customers who have Colored their vehicles.

select c.* from customer_table c
join ser_det s
on c.cid = s.cid
where s.typ_ser = 'color';

select cid from customer_table
where cid in (select cid from ser_det
              where typ_ser= 'color');
-----------------------------------------------------


Q.15 Find the annual income of each employee inclusive of Commission

select e.ename,(e.esal * 12) + nvl(sum(d.comm),0) as annual_income from Employee_Table e
left join SER_DET  d
on e.eid = d.eid
group by e.ename, e.esal;

-----------------------------------------------------

Q.16 Vendor Names who provides the engine oil.

select distinct v.vname from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
join Sparepart_Table s
on p.spid = s.spid
where s.spname like '%engine oil%';


-----------------------------------------------------


Q.17 Total Cost to purchase the Color and name the color purchased.

select s.spname, sum(p.total) as total_cost from Purchase_Table  p
join Sparepart_Table s
on p.spid = s.spid
where s.spname like '%color%'
group by s.spname;

-----------------------------------------------------


Q.18 Purchased Items which are not used in "Ser_det".

select s.spname from Sparepart_Table s
where s.spid not in(select spid from SER_DET 
);


-----------------------------------------------------

Q.19 Spare Parts Not Purchased but existing in Sparepart

select spid, spname from Sparepart_Table
where spid not in(select spid from Purchase_Table 
);

-----------------------------------------------------


Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.

select sum(s.total)-sum(e.esal) 
from Employee_Table e join ser_det s on e.eid=s.eid

-----------------------------------------------------


Q.21 Specify the names of customers who have serviced their vehicles more than one time.

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
group by c.cname
having count(*) > 1;


-----------------------------------------------------


Q.22 List the Items purchased from vendors locationwise.

select v.vadd, s.spname from Purchase_Table  p
join Vendors_Table v
on p.vid = v.vid
join Sparepart_Table s
on p.spid = s.spid;

-----------------------------------------------------


Q.23 Display count of two wheeler and four wheeler from ser_details

select typ_veh, count(*) as total from SER_DET 
group by typ_veh;

-----------------------------------------------------


Q24 Display name of customers who paid highest SPGST and for which item 

select c.cname, p.spgst from customer_table c
join ser_det s
on c.cid = s.cid
join sparepart_table sp
on sp.spid = s.spid
join purchase_table p
on s.spid = sp.spid
where p.spgst=( select max (spgst) from ser_det s)




-----------------------------------------------------


Q25 Display vendors name who have charged highest SPGST rate  for which item

select v.vname, s.spname from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
join Sparepart_Table s
on p.spid = s.spid
where p.spgst =( select max(spgst) from Purchase_Table 
);

-----------------------------------------------------


Q26   list name of item and employee name who have received item 

select s.spname, e.ename from Purchase_Table  p
join Sparepart_Table s
on p.spid = s.spid
join Employee_Table e
on p.eid = e.eid;

-----------------------------------------------------


Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
where d.veh_no = 'MH14PA335';

-----------------------------------------------------


Q28 who belong this vehicle  MH-14PA335" Display the customer name 

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
where d.veh_no = 'MH14PA335';

-----------------------------------------------------



Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date 

select c.cname, d.ser_date from Customer_Table c
join SER_DET  d
on c.cid = d.cid
where c.cadd = 'NEW YORK';

-----------------------------------------------------

   
Q 30 from whom we have purchased items having maximum cost?

select v.vname from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
where p.total =( select max(total) from Purchase_Table 
);

-----------------------------------------------------


Q31 Display the names of employees who are not working as Mechanic and that employee done services   .

select distinct e.ename from Employee_Table e
join SER_DET  d
on e.eid = d.eid
where e.ejob <> 'MECHANIC';

-----------------------------------------------------



Q32 Display the various jobs along with total number of employees in each job. The output should
contain only those jobs with more than two employees.

select ejob, count(*) as total_employees from Employee_Table
group by ejob
having count(*) > 2;

-----------------------------------------------------


Q33 Display the details of employees who done service  and give them rank according to their no. of services.

select e.eid, e.ename, count(d.srid) as total_services,
rank() over (order by count(d.srid) desc) as service_rank from Employee_Table e
join SER_DET  d
on e.eid = d.eid
group by e.eid, e.ename;

-----------------------------------------------------



Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter 

select e.ename, e.ejob, count(d.srid) as total_services from Employee_Table e
join SER_DET  d
on e.eid = d.eid
where e.ejob in ('PAINTER','FITTER')
group by e.ename, e.ejob;

-----------------------------------------------------
 

Q35 Display employee salary and as per highest  salary provide Grade to employee 

select ename, esal,
case
when esal = (select max(esal) from Employee_Table) then 'A'
when esal >= 2000 then 'B'
when esal >= 1000 then 'C'
else 'D'
end as grade from Employee_Table;

-----------------------------------------------------


Q36  display the 4th record of emp table without using group by and rowid

select * from ( select e.*, row_number() over (order by eid) rn
from Employee_Table e
)
where rn = 4;


-----------------------------------------------------


Q37 Provide a commission 100 to employees who are not earning any commission.

update SER_DET 
set comm = 100
where comm = 0;

-----------------------------------------------------


Q38 write a query that totals no. of services  for each day and place the results
in descending order

select ser_date, count(*) as total_services from SER_DET 
group by ser_date
order by total_services desc;

-----------------------------------------------------


Q39 Display the service details of those customer who belong from same city 

select d.* from SER_DET  d
join Customer_Table c
on d.cid = c.cid
where c.cadd in (select cadd from Customer_Table
group by cadd
having count(*) > 1
);

-----------------------------------------------------


Q40 write a query join customers table to itself to find all pairs of
customers service by a single employee

select c1.cname as customer1, c2.cname as customer2 from SER_DET  d1
join SER_DET  d2
on d1.eid = d2.eid
and d1.cid < d2.cid
join Customer_Table c1
on d1.cid = c1.cid
join Customer_Table c2
on d2.cid = c2.cid;

-----------------------------------------------------


Q41 List each service number follow by name of the customer who
made  that service

select d.srid, c.cname from SER_DET  d
join Customer_Table c
on d.cid = c.cid;


Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee  .Note (rating should be like A,B,C,D)

select e.ename, count(d.srid) as total_services,
case
when count(d.srid) >= 3 then 'A'
when count(d.srid) = 2 then 'B'
when count(d.srid) = 1 then 'C'
else 'D'
end as rating
from Employee_Table e
left join SER_DET  d
on e.eid = d.eid
group by e.ename;


-----------------------------------------------------


Q43 Write a query to get maximum service amount of each customer with their customer details ?

select c.cid, c.cname, max(d.total) as max_service_amount from Customer_Table c
join SER_DET  d
on c.cid = d.cid
group by c.cid, c.cname;

-----------------------------------------------------

Q44 Get the details of customers with his total no of services ?

select c.cname, count(d.srid) as total_services from Customer_Table c
left join SER_DET  d
on c.cid = d.cid
group by c.cname;

-----------------------------------------------------


Q45 From which location sparpart purchased  with highest cost ?

select v.vadd
from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
where p.total =
(
  select max(total)
  from Purchase_Table 
);

-----------------------------------------------------


Q46 Get the details of employee with their service details who has salary is null

select e.*, d.* from Employee_Table e
join SER_DET  d
on e.eid = d.eid
where e.esal is null;

---------------------------------------------------------------------


Q47 find the sum of purchase location wise 

select v.vadd, sum(p.total) as total_purchase from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
group by v.vadd;

-----------------------------------------------------


Q48 write a query sum of purchase amount in word location wise ?

select v.vadd, sum(p.total) as total_amount from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
group by v.vadd;

-----------------------------------------------------


Q49 Has the customer who has spent the largest amount money has
been give highest rating

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
group by c.cname
having sum(d.total) = ( select max(sum(total)) from SER_DET 
group by cid
);

-----------------------------------------------------


Q50 select the total amount in service for each customer for which
the total is greater than the amount of the largest service amount in the table

select cid, sum(total) as total_service from SER_DET 
group by cid
having sum(total) > ( select max(total) from SER_DET 
);

-----------------------------------------------------


Q51  List the customer name and sparepart name used for their vehicle and  vehicle type

select c.cname, s.spname, d.typ_veh from SER_DET  d
join Customer_Table c
on d.cid = c.cid
join Sparepart_Table s
on d.spid = s.spid;

-----------------------------------------------------


Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table

select s.spname, e.ename, c.cname, d.qty, d.sp_rate, d.ser_amt from SER_DET  d
join Sparepart_Table s
on d.spid = s.spid
join Employee_Table e
on d.eid = e.eid
join Customer_Table c
on d.cid = c.cid;

-----------------------------------------------------

 
Q53 specify the vehicles owners who�s tube damaged.

select c.cname from Customer_Table c
join SER_DET  d
on c.cid = d.cid
where d.typ_ser = 'TUBE DAMAGED';

-----------------------------------------------------


Q.54 Specify the details who have taken full service.

select * from SER_DET 
where typ_ser = 'FULL SERVICING';

-----------------------------------------------------


Q.55 Select the employees who have not worked yet and left the job.

select * from Employee_Table
where edol is not null
and eid not in ( select distinct eid from SER_DET 
);

-----------------------------------------------------


Q.56  Select employee who have worked first ever.

select * from Employee_Table
where edoj = ( select min(edoj) from Employee_Table
);

-----------------------------------------------------


Q.57 Display all records falling in odd date

select * from SER_DET 
where mod(to_number(to_char(ser_date,'dd')),2) = 1;

-----------------------------------------------------


Q.58 Display all records falling in even date

select * from SER_DET 
where mod(to_number(to_char(ser_date,'dd')),2) = 0;

-----------------------------------------------------


Q.59 Display the vendors whose material is not yet used.

select distinct v.vname from Vendors_Table v
join Purchase_Table  p
on v.vid = p.vid
where p.spid not in ( select spid from SER_DET 
);

-----------------------------------------------------



Q.60 Difference between purchase date and used date of spare part.

select d.srid, p.spdate, d.ser_date,
(d.ser_date - p.spdate) as days_difference from SER_DET  d
join Purchase_Table  p
on d.spid = p.spid;

-----------------------------------------------------



