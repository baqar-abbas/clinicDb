/* Database schema to keep the structure of entire database. */

/* Create table medical_histories*/
CREATE TABLE medical_histories (
    id serial primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE INDEX idx_patient_id ON medical_histories (patient_id);

/* Create table patients*/
CREATE TABLE patients(
    id serial primary key,
    name varchar(100),
    date_of_birth date
);

CREATE INDEX index_patients ON patients (id);


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

/* Create table invoices and created reference to Medical histories (One to one relationship) */

CREATE TABLE invoices (
    id serial primary key,
    total_amount decimal(10,2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int REFERENCES medical_histories (id)
);

CREATE INDEX idx_medical_id ON invoices (medical_history_id);

/* Create table invoice items cceated one to many relation with invoices and treatments*/

CREATE TABLE invoice_items (
    id serial primary key,
    unit_price decimal(10,2),
    quantity int,
    total_price decimal(10,2),
    invoice_id int REFERENCES invoices (id),
    treatment_id int REFERENCES treatments (id)
);
