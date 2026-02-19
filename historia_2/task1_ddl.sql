CREATE DATABASE gestion_academica_universidad;
USE gestion_academica_universidad;
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    genero VARCHAR(10),
    identificacion VARCHAR(15) UNIQUE NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    fecha_ingreso DATE
)