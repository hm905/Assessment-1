1. Print a list of all doctors based at a particular hospital.
mysql> SELECT id, name FROM people WHERE role = 'Doctor' AND hospital_id                                                                                      =1;
+----+---------------------+
| id | name                |
+----+---------------------+
|  8 | Dr. Tanner Reynolds |
| 29 | Dr. Alvin Nelson    |
| 98 | Dr. Christian Lewis |
+----+---------------------+
3 rows in set (0.00 sec)

2. Print a list of all prescriptions for a particular patient, ordered by the prescription date.
mysql> SELECT * FROM prescriptions WHERE patient_id = 345 ORDER BY prescription_date;
+-----------------+------------+-----------+------------+-------------------+
| prescription_id | patient_id | doctor_id | medication | prescription_date |
+-----------------+------------+-----------+------------+-------------------+
|               1 |        345 |        68 | Lisinopril | 2023-10-23        |
+-----------------+------------+-----------+------------+-------------------+
1 row in set (0.00 sec)

3. Print a list of all prescriptions that a particular doctor has prescribed
mysql> SELECT * FROM prescriptions WHERE doctor_id = 2;
+-----------------+------------+-----------+-------------+-------------------+
| prescription_id | patient_id | doctor_id | medication  | prescription_date |
+-----------------+------------+-----------+-------------+-------------------+
|             225 |        210 |         2 | Aspirin     | 2024-09-09        |
|             272 |        563 |         2 | Losartan    | 2024-06-24        |
|             420 |        563 |         2 | Paracetamol | 2024-09-04        |
+-----------------+------------+-----------+-------------+-------------------+
3 rows in set (0.01 sec)

4. Add a new patient to the database, including being registered with one of the doctors.
mysql> INSERT INTO people (id, name, date_of_birth, address, role, doctor_id) VALUES (805, 'Ian Bon', '1994-01-14', '617 The Duet', 'Patient', 2              );
Query OK, 1 row affected (0.18 sec)

5. Identify which doctor has made the most prescriptions.
mysql> SELECT * FROM people WHERE doctor_id = 2;
+-----+------------------+---------------+-------------------------------------------------------+---------+-------------+-----------+
| id  | name             | date_of_birth | address                                               | role    | hospital_id | doctor_id |
+-----+------------------+---------------+-------------------------------------------------------+---------+-------------+-----------+
| 210 | Elijah Torres    | 1949-03-20    | 8739 Brown Tunnel Suite 705 West Laura, OK 83027      | Patient |        NULL |         2 |
| 296 | Roger Arroyo     | 1962-01-07    | 15009 Blake Pike Suite 096 West Deborahstad, SC 82928 | Patient |        NULL |         2 |
| 364 | Catherine Garcia | 1943-03-09    | 85156 Suzanne Ports Apt. 643 North Matthew, CT 55088  | Patient |        NULL |         2 |
| 563 | Michael Young    | 1957-05-02    | PSC 2086, Box 6397 APO AA 60576                       | Patient |        NULL |         2 |
| 805 | Ian Bon          | 1994-01-14    | 617 The Duet                                          | Patient |        NULL |         2 |
+-----+------------------+---------------+-------------------------------------------------------+---------+-------------+-----------+
5 rows in set (0.00 sec)

6. Print a list of all doctors at the hospital with biggest size (number of beds).
mysql> SELECT prescriptions.doctor_id, people.name, COUNT(*) AS total_prescriptions
    -> FROM prescriptions
    -> INNER JOIN people
    -> ON prescriptions.doctor_id = people.id
    -> GROUP BY prescriptions.doctor_id, people.name
    -> ORDER BY total_prescriptions DESC
    -> LIMIT 1;
+-----------+--------------------+---------------------+
| doctor_id | name               | total_prescriptions |
+-----------+--------------------+---------------------+
|        19 | Dr. Taylor Sanchez |                  13 |
+-----------+--------------------+---------------------+
1 row in set (0.00 sec)

mysql> SELECT people.id, people.name
    -> FROM people
    -> INNER JOIN hospitals
    -> ON people.hospital_id = hospitals.hospital_id
    -> WHERE people.role = 'Doctor'
    -> AND hospitals.size = (
    -> SELECT MAX(size)
    -> FROM hospitals
    -> );
+----+--------------------+
| id | name               |
+----+--------------------+
| 18 | Dr. Kathryn Ray    |
| 73 | Dr. Regina Ryan    |
| 88 | Dr. Carly Moyer    |
| 99 | Dr. Scott Reynolds |
+----+--------------------+
4 rows in set (0.01 sec)
