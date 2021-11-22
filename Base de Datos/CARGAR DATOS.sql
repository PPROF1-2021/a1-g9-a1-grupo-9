use practica;

INSERT INTO paises (Descripcion) VALUES ('Argentina'), ('Brasil'), ('Chile');
INSERT INTO provincias (Descripcion, CodigoPais) VALUES ('Córdoba',1), ('Entre Rios',1),('Brasilia',2);
INSERT INTO localidades (Descripcion, CodigoProvincia) VALUES ('Villa de Maria',1),('Córdoba',1), ('Villa Maria',1);

INSERT INTO usuarios (Nombre, Apellido, Email, Password,CodigoLocalidad,Dni,sEXO,FechaNacimiento,Capacita)
VALUES ('Jorge', 'Bordarampé','jbordarampe@gmail.com','cec4a6dff88d3873da1d9370c6e2911dbeec9e1d',1,28775160,'M','1981-11-22',0);


/*Cargamos  un curso*/
INSERT INTO Cursos (Nombre, Descripcion, Logo, CodigoProfesor,DuracionEnMinutos)
VALUES ('Java para principiantes', 'En este curso se aprenderá desde cero a diseñar utilizando diferentes algoritmos de pseudocódigo y codificar pequeños sistemas. Partiendo desde los conceptos iniciales de programacion, como uso de variables y tipos de dato, aprenderás las estructuras básicas como sentencias condicionales, bucles de repetición, uso de vectores y una introducción a la interfaz gráfica de usuario para desarrollar aplicaciones de escritorio. Al finalizar este curso tendrás los conceptos fundamentales de Programacion para hacer el curso de Java Standard Programming.','logojava.jpg',1,900);
INSERT INTO unidadesporcurso (CodigoCurso, CodigoUnidad, Nombre, Descripcion, Video,Archivo)
VALUES (1,1,'Introducción a Java','¿Qué es Java y para qué sirve? JDK y JVM IDE Sintaxis Bloques y Sentencias Variables (Tipos, Identificación, Declaración y Asignación) Operadores (Matemáticos, de asignación, Relacionales y Lógicos)','videos\javauni','archivos\javauni1.pdf'),
(1,2,'Condicionales','Bifurcación if Bifurcación if else Bifurcaciones anidados Bifurcación Switch Operador Ternario (If reducido)','videos\javauni','archivos\javauni2.pdf'),
(1,3,'Ciclos','while do - while for Sentencia break Sentencia continue','videos\javauni','archivos\javauni3.pdf'),
(1,4,'Arreglos','Introducción Creación Usos Inicialización en la declaración Recorrido del arreglo','videos\javauni','archivos\javauni4.pdf'),
(1,5,'Métodos','Introducción Parámetros y Argumentos. Métodos tipo función. Métodos tipo procedimiento','videos\javauni','archivos\javauni5.pdf');

UPDATE Cursos SET Nombre='Java para no programadores'
WHERE Codigo=1;

UPDATE UnidadesPorCurso SET Video=CONCAT(Video, CodigoUnidad, '.webm')
WHERE CodigoCurso=1;

INSERT INTO Cursos (Nombre, Descripcion, Logo, CodigoProfesor,DuracionEnMinutos)
VALUES ('Python para no programadores', 'En la primera clase del curso se aprenderán cuestiones fundamentales sobre la programación que podrás aplicar en cualquier otro lenguaje en el que te propongas desarrollar en el futuro. Veremos los distintos tipos de aplicaciones que existen y trabajaremos con Python en el diseño de aplicaciones de consola y de escritorio. Las siguientes tres clases se dedicarán al estudio del lenguaje en sí: creación de variables, operaciones lógicas y aritméticas, dirección del flujo de un programa, estructuras de datos y funciones. En la última clase se verá cómo aplicar lo aprendido al desarrollo de aplicaciones de escritorio.','logopython.jpg',1,980);

INSERT INTO Cursos (Nombre, Descripcion, Logo, CodigoProfesor,DuracionEnMinutos)
VALUES ('Fundamentos de Programación con SQL Server 2019', 'Este curso parte desde el inicio del lenguaje SQL explorando toda su estructura, desde la sintaxis básica hasta los aspectos más avanzados del lenguaje como la utilización de Procedimientos Almacenados, Funciones y Desencadenadores. PRÁCTICAS EN CLASE:: En el curso se desarrollan diferentes consultas y programas SQL sobre la base de datos desarrollada. El curso cuenta con una práctica de más de 70 ejercicios de diferentes niveles de complejidad en los cuales se practican todos los aspectos del lenguaje SQL: consultas agrupadas, relaciones (joins), subconsultas, Funciones, Procedimientos Almacenados, Trigger así como, manejo de transacciones, programabilidad, cursores, funciones pívot.','logosql.jpg',1,720);
