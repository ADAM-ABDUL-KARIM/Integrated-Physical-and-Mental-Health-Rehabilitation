use project_main;
SELECT * from doctor;

insert into Doctor VALUES(1001,"Daniel","Alex","Doe","+96170123456","Male","Orthopedics");

insert into Doctor VALUES(1002,"Lisa","Sami","Abdul Karim","+96170654321","Female","Cardiology");
insert into Doctor VALUES(1003,"Zachariah","Ibrahim","Soboh","+96170123654","Male","General Surgery");
insert into Doctor VALUES(1004,"Saed","Majed","Harb","+961711321456","Male","Hospital Medicine");
insert into Doctor VALUES(1005,"Kamel","Khaled","Chouman","+96170654123","Male","Neurology");
insert into Doctor VALUES(1006,"Sarah","Raed","Hamdan","+96171541789","Female","Physiatrist");


SELECT * from therapist;

insert into therapist Values(2001,"Ribal","Hussein","Abdul Karim","+9617034179","Male","Spinal Cord Injuries",TRUE,FALSE);
insert into therapist Values(2002,"Adam","Haytham","Al Housseiny","+9617034175","Male","Psychologists",FALSE,TRUE);
insert into therapist Values(2003,"Nour","Ali","Al Zahraa Harajli","+9617034175","Female","Psychotherapist",FALSE,TRUE);
insert into therapist Values(2004,"Karim","Nemer","Kaiss","+9617034174","Male","Orthopaedics",TRUE,FALSE); 
insert into therapist Values(2005,"Steven","Dani","Maktabi","+9617032174","Male","Neurology",TRUE,FALSE); 
insert into therapist Values(2006,"Doha","Hasan","Barek","+9617132174","Male","Psychoanalyst",FALSE,TRUE); 
insert into therapist Values(2006,"Sally","Elie","Kassab","+96171328974","Female","",True,TRUE); 

select * from availability;


insert into availability VALUES (1001,"Monday Wednesday",'14:00:00',"17:00:00");
insert into availability VALUES (1002,"Tuesday Thursday","13:00:00","16:30:00");
insert into availability VALUES (1003,"Friday","14:30:00","16:30:00");
insert into availability VALUES (1004,"Wednesday Friday","12:45:00","14:30:00");
insert into availability VALUES (1005,"Tuesday Thursday","10:00:00","17:00:00");
insert into availability VALUES (1006,"Monday","9:00:00","14:00:00");

insert into availability VALUES (2001,"Monday Friday",'11:00:00',"17:00:00");
insert into availability VALUES (2005,"Full Time","8:00:00","17:00:00");
insert into availability VALUES (2002,"Monday Wednesday",'14:00:00',"17:00:00");
insert into availability VALUES (2006,"Full Time","8:00:00","17:00:00");
insert into availability VALUES (2003,"Tuesday Thursday",'9:00:00',"17:00:00");
insert into availability VALUES (2004,"Full Time","8:00:00","17:00:00");


select file_number from patient where activity_level = 'Light';


SELECT * from patient;
SELECT * FROM diagnosis;
SELECT * from appointment;
SELECT * FROM doctor;

START TRANSACTION;

	INSERT into Patient Values(4001,"Saja","Hasan","Barek" ,"+96171327698","Female","Tarfilsay","Undergraduate Education","Lebanese",'2005-05-31',"House with Family","Light","Right","Unemployed","Single");
    INSERT INTO diagnosis VALUES(4001,"Lymphedema");
    insert into appointment Values (1003,4001,'2022-05-10 14:30:00','Lymphedema');
     
    
	INSERT into Patient Values(4002,"Ahmad","Samir","Hamdan",'2023-05-21' ,"+96171127698","Male","Tyre","Undergraduate Education","Lebanese",'2004-03-11',"One bedroom Appartment","Sedentary","Right","Unemployed","Single");
    INSERT INTO diagnosis VALUES(4002,"Foot Fracture");
    insert into appointment Values (1001,4002,'2023-05-24 14:30:00','Foot Fracture');
     
    
	INSERT into Patient Values(4003,"Miguel","Ribal","Farraj",'2024-05-21' ,"+96171127691","Male","Derdghaya","Postgraduate Education","Lebanese",'2000-03-11',"Appartment with partner","Moderate","Left","Business Owner","Engaged");
	INSERT INTO diagnosis VALUES(4003,"Paraplegia");
    insert into appointment Values (1005,4003,'2024-05-23 14:30:00','Paraplegia');
     
    
    
	INSERT INTO Patient VALUES(4004, "Mohmmad", "Ali", "Al Hasan", '2024-02-22', "+96171127292", "Male", "Srifa", "High School Education", "Lebanese", '2006-12-12', "House with Family", "Active", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4004,"Anterior cruciate ligament ACL");
    insert into appointment Values (1003,4004,'2024-05-23 16:00:00','Anterior cruciate ligament ACL');
     
    
    
	INSERT INTO Patient VALUES(4005, "Ranim", "Mohammad", "Hariri", '2023-12-03', "+96171127683", "Female", "Saida", "Secondary Education", "Lebanese", '2010-05-13', "House with family", "Very Active", "Left", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4005,"Burns");
    insert into appointment Values (1004,4005,'2023-12-8 13:00:00','Burns');
     
    
    
	INSERT INTO Patient VALUES(4006, "Alice", "Daniel", "El Hajj", '2024-04-24', "+96171122694", "Female", "Tyre", "Postgraduate Education", "Lebanese", '1997-06-14', "House with partner", "Moderate", "Right", "Part time Waiter", "Divorced");
	INSERT INTO diagnosis VALUES(4006,"Head Injury");
	insert into appointment Values (1006,4006,'2024-05-01 13:00:00','Head Injury');
    
     
INSERT INTO Patient VALUES(4007, "Ahmad", "Ali", "Hassan", '2023-11-25', "+96171127695", "Male", "Zahle", "High School Education", "Lebanese", '2009-07-15', "House with family", "Sedentary", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4007,"Huntington’s Disease");
	insert into appointment Values (1005,4007,'2024-12-04 10:00:00','Huntington’s Disease');
    

INSERT INTO Patient VALUES(4008, "Fatima", "Mohammad", "Abbas", '2024-10-26', "+96171127696", "Female", "Tyre", "Undergraduate Education", "Lebanese", '1995-08-16', "House with family", "High", "Left", "High School Teacher", "Married");
	INSERT INTO diagnosis VALUES(4008,"Low back pain");
	insert into appointment Values (1006,4008,'2024-11-02 09:00:00','Low back pain');
    


INSERT INTO Patient VALUES(4009, "Yusuf", "Hussein", "Khalil", '2024-11-27', "+96171127697", "Male", "Tyre", "High School Education", "Lebanese", '1994-09-17', "House alone", "Low", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4009,"Monoplehia");
	insert into appointment Values (1005,4009,'2024-11-02 14:20:00','Monoplegia');
    
    
INSERT INTO Patient VALUES(4010, "Khaled", "Bashir", "Al Hadi", '2024-12-28', "+96171127698", "Male", "Beirut", "No formal education", "Lebanese", '1990-10-18', "House with family", "Moderate", "Right", "Personal Trainer", "Divorced");
	INSERT INTO diagnosis VALUES(4010,"Pec Tear");
	insert into appointment Values (1006,4010,'2025-01-3 10:30:00','Pec Tear');
    


INSERT INTO Patient VALUES(4011, "Samira", "Raed", "Hmadi", '2023-10-29', "+96171127699", "Male", "Abbasieh", "Postgraduate Education", "Lebanese", '1992-11-19', "Appartment with partner", "Moderate", "Right", "Software Engineer", "Engaged");
	INSERT INTO diagnosis VALUES(4011,"Osteoporosis");
	insert into appointment Values (1001,4011,'2023-11-10 15:00:00','Osteoporosis');
    


INSERT INTO Patient VALUES(4012, "Lana", "Kamel", "Abdul Karim", '2024-03-30', "+96171127700", "Female", "Nabatieh", "Undergraduate Education", "Lebanese", '1951-12-20', "House with family", "High", "Left", "Accountant", "Married");
	INSERT INTO diagnosis VALUES(4012,"Joint Replacement");
	insert into appointment Values (1001,4012,'2023-04-08 16:00:00','Joint Replacement');
    


INSERT INTO Patient VALUES(4013, "Karim", "Khalil", "Kassir", '2024-03-31', "+96171127701", "Male", "Maaroub", "High School Education", "Lebanese", '1990-01-21', "House alone", "Low", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4013,"Lung Cancer");
	insert into appointment Values (1002,4013,'2023-04-08 13:45:00','Lung Cancer');


INSERT INTO Patient VALUES(4014, "Soumaya", "Hussein", "Al Housseiny", '2024-04-01', "+96171127702", "Female", "Arzoun", "Postgraduate Education", "Lebanese", '1989-02-22', "House with family", "Very Active", "Left", "University Instructor", "Divorced");
	INSERT INTO diagnosis VALUES(4014,"Burns");
	insert into appointment Values (1004,4014,'2024-04-08 13:00:00','Burns');

INSERT INTO Patient VALUES(4015, "Adam", "Ali", "Al Amin", '2024-05-11', "+96170127702", "Male", "Srifa", "Undergraduate Education", "Syrian", '2002-02-02', "One bedroom Appartment", "Very Active", "Right", "Construction Worker", "Single");
	INSERT INTO diagnosis VALUES(4015,"Bone Fracture");
	insert into appointment Values (1001,4015,'2024-05-15 14:00:00','Bone Fracture');


INSERT INTO Patient VALUES(4016, "Asaad", "Mohmmad", "Abdul Khalek", '2023-12-01', "+96171127202", "Male", "Tyre", "Middle School", "Lebanese", '2013-12-28', "House with family", "Sedentary", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4016,"Head injury");
	insert into appointment Values (1004,4016,'2023-12-08 12:45:00','Head injury');

INSERT INTO Patient VALUES(4017, "Serena", "Issam", "Bader", '2024-02-13', "+96170127702", "Female", "Srifa", "High School Education", "Lebanese", '1989-07-30', "One bedroom Appartment", "Very Active", "Left", "Dance Coach", "Divorced");
	INSERT INTO diagnosis VALUES(4017,"Neurodevelopmental disorder");
	insert into appointment Values (1005,4017,'2023-02-20 13:45:00','Neurodevelopmental disorder');

INSERT INTO Patient VALUES(4018, "Ribal", "Bassel", "Yammin", '2024-01-23', "+96171117802", "Male", "Kafra", "Undergraduate Education", "Lebanese", '1999-03-22', "House with family", "Very Active", "Right", "Gymnastics Coach", "Married");
	INSERT INTO diagnosis VALUES(4018,"Quadriplegia");
	insert into appointment Values (1003,4018,'2024-01-30 14:30:00','Quadriplegia');


INSERT INTO Patient VALUES(4019, "Farah", "Hasan", "Abadi", '2022-01-24', "+96170179812", "Male", "Kafra", "Middle School", "Lebanese", '2011-06-22', "House with Family", "Active", "Right", "Unemployed", "Single");
	INSERT INTO diagnosis VALUES(4019,"Feeding and eating disorder");
	
INSERT INTO Patient VALUES(4020, "Firas", "Shawki", "Ftouni", '2022-10-13', "+96170115802", "Male", "Arzoun", "Postgraduate Education", "Lebanese", '1989-08-22', "One bedroom Appartment", "Active", "Right", "Nurse", "Single");
INSERT INTO diagnosis VALUES(4020,"Feeding Neurocognitive disorders");
insert into appointment Values (1005,4020,'2024-01-30 14:30:00','Feeding Neurocognitive disorders');

INSERT INTO Patient VALUES(4021, "Aya", "Khalil", "Miri", '2021-05-20', "+96170212852", "Female", "Nabatieh", "Collge Education", "Lebanese", '1985-01-22', "Two bedroom Appartment", "Active", "Right", "Humanitarian worker", "Married");
INSERT INTO diagnosis VALUES(4021,"Heart Damage");
insert into appointment Values (1002,4021,'2021-05-27 13:30:00','Heart Damage');
select * from health_habits;
INSERT into health_habits VALUES(4021,'Heavy Smoker');

INSERT INTO Patient VALUES(4022, "Ahmad", "Amer", "Awad", '2019-3-14', "+96171212882", "Male", "Tyre", "High School Education", "Palesenian", '2000-07-12', "House with Family", "Light", "Right", "Business Owner", "Married");
INSERT INTO diagnosis VALUES(4022,"Spinal Cord injuries and Major depressive disorder and PTSD");
insert into appointment Values (1005,4022,'2019-03-20 12:30:00','Spinal Cord injuries and Major depressive disorder');
 

INSERT INTO Patient VALUES(4023, "Abbas", "Ahmad", "Itani", '2020-11-24', "+96170174852", "Male", "Saida", "Middle School", "Lebanese", '2013-01-22', "Two bedroom Appartment", "Active", "Right", "Unemployed", "Single");
INSERT INTO diagnosis VALUES(4023,"Paraplegia and PTSD");
insert into appointment Values (1003,4023,'2019-11-30 15:00:00','Paraplegia and PTSD');
 
 
INSERT INTO Patient VALUES(4024, "Daniel", "Firas", "Ezzedine", '2022-5-24', "+96170179852", "Male", "Barish", "High School Education", "Lebanese", '2008-03-22', "House with Family", "Passive", "Right", "Unemployed", "Single");
INSERT INTO diagnosis VALUES(4024,"Brain Injury and Neurocognitive disorders");
insert into appointment Values (1005,4024,'2022-05-30 12:00:00','Brain Injury and Neurocognitive disorders');
 
 
INSERT INTO Patient VALUES(4025, "Khalil", "Ahmad", "Darwish", '2024-5-14', "+96170179832", "Male", "Srifa", "No Formal Education", "Syrian", '2000-11-22', "House with Family", "Very Active", "Right", "Construction Worker", "Married");
INSERT INTO diagnosis VALUES(4025,"Internal injuries and Bleeding, uicidal attempts");
insert into appointment Values (1006,4025,'2024-05-20 9:00:00','Internal injuries and Bleeding, suicide attempts');


INSERT INTO Patient VALUES(4026, "Dawoud", "Mohmmad", "El Habib", '2023-5-14', "+96170179235", "Male", "Abbasieh", "Middle School Education", "Syrian", '2015-10-12', "House with Family", "Very Active", "Right", "Construction Worker", "Married");
INSERT INTO diagnosis VALUES(4026,"Dissociative identity disorder");
-- insert into appointment Values (1006,4026,'2023-05-28 9:00:00','Dissociative identity disorder');

INSERT INTO Patient VALUES(4027, "Habib", "Mustafa", "Aziz", '2024-2-14', "+96171146832", "Male", "Arzoun", "No Formal Education", "Syrian", '2002-04-22', "House with Family", "Very Active", "Left", "Construction Worker", "Single");
INSERT INTO diagnosis VALUES(4027,"Spinal Tumor and depressive disorder");
insert into appointment Values (1005,4027,'2024-02-21 12:00:00','Spinal Tumor and depressive disorder');


select * from appointment;

insert into appointment VALUES (1001,4026,);
insert into appointment VALUES (1002);
insert into appointment VALUES (1003);
insert into appointment VALUES (1004);
insert into appointment VALUES (1005);
insert into appointment VALUES (1006);