

## Overview

This database system is designed for a rehabilitation facility that manages healthcare professionals, patients, appointments, therapy sessions, and medical records. It provides comprehensive tracking of medical histories, treatment plans, and patient progress through a relational database structure.

## Implementation Notes

The database uses MySQL and follows standard SQL practices. All tables include appropriate constraints and relationships to maintain data integrity.

## Database Structure

The database (`project_main`) consists of the following major tables:

### Healthcare Providers
- **HealthCareSpecialist**: Stores information about doctors, physical therapists, and mental health professionals
- **Availability**: Tracks when healthcare specialists are available for appointments

### Patient Information
- **Patient**: Contains demographic and basic medical information
- **Diagnosis**: Records patient diagnoses
- **Chronic_illness**: Tracks ongoing health conditions
- **Health_habits**: Documents patient lifestyle factors
- **Family_history**: Records relevant family medical history
- **Previous_injuries**: Stores information about past injuries
- **Clinical_test**: Tracks medical tests performed
- **Medication**: Records prescribed medications
- **Hobbies**: Documents patient activities that may affect treatment

### Appointments and Sessions
- **Appointment**: Tracks doctor appointments
- **Patient_Session**: Records therapy sessions
- **Notes**: Contains detailed session notes

## Key Features

- Complete tracking of healthcare specialists (doctors, physical therapists, mental health therapists)
- Comprehensive patient profile management
- Appointment scheduling and management
- Therapy session tracking with detailed notes
- Medical history documentation
- Reporting capabilities for patient treatment analysis

## Sample Queries

The database includes a variety of pre-built queries for common operations:

- View healthcare specialist availability
- Track patient appointments with specific doctors
- Retrieve complete medical records for patients
- Analyze therapist workloads
- Identify patients with specific conditions or demographic factors
- Generate statistics on facility operations

## Database Schema

The database uses a relational model with foreign key constraints to maintain data integrity across tables. Primary keys use auto-incrementing IDs, and the schema supports one-to-many relationships between healthcare providers and patients.

## Usage Examples

```sql
-- Find all appointments for a specific patient
SELECT HealthCareSpecialist.health_care_name, appointment.appointment_date 
FROM Appointment 
JOIN HealthCareSpecialist ON Appointment.doctor_id = HealthCareSpecialist.health_care_id
WHERE Appointment.patient_file_number = 2000;

-- View therapist with highest workload
SELECT healthcarespecialist.health_care_name, COUNT(session_id) AS session_count
FROM patient_session 
JOIN healthcarespecialist ON healthcarespecialist.health_care_id = patient_session.therapist_id 
GROUP BY healthcarespecialist.health_care_id 
ORDER BY session_count DESC LIMIT 1;
```
