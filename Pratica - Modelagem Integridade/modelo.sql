CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  "fullName" TEXT NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);

CREATE TYPE cellphone AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones" (
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
  number INTEGER NOT NULL,
  type cellphone NOT NULL
);

CREATE TABLE states (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAdresses" (
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
  street TEXT NOT NULL,
  number TEXT NOT NULL,
  complement TEXT DEFAULT NULL,
  "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
  "postalCode" TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
  "accountNumber" INTEGER NOT NULL,
  agency INTEGER NOT NULL.
  "openDate" DATE NOT NULL,
  "closeDate" DATE DEFAULT NULL
);

CREATE TYPE transaction AS ENUM ('deposit', 'withdraw');


CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
  amount INTEGER NOT NULL,
  type transaction,
  time DATE TIMESTAMP WITHOUT TIMEZONE DEFAULT NOW(),
  description TEXT NOT NULL,
  cancelled BOOLEAN DEFAULT FALSE
);

CREATE TABLE "creditCards" (
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
  name TEXT NOT NULL,
  number INTEGER NOT NULL,
  "securityCode" INTEGER NOT NULL,
  "expirationMonth" INTEGER NOT NULL,
  "expirationYear" INTEGER NOT NULL,
  password INTEGER NOT NULL,
  limit INTEGER NOT NULL
);