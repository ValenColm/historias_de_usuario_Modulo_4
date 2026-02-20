USE gestion_academica_universidad;
-- 1. Estudiantes con nota mayor al promedio general de la universidad
-- Usamos una subconsulta para calcular el promedio global primero
SELECT e.nombre_completo, ROUND(AVG(i.calificacion_final), 2) AS promedio_estudiante
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante
HAVING promedio_estudiante > (SELECT AVG(calificacion_final) FROM inscripciones);

-- 2. Carreras con estudiantes en cursos de semestre 2 o superior
-- Usamos IN para filtrar según los resultados de la subconsulta

SELECT DISTINCT carrera
FROM estudiantes
WHERE id_estudiante IN (
    SELECT i.id_estudiante
    FROM inscripciones i
    JOIN cursos c ON i.id_curso = c.id_curso
    WHERE c.semestre >=2
);

-- 3. Indicadores Generales (ROUND, SUM, MAX, MIN, COUNT)
SELECT
COUNT(*) AS total_inscripciones,
ROUND(AVG(calificacion_final), 2) AS nota_promedio,
MAX(calificacion_final) AS nota_maxima,
MIN(calificacion_final) AS nota_minima,
SUM(creditos) AS total_creditos_dictados
FROM inscripciones i
JOIN cursos c ON i.id_curso = c.id_curso;