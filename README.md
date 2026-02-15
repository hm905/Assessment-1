# Overview
This assessment implements a hospital database using MySQL.

The database was created using provided CSV files and includes:
- Table creation
- ERD
- Data Loading (doctors.csv, patients.csv, hospital.csv and prescription.csv)
- Using SQL queries to extract various data from database 

## Database structure

The database consists of three tables
1.	Hospital
2.	Doctor and patient which I named people
3.	Prescription

## The structure of each table

### Hospital
**Hospital_id – primary key**
#### Columns
- Name
- Address
- Size
- Type
- Accreditation_status

### People
**Id- primary key (Both doctor id and patient id)**
#### Columns
- Name
- Date of birth
- Address
- Role
- Hospital_id- Foreign key from hospital table
- Doctor_id- Foreign key which link patient to doctor id in the same table

ie if role= doctor – no doctor id

if role=patient- reference id to link patient to doctor

### Presciption
**Prescription_id- Primary key**
#### Columns
- Medication
- Prescription date
- Patient id- foreign key
- Doctor id- foreign key

### Relationship between 3 tables
1. **Hospital table to people table**
- One hospital to many doctors
2. **Doctor to patient within people table**
- One doctor to many patients
3. **People table to Prescription table**
- One doctor to many prescriptions
- One patient to many prescriptions

**All one to many relationships linked using foreign key**

### SQL queries
1.	**Print a list of all doctors based at a particular hospital**
-	Used select doctor and where hospital number 2
2.	**Print a list of all prescriptions for a particular patient, ordered by the prescription date**
-	Used Select prescription where patient id 345 and order by prescription date  
3.	**Print a list of all prescriptions that a particular doctor has prescribed**
-	Used Select prescription where doctor id=2
4.	**Add a new patient to the database, including being registered with one of the doctors**
-	Used Insert into people table (role= patient, include doctor id and in this case made up patient id 807)
5.	**Identify which doctor has made the most prescriptions**
-	Used inner join to show doctors name linked to id
-	Used count to count prescription 
-	Ordered by and limit to one to show top result
6.	**Print a list of all doctors at the hospital with biggest size (number of beds)**
-	Inner join to show doctors number linked to hospital id
-	MAX(size) to show largest hospital

## List of documents included in github repository
**1. hospital_database file**
- Table creation codes
- Primary keys
- Foreign keys
- Loaded data

**2. hospital_queries.sql**

**contain all 6 SQL queries requested on assessment brief**
- Print a list of all doctors based at a particular hospital
- Print a list of all prescriptions for a particular patient, ordered by the prescription date
- Print a list of all prescriptions that a particular doctor has prescribed
- Add a new patient to the database, including being registered with one of the doctors
- Identify which doctor has made the most prescriptions.
- Print a list of all doctors at the hospital with biggest size (number of beds)

**3. ERD.pdf**
This illustrates the three main tables and their one to many relationships using primary key and foreign keys.

This reflect the relationships explained above in **Relationship between 3 tables**

**4. Pseudocode**
- Logical plan of the database design



