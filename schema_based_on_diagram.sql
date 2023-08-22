
-- Create table for treatments
CREATE TABLE treatments (
    id serial PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50)
);

-- Create table for invoices
CREATE TABLE invoices (
    id serial PRIMARY KEY,
    total_amount FLOAT,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id int REFERENCES medical_histories(id)
);

-- Create table for invoice items
CREATE TABLE invoice_items (
    id serial PRIMARY KEY,
    unit_price FLOAT,
    quantity INT,
    total_price FLOAT,
    invoice_id int REFERENCES invoices(id),
    treatment_id int REFERENCES treatments(id)
);

-- Create join table for treatments and medical histories
CREATE TABLE treatments_medical_histories (
    treatment_id int REFERENCES treatments(id),
    medical_history_id int REFERENCES medical_histories(id),
    PRIMARY KEY (treatment_id, medical_history_id)
);

-- medical_histories Table
CREATE INDEX idx_medical_histories_patient_id ON medical_histories(patient_id);

-- invoices Table
CREATE INDEX idx_invoices_medical_history_id ON invoices(medical_history_id);

-- invoice_items Table
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);

-- treatments_medical_histories Table
CREATE INDEX idx_treatments_medical_histories_treatment_id ON treatments_medical_histories(treatment_id);
CREATE INDEX idx_treatments_medical_histories_medical_history_id ON treatments_medical_histories(medical_history_id);
