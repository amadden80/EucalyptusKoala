-- Notes on manual database prep

CREATE DATABASE wdiback;
\c wdiback;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  sound varchar(255),
  description varchar(255)
);

CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE kittens (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  pic_url varchar(255)
);

CREATE TABLE chirps (
  id SERIAL PRIMARY KEY,
  username varchar(255),
  message text,
  pic_url varchar(255)
);
