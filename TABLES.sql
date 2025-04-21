create database project_main;

use project_main;

CREATE TABLE HealthCareSpecialist(
health_care_id INT NOT NULL AUTO_INCREMENT,
health_care_name VARCHAR (200) NOT NULL,
health_care_middle_name VARCHAR (200) NOT NULL,
health_care_last_name VARCHAR (200) NOT NULL,
health_care_phone_number VARCHAR (20) NOT NULL,
health_care_gender VARCHAR(30),
health_care_specialization VARCHAR(255),
is_physical_therapist BOOLEAN NOT NULL,
is_doctor BOOLEAN NOT NULL,
is_mental__health BOOLEAN NOT NULL,
PRIMARY KEY (health_care_id)
);
ALTER table HealthCareSpecialist AUTO_INCREMENT = 1000;



CREATE TABLE Patient (
patient_file_number int NOT NULL AUTO_INCREMENT,
patient_first_name VARCHAR (200) NOT NULL,
patient_middle_name VARCHAR (200) NOT NULL,
patient_last_name VARCHAR (200) NOT NULL,
patient_start_date DATE,
patient_phone_number VARCHAR (20) NOT NULL,
patient_gender VARCHAR(30) NOT NULL,
patient_address varchar(255),
patient_educational_level VARCHAR(255),
patient_nationality VARCHAR(255),
patient_dob DATE NOT NULL,

patient_age INT NOT NULL,
patient_living_Enviroment TEXT,
patient_activity_level VARCHAR(255),
patient_dominant_hand VARCHAR(255) NOT NULL,
patient_employment VARCHAR(255),
patient_marital_status VARCHAR(255), 
PRIMARY KEY (patient_file_number)
);
alter table Patient AUTO_INCREMENT = 2000;



CREATE TABLE Availability (
health_care_specialist_id INT NOT NULL ,
availability_day VARCHAR(255),
availability_start_time TIME,
availability_end_time TIME,
PRIMARY KEY(health_care_specialist_id),
FOREIGN KEY (health_care_specialist_id) REFERENCES HealthCareSpecialist(health_care_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Appointment (
appointment_id int AUTO_INCREMENT,
doctor_id INT NOT NULL,
patient_file_number VARCHAR(255) NOT NULL,
appointment_date DATETIME NOT NULL,
patient_diagnosis TEXT,
PRIMARY KEY(appointment_id),
FOREIGN KEY (doctor_id) REFERENCES HealthCareSpecialist (health_care_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER table Appointment AUTO_INCREMENT = 6000;




CREATE TABLE Patient_Session (
session_id int not null AUTO_INCREMENT,
session_number INT NOT NULL,
session_date DATE NOT NULL,
session_duration VARCHAR(50),
therapist_id INT NOT NULL ,
patient_file_number VARCHAR(255) NOT NULL,
PRIMARY KEY(session_id),
FOREIGN KEY (therapist_id) REFERENCES HealthCareSpecialist(health_care_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER table Patient_Session AUTO_INCREMENT = 7000;

CREATE TABLE Notes(
session_note_id INT NOT NULL AUTO_INCREMENT ,
session_id int not null,
session_number INT NOT NULL,
sessio_notes LONGTEXT,
PRIMARY KEY(session_note_id),
FOREIGN KEY (session_id) REFERENCES Patient_Session(session_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER table Notes AUTO_INCREMENT = 10000;

SELECT * from Notes;


CREATE TABLE chronic_illness(

patient_file_number int  NOT NULL,
illness VARCHAR(255),
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);
SELECT * from chronic_illness;

CREATE TABLE clinical_test(
patient_file_number int NOT NULL,
test_name TEXT,
test_date DATE,
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);
SELECT * from clinical_test;

CREATE TABLE family_history(
patient_file_number int NOT NULL,
family_history_description TEXT,
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);
SELECT * from family_history;


CREATE TABLE health_habits(
patient_file_number int NOT NULL,
health_habits TEXT,
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE hobbies(
patient_file_number int NOT NULL,
hobby VARCHAR(255),
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);
select * from hobbies;
CREATE TABLE medication(
patient_file_number int NOT NULL,
medication VARCHAR(255),
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE diagnosis(
patient_file_number int NOT NULL,
diagnosis TEXT NOT NULL,
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);
select * from diagnosis;

CREATE TABLE previous_injuries(
patient_file_number int NOT NULL,
injury VARCHAR(255),
injury_date DATE ,
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE family(
patient_file_number int NOT NULL,
family_member_name VARCHAR(255),
relation VARCHAR(255),
phone_number VARCHAR(20),
PRIMARY KEY(patient_file_number),
FOREIGN KEY (patient_file_number) REFERENCES Patient (patient_file_number)
ON DELETE RESTRICT ON UPDATE CASCADE
);

SELECT * from family;
