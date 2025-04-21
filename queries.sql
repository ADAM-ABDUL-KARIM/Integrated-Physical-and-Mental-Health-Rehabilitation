use project_main;
SELECT * FROM project_main.healthcarespecialist;

-- Doctor's availability
SELECT healthcarespecialist.health_care_id, healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name , healthcarespecialist.health_care_phone_number,healthcarespecialist.is_doctor,healthcarespecialist.health_care_specialization,
availability.availability_day,availability.availability_start_time,availability.availability_end_time
FROM HealthCareSpecialist 
JOIN Availability ON HealthCareSpecialist.health_care_id = Availability.health_care_specialist_id WHERE healthcarespecialist.is_doctor = 1;

select * from patient_session;

-- Checking every Appointment between a specific Patient and a Doctor
SELECT HealthCareSpecialist.health_care_id, healthcarespecialist.health_care_name, HealthCareSpecialist.health_care_last_name, Patient.patient_file_number, Patient.patient_first_name, Patient.patient_last_name, appointment.appointment_date, appointment.appointment_id, Appointment.patient_diagnosis
FROM HealthCareSpecialist
JOIN Appointment ON HealthCareSpecialist.health_care_id = appointment.doctor_id
JOIN Patient ON Appointment.Patient_file_number = Patient.Patient_file_number where patient.patient_file_number = 2000 and healthcarespecialist.health_care_id = 1000 ;

--  Check Therapists Availability
SELECT healthcarespecialist.health_care_id, healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name , healthcarespecialist.health_care_phone_number,healthcarespecialist.is_mental__health ,healthcarespecialist.is_physical_therapist,healthcarespecialist.health_care_specialization,
availability.availability_day,availability.availability_start_time,availability.availability_end_time
FROM HealthCareSpecialist 
JOIN Availability ON HealthCareSpecialist.health_care_id = Availability.health_care_specialist_id WHERE healthcarespecialist.is_mental__health = 1  or healthcarespecialist.is_physical_therapist = 1;

select * from patient 
;

-- Get Notes from a specific Session
SELECT HealthCareSpecialist.health_care_id,healthcarespecialist.health_care_name, 
 Patient_session.session_number,patient_session.session_id, Patient_session.session_date,notes.sessio_notes,patient_session.patient_file_number
FROM HealthCareSpecialist
JOIN Patient_session on HealthCareSpecialist.health_care_id = patient_session.therapist_id
JOIN Notes ON patient_session.session_id = notes.session_id where patient_session.session_id = 7000;

--  Count how many Appointments a specific Doctor has
SELECT COUNT(Appointment.doctor_id) as Number_Of_Appointments
FROM Appointment where appointment.doctor_id = 1004;




SELECT * from appointment;

-- 6 Get the Diagnosis of a Patient
SELECT Patient.patient_file_number, Patient.patient_first_name,Patient.patient_last_name,diagnosis.diagnosis
FROM Patient
JOIN Diagnosis ON Patient.patient_file_number=Diagnosis.patient_file_number where patient.patient_file_number = 2003;

-- 7 Retrieve the Medical Information of a Patient
SELECT patient.patient_file_number, diagnosis.diagnosis,chronic_illness.illness,clinical_test.test_date,clinical_test.test_name,family_history.family_history_description,
health_habits.health_habits,medication.medication
FROM Patient 
 JOIN Clinical_test ON Patient.patient_file_number = Clinical_test.patient_file_number
 JOIN Family_history ON Patient.patient_file_number = Family_history.patient_file_number
 JOIN Health_habits ON Patient.patient_file_number = Health_habits.patient_file_number
 JOIN Medication ON Patient.patient_file_number = Medication.patient_file_number
 JOIN Diagnosis ON Patient.patient_file_number = Diagnosis.patient_file_number
 JOIN Previous_injuries ON Patient.patient_file_number = previous_injuries.patient_file_number join hobbies on Patient.patient_file_number = hobbies.patient_file_number
 join chronic_illness on Patient.patient_file_number =chronic_illness.patient_file_number;

start TRANSACTION;
rollback;
 
 -- 8- Check Patients who are under 18 with a certain Health Habit
 select * from patient;
 SELECT patient.patient_file_number,patient.patient_first_name,patient.patient_last_name,patient_age,health_habits.health_habits 
 from patient  Join health_habits on patient.patient_file_number = health_habits.patient_file_number  where health_habits.health_habits like  '%sleep%' and patient.patient_age < 18;
 ;
 
-- 9 Count how many Sessions the Therapists have
-- γ file number, therapist id, Count (Session)
SELECT 
    healthcarespecialist.health_care_id,
    COUNT(*) AS total_session_count
FROM
    healthcarespecialist 
JOIN
    patient_session ON healthcarespecialist.health_care_id = patient_session.therapist_id 
WHERE 
    healthcarespecialist.health_care_id = 1012 -- specify
GROUP BY
    healthcarespecialist.health_care_id;
    
    
    -- 10 Total sessions for each therapist
SELECT 
    healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,
    COUNT(session_id) AS session_count
FROM
    patient_session 
JOIN
    healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
WHERE 
    healthcarespecialist.is_physical_therapist = 1 or healthcarespecialist.is_mental__health = 1 
GROUP BY
    healthcarespecialist.health_care_id ;
    
    -- 11 Therapist with most sessions
    SELECT 
    healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,
    COUNT(session_id) AS session_count
FROM
    patient_session 
JOIN
    healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
WHERE 
    healthcarespecialist.is_physical_therapist = 1 or healthcarespecialist.is_mental__health = 1
GROUP BY
    healthcarespecialist.health_care_id order by session_count desc limit 1;
   
   
    -- 12 Diagnosis that needs both PH and MH
SELECT DISTINCT 
  healthcarespecialist.health_care_id,
    healthcarespecialist.is_mental__health,
    healthcarespecialist.is_physical_therapist,
    diagnosis.diagnosis
FROM 
    healthcarespecialist 
JOIN 
    patient_session ON healthcarespecialist.health_care_id = patient_session.therapist_id
JOIN 
    diagnosis ON diagnosis.patient_file_number = patient_session.patient_file_number 
WHERE 
    healthcarespecialist.is_mental__health = 1 AND
    healthcarespecialist.is_physical_therapist = 1;
    
    -- 12 Check Doctors who are Available on a certain Day
    SELECT healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,availability.availability_day,availability.availability_start_time,availability.availability_end_time
    from healthcarespecialist join availability on healthcarespecialist.health_care_id = availability.health_care_specialist_id where availability.availability_day like '%tuesday %';
    
    -- 13  Check Patients who visited a Mental Health Therapist
    SELECT DISTINCT patient.patient_file_number,patient.patient_first_name,patient.patient_last_name,healthcarespecialist.health_care_id,healthcarespecialist.is_mental__health,healthcarespecialist.health_care_specialization
    from patient join patient_session on patient.patient_file_number = patient_session.patient_file_number
    join healthcarespecialist on healthcarespecialist.health_care_id = patient_session.therapist_id where healthcarespecialist.is_mental__health = 1;
    
    -- 14 Get Clinical Tests of a Patient
  SELECT  patient.patient_file_number,patient.patient_first_name,patient.patient_last_name,clinical_test.test_name,clinical_test.test_date from
  patient join clinical_test on patient.patient_file_number = clinical_test.patient_file_number where patient.patient_file_number = 2002;
  
  -- 15 Get the patient with more than one chronic illness.
  SELECT * from chronic_illness;
  -- for demo purpioses
  update chronic_illness set chronic_illness.illness = "Depressive Disorder, Illness2" where chronic_illness.patient_file_number =2005;
  
SELECT patient_file_number, 
       (LENGTH(illness) - LENGTH(REPLACE(illness, ',', ''))) + 1 as illness_count
FROM chronic_illness
HAVING illness_count > 1;

-- 16 Check all the Patients who visited an Orthopedical Doctor
select * from appointment;
  SELECT * from patient;
SELECT patient.patient_file_number, patient.patient_first_name,patient.patient_last_name,healthcarespecialist.health_care_id,
healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,healthcarespecialist.health_care_specialization from 

appointment join healthcarespecialist on  appointment.doctor_id = healthcarespecialist.health_care_id
join patient on patient.patient_file_number = appointment.patient_file_number where healthcarespecialist.health_care_specialization like '%Orthop%' ;

-- 17  Check Patients who are over 60 with Chronic Illness

select * from patient;
start TRANSACTION;
rollback;

-- for testing: because no patient is over 60 - START TRANSACTION and ROLLBACK will take us to the previous state before the update
UPDATE patient set patient.patient_age = 70 where patient.patient_file_number = 2000;

SELECT patient.patient_file_number, patient.patient_first_name,patient.patient_last_name,patient.patient_age,chronic_illness.illness from 
patient join chronic_illness on patient.patient_file_number = chronic_illness.patient_file_number where patient.patient_age > 60;

-- 18 Doctor with most appointments
select healthcarespecialist.health_care_id , healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,
COUNT(appointment_id) as Total_Appointments from appointment join healthcarespecialist on healthcarespecialist.health_care_id = 
appointment.doctor_id Group by healthcarespecialist.health_care_id , healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name
order by Total_Appointments desc limit 1
;

-- 19 The Doctor with least appointments
select healthcarespecialist.health_care_id , healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,
COUNT(appointment_id) as Total_Appointments from appointment join healthcarespecialist on healthcarespecialist.health_care_id = 
appointment.doctor_id Group by healthcarespecialist.health_care_id , healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name
order by Total_Appointments asc limit 1;



-- 20 Therapists with least sessions
    SELECT 
    healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,healthcarespecialist.health_care_last_name,
    COUNT(session_id) AS session_count
FROM
    patient_session 
JOIN
    healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
WHERE 
    healthcarespecialist.is_physical_therapist = 1 or healthcarespecialist.is_mental__health = 1
GROUP BY
    healthcarespecialist.health_care_id order by session_count asc limit 2 ; 
   
-- sub(nested) query but takes longer if data is large : to get the health care specialist with least 
-- sessions of appointments we ask the question what if two specilsits share the same number of sessions or appointments
SELECT 
    healthcarespecialist.health_care_id,
    healthcarespecialist.health_care_name,
    healthcarespecialist.health_care_last_name,
    COUNT(session_id) AS session_count
FROM
    patient_session 
JOIN
    healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
WHERE 
    healthcarespecialist.is_doctor = 0
GROUP BY
    healthcarespecialist.health_care_id 
HAVING 
    session_count = (
        SELECT 
            MIN(session_count) 
        FROM (
            SELECT 
                COUNT(session_id) AS session_count
            FROM
                patient_session 
            JOIN
                healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
            WHERE 
                healthcarespecialist.is_physical_therapist = 1 or healthcarespecialist.is_mental__health = 1
            GROUP BY
                healthcarespecialist.health_care_id
        ) AS subquery
    );
    
    -- 21 Therapist with most sessions based on speciality -PH = 1 or MH = 1-
    select healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,
    healthcarespecialist.health_care_last_name,   Count(session_id) as total_sessions 
    from healthcarespecialist  join patient_Session  
    on patient_Session.therapist_id = healthcarespecialist.health_care_id where healthcarespecialist.is_mental__health = 1  group by healthcarespecialist.health_care_id,healthcarespecialist.health_care_name,
    healthcarespecialist.health_care_last_name order by total_sessions desc limit 1;