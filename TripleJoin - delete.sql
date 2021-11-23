select * from tblEmployee

select T.EmployeeNumber as TEmployeeNumber, e.EmployeeNumber as EEmployeeNumber, sum(amount) as SumAmount from tblTransaction as T
left join tblEmployee as E
on t.EmployeeNumber = e.EmployeeNumber
group by t.EmployeeNumber, e.EmployeeNumber
order by EEmployeeNumber

begin tran
update tblEmployee
set DateofBirth = '2101-01-01'
where EmployeeNumber = 537
select * from tblEmployee order by DateofBirth desc
rollback tran

begin tran
update tblEmployee
set EmployeeGovernmentID = 'aaaa'
where EmployeeNumber between 530 and 539
select * from tblEmployee order by EmployeeGovernmentID asc
rollback tran

select * from tblEmployee where EmployeeNumber = 2001