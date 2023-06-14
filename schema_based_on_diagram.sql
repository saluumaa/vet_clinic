CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
);

CREATE TABLE medical_history (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at timestamp,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(100),
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount FLOAT,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT REFERENCES medical_history(id),
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price FLOAT,
  quantity INT,
  total_price FLOAT,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100),
);

--foreign key Index
CREATE INDEX indx_invoice_items ON invoice_items (invoice_id);
CREATE INDEX ON medical_history (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (treatment_id);
