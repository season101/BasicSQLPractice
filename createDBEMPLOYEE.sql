CREATE DATABASE IF NOT EXISTS COMAPNY;
USE COMPANY;

CREATE TABLE DEPARTMENT (
  Dname varchar(15) NOT NULL,
  Dnumber int(11) NOT NULL,
  Mgr_ssn char(9) NOT NULL,
  Mgr_start_date date DEFAULT NULL,
  PRIMARY KEY (Dnumber),
  KEY fk_manager (Mgr_ssn),
  CONSTRAINT fk_manager FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE (Ssn)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |

CREATE TABLE DEPENDENT (
  Essn char(9) NOT NULL,
  Dependent_name varchar(15) NOT NULL,
  Sex char(1) DEFAULT NULL,
  Bdate date DEFAULT NULL,
  Relationship varchar(8) DEFAULT NULL,
  PRIMARY KEY (Essn,Dependent_name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |

 CREATE TABLE DEPT_LOCATIONS (
  Dnumber int(11) NOT NULL,
  Dlocation varchar(15) NOT NULL,
  PRIMARY KEY (Dnumber,Dlocation),
  CONSTRAINT fk_loc_department FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |

 CREATE TABLE `EMPLOYEE` (
  Fname varchar(15) NOT NULL,
  Minit char(1) DEFAULT NULL,
  Lname varchar(15) NOT NULL,
  Ssn char(9) NOT NULL,
  Bdate date DEFAULT NULL,
  'Address' varchar(30) DEFAULT NULL,
  Sex char(1) DEFAULT NULL,
  Salary decimal(10,2) DEFAULT NULL,
  `Super_ssn' char(9) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_supervisor` (`Super_ssn`),
  KEY `fk_department` (`Dno`),
  CONSTRAINT `fk_department` FOREIGN KEY (`Dno`) REFERENCES `DEPARTMENT` (`Dnumber`),
  CONSTRAINT `fk_supervisor` FOREIGN KEY (`Super_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |

CREATE TABLE `PROJECT` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `fk_control_department` (`Dnum`),
  CONSTRAINT `fk_control_department` FOREIGN KEY (`Dnum`) REFERENCES `DEPARTMENT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |

CREATE TABLE `WORKS_ON` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |