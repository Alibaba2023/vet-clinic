-- Create table animals
CREATE TABLE animals (
  id INT,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL(10,2)
);

-- Add a new column to the animal table using alter
ALTER TABLE animals ADD species varchar(255);

-- Create table owners
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INTEGER
);

-- Create table species
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- Drop column species
ALTER TABLE animals
DROP COLUMN species;

-- Modify the animal's table to include species_id and owner_id 
ALTER TABLE animals
  ADD COLUMN species_id INTEGER,
  ADD COLUMN owner_id INTEGER,
  ADD FOREIGN KEY (species_id) REFERENCES species(id),
  ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Create table vets 
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

-- Create table specializations 
CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  vet_id INTEGER,
  species_id INTEGER
);

ALTER TABLE specializations
ADD FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE specializations
ADD FOREIGN KEY (species_id) REFERENCES species (id);

-- Create table visits
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INT,
  vet_id INT,
  date DATE
);

ALTER TABLE visits
ADD FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE visits
ADD FOREIGN KEY (animal_id) REFERENCES animals (id);
