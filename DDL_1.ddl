-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-13 21:32:06 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativas (
    id_alternativa  INTEGER NOT NULL,
    descripcion     VARCHAR2(100),
    es_correcta     CHAR(1),
    valor_pregunta  INTEGER
);

ALTER TABLE alternativas ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_alternativa );

CREATE TABLE cursos (
    id_curso                    INTEGER NOT NULL,
    especialidad                VARCHAR2(50),
    anio_ingreso                DATE,
    alumnos                     INTEGER,
    institucion                 INTEGER,
    institucion_id_institucion  INTEGER NOT NULL
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_curso );

CREATE TABLE estudiantes (
    id_estudiante    INTEGER NOT NULL,
    nombre           VARCHAR2(50),
    rut              VARCHAR2(15),
    especialidad     VARCHAR2(50),
    evaluaciones     VARCHAR2(50),
    cursos_id_curso  INTEGER
);

ALTER TABLE estudiantes ADD CONSTRAINT estudiantes_pk PRIMARY KEY ( id_estudiante );

CREATE TABLE institucion (
    id_institucion  INTEGER NOT NULL,
    nombre          VARCHAR2(50),
    direccion       VARCHAR2(100),
    fono            VARCHAR2(11),
    director        VARCHAR2(50)
);

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( id_institucion );

CREATE TABLE preguntas (
    id_pregunta           INTEGER NOT NULL,
    entity_5_entity_5_id  NUMBER NOT NULL,
    enunciado             VARCHAR2(200),
    puntaje               INTEGER,
    id_test1              INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta );

CREATE TABLE relation_4 (
    test_id_test               INTEGER NOT NULL,
    estudiantes_id_estudiante  INTEGER NOT NULL
);

ALTER TABLE relation_4 ADD CONSTRAINT relation_4_pk PRIMARY KEY ( test_id_test,
                                                                  estudiantes_id_estudiante );

CREATE TABLE relation_9 (
    test_id_test                    INTEGER NOT NULL,
    test_aux_preguntas_id_pregunta  INTEGER NOT NULL,
    test_aux_id_test                INTEGER NOT NULL
);

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_pk PRIMARY KEY ( test_id_test,
                                               test_aux_preguntas_id_pregunta,
                                               test_aux_id_test );

CREATE TABLE respuestas_aux (
    preguntas_id_pregunta        INTEGER NOT NULL,
    alternativas_id_alternativa  INTEGER NOT NULL
);

CREATE TABLE test (
    id_test         INTEGER NOT NULL,
    nombre          VARCHAR2(50),
    descripcion     VARCHAR2(100),
    programa        VARCHAR2(80),
    unidad          VARCHAR2(50),
    autor           VARCHAR2(50),
    fecha_creacion  DATE
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

CREATE TABLE test_aux (
    id_test                INTEGER NOT NULL,
    preguntas_id_pregunta  INTEGER NOT NULL
);

ALTER TABLE test_aux ADD CONSTRAINT test_aux_pk PRIMARY KEY ( id_test,
                                                              preguntas_id_pregunta );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_institucion_fk FOREIGN KEY ( institucion_id_institucion )
        REFERENCES institucion ( id_institucion );

ALTER TABLE estudiantes
    ADD CONSTRAINT estudiantes_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_estudiantes_fk FOREIGN KEY ( estudiantes_id_estudiante )
        REFERENCES estudiantes ( id_estudiante );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_test_aux_fk FOREIGN KEY ( test_aux_id_test,
                                                        test_aux_preguntas_id_pregunta )
        REFERENCES test_aux ( id_test,
                              preguntas_id_pregunta );

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE respuestas_aux
    ADD CONSTRAINT respuestas_aux_alternativas_fk FOREIGN KEY ( alternativas_id_alternativa )
        REFERENCES alternativas ( id_alternativa );

ALTER TABLE respuestas_aux
    ADD CONSTRAINT respuestas_aux_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta )
        REFERENCES preguntas ( id_pregunta );

ALTER TABLE test_aux
    ADD CONSTRAINT test_aux_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta )
        REFERENCES preguntas ( id_pregunta );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
