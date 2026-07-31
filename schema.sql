-- Schema inferred from the SQL queries in app.py.
-- Run this against a MySQL server before starting the app:
--   mysql -u root -p < schema.sql

CREATE DATABASE IF NOT EXISTS fraud_job;
USE fraud_job;

CREATE TABLE IF NOT EXISTS users (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(150) NOT NULL,
    email    VARCHAR(150) NOT NULL,
    mobile   VARCHAR(20)  NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS predictions (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    job_title  VARCHAR(255),
    company    VARCHAR(255),
    prediction VARCHAR(20),
    created_at DATE,
    username   VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS feedback (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    job_title     VARCHAR(255),
    company       VARCHAR(255),
    prediction    VARCHAR(20),
    user_feedback VARCHAR(20),
    comments      TEXT
);

CREATE TABLE IF NOT EXISTS training_data (
    id                     INT AUTO_INCREMENT PRIMARY KEY,
    job_title              VARCHAR(255),
    company                VARCHAR(255),
    salary                 FLOAT,
    registration_required  VARCHAR(10),
    registration_fee       FLOAT,
    label                  VARCHAR(20)
);
