
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


SELECT a.name animal, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON a.id = vs.animal_id
JOIN vets vt ON vt.id = vs.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY vs.visit_date DESC LIMIT 1;


SELECT ve.name, COUNT(DISTINCT v.animal_id) AS distinct_animals
FROM visits v
JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez'
GROUP BY ve.name;


SELECT vt.name, s.name FROM vets	vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON s.id = sp.species_id;


SELECT a.name animal, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON a.id = vs.animal_id
JOIN vets vt ON vt.id = vs.vet_id
WHERE 
	vt.name = 'Stephanie Mendez' AND 
	vs.visit_date >= '2020-4-1' AND 
	vs.visit_date <= '2020-08-30';


SELECT a.name, COUNT(a.name) amount FROM visits vs
JOIN animals a ON a.id = vs.animal_id
GROUP BY a.name
ORDER BY amount DESC LIMIT 1;


SELECT a.name animal_name, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON vs.animal_id = a.id
JOIN vets vt ON vs.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY vs.visit_date LIMIT 1;


SELECT 
    a.name animal_name,
    a.date_of_birth animal_birth_date,
    a.escape_attempts,
    a.weight_kg animal_weight,
    vt.name vet,
    vt.age vet_age,
    vt.date_of_graduation,
    vs.visit_date
FROM animals a
JOIN (
    SELECT
        v1.animal_id,
        MAX(v1.visit_date) as most_recent_visit
    FROM visits v1
    GROUP BY v1.animal_id
) most_recent_visits ON a.id = most_recent_visits.animal_id
JOIN visits vs ON a.id = vs.animal_id AND most_recent_visits.most_recent_visit = vs.visit_date
JOIN vets vt ON vs.vet_id = vt.id
ORDER BY vs.visit_date DESC;



SELECT COUNT(*) non_specialized_visits
FROM visits vs
JOIN vets vt ON vs.vet_id = vt.id
LEFT JOIN specializations sp ON sp.vet_id = vt.id
JOIN animals a ON a.id = vs.animal_id
WHERE sp.species_id IS NULL OR sp.species_id != a.species_id;


SELECT vt.name, s.name speciality, COUNT(s.name) amount FROM vets vt
JOIN visits vs ON vt.id = vs.vet_id
JOIN animals a ON vs.animal_id = a.id
JOIN species s ON s.id = a.species_id
WHERE vt.name = 'Maisy Smith'
GROUP BY s.name, vt.name
ORDER BY amount DESC LIMIT 1;