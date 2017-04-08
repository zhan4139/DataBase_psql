SELECT E.EmpName FROM Employee E
   WHERE E.HomeZipCode = 55414 or E.HomeZipCode = 55455;



SELECT DISTINCT P.ProjName 
   FROM Project P, ProjectManager Pm
   WHERE p.ProjId = Pm.ProjId;



SELECT P.ProjName, COUNT(EmpId) AS empCount
   FROM Project P, EmpProject E
   WHERE P.ProjId = E.ProjId
   group by P.ProjName;




SELECT Temp.UnivName
   FROM (
      SELECT U.UnivName,  COUNT(DISTINCT P.MgrId) As Managers
         FROM University U, Graduate G, ProjectManager P
         WHERE U.UnivId = G.UnivId AND P.MgrId = G.EmpId
         GROUP BY U.UnivName
   ) AS Temp
   WHERE Temp.Managers = (
      SELECT MAX(Temp2.Managers)
         FROM (
            SELECT U.UnivName,  COUNT(DISTINCT P.MgrId) As Managers
               FROM University U, Graduate G, ProjectManager P
               WHERE U.UnivId = G.UnivId AND P.MgrId = G.EmpId
               GROUP BY U.UnivName
         ) AS Temp2
   );





SELECT  E.EmpName, D.DeptName, G.GradYear
   From Employee E, Department D, Graduate G
   where E.EmpId = G.EmpId and E.DeptId =D.DeptId;




SELECT Temp.projName, Temp.empCount
   FROM (
      SELECT P.ProjName, COUNT(DISTINCT E.EmpId) AS empCount
         FROM Project P, EmpProject E
         WHERE P.ProjId = E.ProjId
         group by P.ProjName
   ) AS Temp
   WHERE Temp.empCount = (
      SELECT MAX(Temp2.empCount)
         FROM (
            SELECT P.ProjName, COUNT(DISTINCT E.EmpId) AS empCount
               FROM Project P, EmpProject E
               WHERE P.ProjId = E.ProjId
               group by P.ProjName
         ) AS Temp2
   );

  


