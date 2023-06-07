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





