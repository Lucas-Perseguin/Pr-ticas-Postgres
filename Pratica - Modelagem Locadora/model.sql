CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  "categoryId" INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE dvds (
  id SERIAL PRIMARY KEY,
  "number" INTEGER NOT NULL UNIQUE,
  barcode TEXT NOT NULL UNIQUE,
  "movieId" INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
  origin INTEGER NOT NULL REFERENCES countries(id),
  birth DATE NOT NULL
);

CREATE TABLE actors_movies (
  id SERIAL PRIMARY KEY,
  "actorId" INTEGER NOT NULL REFERENCES actors(id),
  "movieId" INTEGER NOT NULL REFERENCES movies(id),
);

CREATE TABLE states (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  "stateId" INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE adresses (
  id SERIAL PRIMARY KEY,
  "number" TEXT NOT NULL,
  street TEXT NOT NULL,
  "cityId" INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE contacts (
  id SERIAL PRIMARY KEY,
  "number" TEXT NOT NULL UNIQUE
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  cpf TEXT NOT NULL UNIQUE
  "adressId" INTEGER NOT NULL REFERENCES adresses(id),
  "contactId" INTEGER NOT NULL REFERENCES contacts(id)
);

CREATE TABLE clients_movies (
  id SERIAL PRIMARY KEY,
  "dvdId" INTEGER NOT NULL REFERENCES dvds(id),
  "rentDate" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);

CREATE TABLE clients_returned_movies (
  id SERIAL PRIMARY KEY,
  client_movie_id INTEGER NOT NULL REFERENCES clients_movies(id),
  "returnDate" TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL,
  "movieScore" INTEGER NOT NULL CHECK("movieScore" >= 0 AND "movieScore" <= 10),
  "receptionistScore" INTEGER NOT NULL CHECK("receptionistScore" >= 0 AND "receptionistScore" <= 10)
);