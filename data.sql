
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

INSERT INTO vets (name, age, date_of_graduation)
VALUES
	('William Tatcher', 45, '2000-4-23'),
	('Maisy Smith', 26, '2019-1-17'),
	('Stephanie Mendez', 64, '1981-5-4'),
	('Jack Harkness', 38, '2008-6-8');


INSERT INTO specializations (vet_id, species_id)
VALUES 
	(1, 1),
	(3, 1),
	(3, 2),
	(4, 2);


INSERT INTO visits (visit_date, vet_id, animal_id)
VALUES
	('2020-5-24', 1, 1),
	('2020-6-22', 3, 1),
	('2021-2-2-', 4, 2),
	('2020-1-5', 2, 3),
	('2020-3-8', 2, 3),
	('2020-5-14', 2, 3),
	('2021-5-4', 3, 4),
	('2021-2-24', 4, 5),
	('2019-12-21', 2, 6),
	('2020-8-10', 1, 6),
	('2021-4-7', 2, 6),
	('2019-9-29', 3, 7),
	('2020-10-3', 4, 8), 
	('2020-11-4', 4, 8),
	('2019-1-24', 2, 9),
	('2019-5-15', 2, 9),
	('2020-2-27', 2, 9),
	('2020-8-3', 2, 9),
	('2020-5-24', 3, 10),
	('2021-1-11', 1, 10);
	