CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE
);

CREATE TABLE clasrooms (
  id SERIAL PRIMARY KEY,
  code TEXT NOT NULL UNIQUE,
);

CREATE TABLE students_classrooms (
  id SERIAL PRIMARY KEY,
  "studentId" INTEGER NOT NULL REFERENCES "students"("id"),
  "classroomId" INTEGER NOT NULL REFERENCES "classrooms"("id"),
  "joinDate" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  "leaveDate" TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL,
);

CREATE TABLE modules (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  "moduleId" INTEGER NOT NULL REFERENCES "modules"("id")
);

CREATE TYPE result AS ENUM ('Abaixo das Expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE students_projects (
  id SERIAL PRIMARY KEY,
  "studentId" INTEGER NOT NULL REFERENCES "students"("id"),
  "projectId" INTEGER NOT NULL REFERENCES "projects"("id"),
  date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  score result NOT NULL
);