/* Database schema to keep the structure of entire database. */

/* Create table medical_histories*/
CREATE TABLE medical_histories (
    id serial primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

/* Create table patients*/
CREATE TABLE patients(
    id serial primary key,
    name varchar(100),
    date_of_birth date
);

/* Create table treatments*/
CREATE TABLE treatments(
    id serial primary key,
    type varchar(100),
    name varchar(100)
);
/* establish the many-to-many relationship between medical_histories and treatments*/

CREATE TABLE medical_history_treatments (
    id serial primary key,
    medical_history_id int,
    treatment_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);
