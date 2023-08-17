
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
