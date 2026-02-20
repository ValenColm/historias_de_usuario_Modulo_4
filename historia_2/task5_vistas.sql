USE gestion_academica_universidad;
-- Creamos la vista con los datos solicitados

CREATE OR REPLACE VIEW vista_historial_academico AS
SELECT
e.nombre_completo AS Estudiante,
c.nombre AS Curso,
d.nombre_completo AS Docente,
c.semestre,
i.calificacion_final
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
JOIN docentes d ON c.id_docente = d.id_docente;

SELECT * FROM vista_historial_academico;