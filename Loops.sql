if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) as 
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		declare @EmployeeNumber int = @EmployeeNumberFrom
		while @EmployeeNumber <= @EmployeeNumberTo
		begin
			if not exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
			begin
				set @EmployeeNumber =+1
				continue
			end
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			set @EmployeeNumber = @EmployeeNumber + 1
		end
	end
end
go
NameEmployees 4,5
execute NameEmployees 223, 227
exec NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327
