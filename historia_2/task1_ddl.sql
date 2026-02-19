CREATE DATABASE gestion_academica_universidad;

USE gestion_academica_universidad;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL,
    genero VARCHAR(10),
    identificacion VARCHAR(15) UNIQUE NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    fecha_ingreso DATE
);



CREATE TABLE docentes (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(50) NOT NULL,
    correo_institucional VARCHAR(50) UNIQUE NOT NULL,
    departamento_academico VARCHAR(50) NOT NULL,
    anios_experiencia INT
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    creditos INT,
    semestre INT,
    UNIQUE (codigo),
    id_docente INT,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente),
    ON DELETE CASCADE
);


CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE NOT NULL,
    calificacion_final DECIMAL(4,2),
    CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    CONSTRAINT chk_nota CHECK (calificacion_final >= 0 AND calificacion_final <=5)
);