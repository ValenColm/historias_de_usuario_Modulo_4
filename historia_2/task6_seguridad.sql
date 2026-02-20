-- Crear el rol (o usuario)
CREATE USER IF NOT EXISTS 'revisor_academico'@'localhost' IDENTIFIED BY '1234*';

-- Otorgar solo lectura sobre la vista
GRANT SELECT ON gestion_academica_universidad.inscripciones TO 'revisor_academico'@'localhost';

-- Revocar cualquier permiso de modificación en inscripciones 
REVOKE INSERT, UPDATE, DELETE ON gestion_academica_universidad.inscripciones FROM 'revisor_academico'@'localhost';

GRANT SELECT ON gestion_academica_universidad.vista_historial_academico TO 'revisor_academico'@'localhost';

-- Ver permisos aplicados
SHOW GRANTS FOR 'revisor_academico'@'localhost';



-- Iniciamos la transacción
START TRANSACTION;

-- Creamos un punto de recuperación
SAVEPOINT antes_de_actualizar;

-- Simulamos una actualización (Subir nota a un estudiante)
UPDATE inscripciones 
SET calificacion_final = 5.0 
WHERE id_inscripcion = 1;

-- Si nos arrepentimos, volvemos al punto anterior:
-- ROLLBACK TO SAVEPOINT antes_de_actualizar;

-- Si estamos seguros de que todo está bien, guardamos:
COMMIT;