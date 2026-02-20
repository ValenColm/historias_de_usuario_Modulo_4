USE gestion_academica_universidad;
-- 1. Listar estudiantes con sus inscripciones y cursos (JOIN)
SELECT
e.nombre_completo AS Estudiante,
e.carrera AS Carrera,
c.nombre AS Curso,
d.nombre_completo AS Profesor
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
JOIN docentes d ON c.id_docente = d.id_docente;

-- 2. Cursos dictados por docentes con > 5 años de experiencia
SELECT c.nombre, d.nombre_completo, d.anios_experiencia
FROM cursos c
JOIN docentes d ON c.id_docente = d.id_docente
WHERE d.anios_experiencia > 5;
-- 3. Promedio de calificaciones por estudiante (Solo los de promedio > 4.0)
SELECT 
e.nombre_completo,
ROUND(AVG(i.calificacion_final), 1) AS promedio
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante
HAVING promedio > 4.0;

-- 4. Estudiantes inscritos en más de un curso (REQUISITO FALTANTE)
SELECT e.nombre_completo, COUNT(i.id_curso) AS total_cursos
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante
HAVING COUNT(i.id_curso) > 1;

-- 5. Cursos con su número de alumnos
SELECT 
c.nombre AS Curso,
COUNT(i.id_estudiante) AS Numero_Alumnos
FROM cursos c
LEFT JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso;


-- 6. Agregar columna estado_academico (con validación para evitar errores si ya existe)
ALTER TABLE estudiantes ADD COLUMN IF NOT EXISTS estado_academico VARCHAR(20) DEFAULT 'Activo';

-- Primero quitamos la restricción vieja y la ponemos con CASCADE
ALTER TABLE inscripciones DROP FOREIGN KEY IF EXISTS inscripciones_ibfk_2;
ALTER TABLE inscripciones 
ADD CONSTRAINT fk_inscripciones_cursos 
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON DELETE CASCADE;

-- 8. Eliminar un docente y observar efecto CASCADE
DELETE FROM docentes WHERE id_docente = 1;

-- 9. Verificación Final
SELECT * FROM cursos;
SELECT * FROM inscripciones;