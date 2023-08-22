
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