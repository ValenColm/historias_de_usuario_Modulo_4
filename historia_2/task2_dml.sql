USE gestion_academica_universidad;

INSERT INTO estudiantes (nombre_completo, correo_electronico, genero, identificacion, carrera, fecha_nacimiento, fecha_ingreso)
VALUES
('Juan Pérez', 'juan.perez@email.com', 'Masculino', '1001', 'Ingeniería Civil', '2000-05-15', '2022-01-10'),
('María Gómez', 'maria.gomez@email.com', 'Femenino', '1002', 'Derecho', '1999-10-22', '2021-02-15'),
('Carlos Ruiz', 'carlos.ruiz@email.com', 'Masculino', '1003', 'Derecho', '2001-03-05', '2023-01-20'),
('Ana López', 'ana.lopez@email.com', 'Femenino', '1004', 'Arquitectura', '2000-11-30', '2022-07-01'),
('Luis Torres', 'luis.torres@email.com', 'Masculino','1005', 'Ingeniería Civil', '1998-07-12', '2020-01-15');

INSERT INTO docentes (nombre_completo, correo_institucional, departamento_academico, anios_experiencia)
VALUES
('Ana Martinez', 'ana.martinez@univ.edu', 'Ingeniería Civil', 8),
('Carlos Ruiz', 'carlos.ruiz@univ.edu', 'Derecho', 4),
('Elena Gomez', 'elena.gomez@univ.edu', 'Arquitectura', 12);

INSERT INTO cursos (nombre, codigo, creditos, semestre, id_docente)
VALUES
('Bases de Datos I', 'INF101', 3, 2, 1),
('Cálculo Integral', 'MAT202', 4, 2, 2),
('Programación Web', 'INF105', 3, 3, 1),
('Física Mecánica', 'FIS101', 4, 1, 3);

INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion, calificacion_final)
VALUES
(1, 1, '2024-02-01', 4.5),
(1, 2, '2024-02-01', 3.8),
(2, 1, '2024-02-02', 4.2),
(3, 2, '2024-02-05', 3.0),
(4, 4, '2024-02-10', 4.8),
(5, 1, '2024-02-01', 2.5),
(5, 3, '2024-02-15', 3.9),
(2, 3, '2024-02-15', 4.0);