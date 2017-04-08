Update Employee 
 	SET HomeZipCode ='55414'
 	WHERE EmpId = 2;

Update Graduate 
    SET GradYear =GradYear + 3
    WHERE GradYear <2002;

Update Graduate
    SET GradYear = GradYear - 2
    From Employee
    WHERE Employee.Empid = Graduate.Empid and HomeZipCode = 55414 ;

 DELETE FROM Project
    WHERE ProjId =2;

