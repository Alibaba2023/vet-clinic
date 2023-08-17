
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('pikachu', '2021-01-07', 1, FALSE, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('devimon', '2017-05-12', 5, TRUE, 11);

-- update data

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('charmander', '2020-2-8', 0, FALSE, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);

-- insert data in to owners

INSERT INTO owners (full_name, age)
VALUES
	('Sam Smith', 34),
	('Jennifer Orwell', 19),
	('Bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
	('Pokemon'),
  ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
SELECT * FROM animals ORDER BY id;

UPDATE animals SET owner_id = 1 WHERE id = 1;
UPDATE animals SET owner_id = 2 WHERE id = 2;
UPDATE animals SET owner_id = 2 WHERE id = 3;
UPDATE animals SET owner_id = 3 WHERE id = 4;
UPDATE animals SET owner_id = 3 WHERE id = 6;
UPDATE animals SET owner_id = 4 WHERE id = 5;
UPDATE animals SET owner_id = 4 WHERE id = 7;
UPDATE animals SET owner_id = 4 WHERE id = 10;
UPDATE animals SET owner_id = 5 WHERE id = 8;
UPDATE animals SET owner_id = 5 WHERE id = 9;
SELECT * FROM animals ORDER BY id;