SELECT * FROM students4


---- 1.  AUTO COMMIT ----
insert into students4 values(21,'PRANAV','BCA',2023)

---- 1. AUTO ROLLBACK ----
insert into students4 values(1,'VIGNESH','BCA')

---- 2.IMPLICIT TRANSACTIONS ----

set implicit_transactions on


update students4 set sname='PRANAV' where sid=21
commit tran

select @@TRANCOUNT as opentransactions

set implicit_transactions off

----3. EXPLICIT TRANSACTIONS ----

---a . Only Commit - insert statement ---


begin tran
insert into students4 values(22,'SAI','BBA','2023')

select @@TRANCOUNT
commit tran

SELECT * FROM students4


---b. Only Rollback - update statement ---

begin tran
update students4 set sname='SARAN' where sid=22
SELECT * FROM students4
rollback tran

select @@TRANCOUNT
SELECT * FROM students4

---c. Savepoint - commit update and insert statements, rollback delete statement ---

begin transaction
insert into students4 values (23,'VARUN','BCOM',2022) -- insertion of data
update students4 set sname='SAI SARAN' where sid=22 -- updation of data 
select * from students4 --viewing the changes made
select @@TRANCOUNT -- viewing no of open transactions

save transaction insupdate -- creating a save point until the insertion and updation

delete students4 where sid=1 -- deletion of data
select * from students4 --
select @@TRANCOUNT --viewing no of open transactions
rollback transaction insupdate -- rolling back to the savepoint 
commit -- saving the changes made until the savepoint

select * from students4



