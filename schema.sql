CREATE TABLE animals (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

-- add column species

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

-- owners table 

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50),
	age SMALLINT
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk_animals_species
FOREIGN KEY (species_id) REFERENCES species(id);


ALTER TABLE animals
ADD COLUMN owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk_animals_owners
FOREIGN KEY (owner_id) REFERENCES owners(id);


CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	age SMALLINT,
	date_of_graduation DATE
);


CREATE TABLE specializations (
	id BIGSERIAL PRIMARY KEY,
	vet_id INTEGER REFERENCES vets(id),
	species_id INTEGER REFERENCES species(id)
);


CREATE TABLE visits (
	id BIGSERIAL PRIMARY KEY,
	visit_date DATE,
	vet_id INTEGER REFERENCES vets(id),
	animal_id INTEGER REFERENCES animals(id)
);