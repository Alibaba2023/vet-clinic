
SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('agumon', 'pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name <> 'gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;


BEGIN;
  UPDATE animals SET species = 'digimon ' WHERE NAME LIKE '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
  SELECT * FROM animals;
COMMIT;
  SELECT * FROM animals;


BEGIN;
  DELETE FROM animals;
  SELECT COUNT(id) FROM animal;
ROLLBACK;
  SELECT COUNT(id) FROM animal;

BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
  UPDATE animals SET weight_kg = weight_kg * -1;
  ROLLBACK TO my_savepoint;
  UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average FROM animals;

SELECT neutered, COUNT(*) AS escape_count FROM animals 
WHERE escape_attempts > 0 GROUP BY neutered ORDER BY escape_count DESC;

SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight
FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals   
WHERE  date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31'
GROUP BY species;

-- queries for the owners table

SELECT full_name, name FROM owners 
JOIN animals ON owners.id = animals.owner_id
WHERE full_name = 'Melody Pond';

SELECT a.name AS animal_name, s.name AS species FROM animals AS a
JOIN species s on s.id = a.species_id 
WHERE s.name = 'Pokemon';

SELECT owners.full_name, animalS.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, count(species.name) as amount FROM animals 
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT o.full_name AS owner, a.name AS animal_name, s.name AS species
FROM animals AS a
JOIN species AS s on a.species_id = s.id
JOIN owners AS o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND  o.full_name = 'Jennifer Orwell';

SELECT a.name AS animal_name, o.full_name AS owner, a.escape_attempts 
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT full_name, COUNT(full_name) AS amount FROM owners
JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY amount DESC LIMIT 1;
