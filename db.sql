
--Sequence Creation :

CREATE sequence TrainingCode_seq start with 10001 increment by 1;     --For training code
CREATE sequence CourseId_seq start with 101 increment by 1;         --For Course Id


--EMPLOYEEMASTER TABLE:

CREATE table EMPLOYEE_MASTER(
EmployeeId int(5) PRIMARY KEY,
EmployeeName varchar(20),
Password varchar(20),
Role varchar(20));
--COURSEMASTER TABLE:

CREATE table COURSE_MASTER(CourseId int(5) PRIMARY KEY,
courseName varchar(15),noOfDays int(5));

--TRAININGPROGRAM TABLE:

CREATE table TRAINING_PROGRAM(TrainingCode int(5) PRIMARY KEY ,coursecode int(5) REFERENCES COURSE_MASTER(courseId) ON DELETE CASCADE,
facultycode int(5) REFERENCES Employee_Master(EmployeeId) ON DELETE CASCADE,
startDate date,endDate date,CHECK (endDate>startDate));


--FACULTYSKILL TABLE:

CREATE table FACULTY_SKILL(FacultyId int(5) REFERENCES Employee_Master(EmployeeId) ON DELETE CASCADE,
skillset varchar(25));

--TRAINING-PARTICIPANTENROLLMENT TABLE:

CREATE table TRAININGPARTICIPANT_ENROLLMENT(
Trainingcode int(5) REFERENCES TRAINING_PROGRAM(TrainingCode) ON DELETE CASCADE,
ParticipantId int(5) REFERENCES Employee_Master(EmployeeId) ON DELETE CASCADE,CONSTRAINT pk_enrollment PRIMARY KEY(Trainingcode,ParticipantId));

--FEEDBACKMASTER TABLE:

CREATE table FEEDBACK_MASTER(TrainingCode int(5) REFERENCES TRAINING_PROGRAM(TrainingCode) ON DELETE CASCADE,
ParticipantId int(5) REFERENCES Employee_Master(EmployeeId) ON DELETE CASCADE,
FB_Prs_comm int(1),FB_Clrfy_dbts int(1),
FB_TM int(1),FB_Hnd_out int(1),
FB_Hw_Sw_Ntwrk int(1),
Comments varchar(20),
Suggestions varchar(20),
feedbackdate DATE,
CHECK (FB_Prs_comm BETWEEN 1 AND 5),
CHECK (FB_Clrfy_dbts BETWEEN 1 AND 5),
CHECK (FB_TM BETWEEN 1 AND 5),
CHECK (FB_Hnd_out BETWEEN 1 AND 5),
CHECK (FB_Hw_Sw_Ntwrk BETWEEN 1 AND 5),
CONSTRAINT pk_enrollment1 PRIMARY KEY(Trainingcode,ParticipantId));

--Employee master details:
INSERT into EMPLOYEE_MASTER values(1000,'Admin','admin@123','admin');

INSERT into EMPLOYEE_MASTER values(1001,'Trainer1','trainer1@123','coordinator');

INSERT into EMPLOYEE_MASTER values(1002,'Trainer2','trainer2@123','coordinator');

INSERT into EMPLOYEE_MASTER values(1004,'Trainee1','trainee1@123','participant');

INSERT into EMPLOYEE_MASTER values(1005,'Trainee2','trainee2@123','participant');

--FACULTY_SKILL details:
INSERT into FACULTY_SKILL values(1001,'Java,C++,MainFrames');
INSERT into FACULTY_SKILL values(1002,'Oracle,.Net,Java');

--Course master details:
INSERT into course_master values(501,'Java',45);

INSERT into course_master values(502,'Oracle',35);

INSERT into course_master values(503,'.Net',40);

INSERT into course_master values(504,'C++',30);

--TRAININGPROGRAM details:

INSERT into TRAINING_PROGRAM values(10000,501,1001,'2018-11-1','2018-12-17');

INSERT into TRAINING_PROGRAM values(10001,502,1002,’2018-11-10','2018-12-18');

INSERT into TRAINING_PROGRAM values(10002,503,1002,'2018-11-15','2018-12-27');

INSERT into TRAINING_PROGRAM values(10004,504,1001,'2018-11-01','2018-12-30');

--TRAINING-PARTICIPANTENROLLMENT details:
INSERT into TRAININGPARTICIPANT_ENROLLMENT values(10000,1004);

INSERT into TRAININGPARTICIPANT_ENROLLMENT values(10000,1005);

INSERT into TRAININGPARTICIPANT_ENROLLMENT values(10001,1004);

INSERT into TRAININGPARTICIPANT_ENROLLMENT values(10001,1005);

