use practica;

INSERT INTO paises (Descripcion) VALUES ('Argentina'), ('Brasil');
INSERT INTO provincias (Descripcion, CodigoPais) VALUES ('Córdoba',1), ('Entre Rios',1),('Brasilia',2);
INSERT INTO localidades (Descripcion, CodigoProvincia) VALUES ('Córdoba',1), ('Villa Maria',1),('Villa de Maria',1);

INSERT INTO Usuarios (Nombre, Apellido, Email, Password,CodigoLocalidad,Dni,sEXO,FechaNacimiento,Capacita)
VALUES ('Jose', 'Perez','jperez@gmail.com','hgbfj123',1,32542523,'M','2000-02-15',0);

INSERT INTO Usuarios (Nombre, Apellido, Email, Password,CodigoLocalidad,Dni,sEXO,FechaNacimiento,Capacita)
VALUES ('Juan', 'Lopez','jlopez@gmail.com','123456',2,25423145,'M','1985-05-23',0);

SELECT *
FROM Usuarios
WHERE Email='jlopez@gmail.com' and Password='123456';

/*Cargamos  un curso*/
INSERT INTO Cursos (Nombre, Descripcion, Logo, CodigoProfesor,DuracionEnMinutos)
VALUES ('Java para principiantes', 'Fundamentos de Java. Sintaxis y semántica. Estructuras de control de flujo. Aplicar constantes y variables. Realizar sentencias condicionales. Trabajar con distintos tipos de operadores. Vectores: creación, usos y arreglos','logo\java.jpg',1,900);
INSERT INTO UnidadesPorCurso (CodigoCurso, CodigoUnidad, Nombre, Descripcion, Video,Archivo)
VALUES (1,1,'Introducción a Java','¿Qué es Java y para qué sirve? JDK y JVM IDE Sintaxis Bloques y Sentencias Variables (Tipos, Identificación, Declaración y Asignación) Operadores (Matemáticos, de asignación, Relacionales y Lógicos)','videos\javauni','archivos\javauni1.pdf'),
(1,2,'Condicionales','Bifurcación if Bifurcación if else Bifurcaciones anidados Bifurcación Switch Operador Ternario (If reducido)','videos\javauni','archivos\javauni2.pdf'),
(1,3,'Ciclos','while do - while for Sentencia break Sentencia continue','videos\javauni','archivos\javauni3.pdf'),
(1,4,'Arreglos','Introducción Creación Usos Inicialización en la declaración Recorrido del arreglo','videos\javauni','archivos\javauni4.pdf'),
(1,5,'Métodos','Introducción Parámetros y Argumentos. Métodos tipo función. Métodos tipo procedimiento','videos\javauni','archivos\javauni5.pdf');
UPDATE Usuarios SET Capacita=1
WHERE Codigo=1;

UPDATE Cursos SET Nombre='Java para no programadores'
WHERE Codigo=1;

UPDATE UnidadesPorCurso SET Video=CONCAT(Video, CodigoUnidad, '.webm')
WHERE CodigoCurso=1;

DELETE FROM UnidadesPorCurso
WHERE CodigoCurso=1 and CodigoUnidad=5;