/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT NOT NULL PRIMARY KEY,
name VARCHAR(100),
date_of_birth  DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg FLOAT 
);

/* Alter the database schema to add a new column. */
ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name VARCHAR(250),
age INT
);

/* create a species Table */
CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(150)
);

/* add autoincremented primary key to the animals table id */
ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_pkey;
ALTER TABLE animals ALTER column id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals
ADD PRIMARY KEY (id);

/* Delete the species column */
 ALTER TABLE animals DROP COLUMN species;

/* create columns and add a foreign key constraint to the animals table */
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT FK_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT FK_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

-------- relationship between tables ------------

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE
);

--- create a table to store the relationship between vets and species

CREATE TABLE specializations (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  vet_id INT REFERENCES vets(id),
  species_id INT REFERENCES species(id)
);

--- create a table to store the relationship between vets and animals
CREATE TABLE visits(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
vet_id INT REFERENCES vets(id),
animals_id INT REFERENCES animals(id),
visit_date DATE
);

---- CREATE COLUMN EMAIL TO OWNERS TABLE
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX ON visits (animal_id);
CREATE INDEX ON visits (vet_id);
CREATE INDEX ON owners (email);
