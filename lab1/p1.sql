CREATE TABLE University (
  UnivId NUMERIC,
  UnivName VARCHAR(40),
  PRIMARY KEY (UnivId)
);

CREATE TABLE Department (
  DeptId NUMERIC,
  DeptName VARCHAR(40),
  PRIMARY KEY (DeptId)
);

CREATE TABLE Employee (
  EmpId NUMERIC,
  EmpName VARCHAR(40),
  DeptId NUMERIC,
  HomeZipCode NUMERIC,
  PRIMARY KEY (EmpId),
  FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

CREATE TABLE Project (
  ProjId NUMERIC,
  ProjName VARCHAR(40),
  PRIMARY KEY (ProjId)
);

CREATE TABLE Graduate (
  EmpId NUMERIC,
  UnivId NUMERIC, 
  GradYear NUMERIC,
  PRIMARY KEY (EmpId),
  FOREIGN KEY (EmpId) REFERENCES Employee(EmpId),
  FOREIGN KEY (UnivId) REFERENCES University(UnivId)
);

CREATE TABLE EmpProject (
  EmpId NUMERIC,
  ProjId NUMERIC,
  PRIMARY KEY (EmpId, ProjId),
  FOREIGN KEY (EmpId) REFERENCES Employee(EmpId),
  FOREIGN KEY (ProjId) REFERENCES Project(ProjId) ON DELETE CASCADE 
);

CREATE TABLE ProjectManager (
  ProjId NUMERIC, 
  MgrId NUMERIC,
  PRIMARY KEY (ProjId,MgrId),
  FOREIGN KEY (ProjId) REFERENCES Project(ProjId) ON DELETE CASCADE,
  FOREIGN KEY (MgrId) REFERENCES Employee(EmpId)
);