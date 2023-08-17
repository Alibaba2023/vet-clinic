CREATE TABLE animals (
  id INTEGER,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

-- add column species

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);