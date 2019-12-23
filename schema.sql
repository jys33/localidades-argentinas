# var_dump(strlen('Tierra del Fuego, Antártida e Islas del Atlántico Sur')); int(55) => varchar (60)

# https://www.correoargentino.com.ar/formularios/cpa
# CPA => B1636FDA 8 caracteres

CREATE DATABASE codigo_postal CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE codigo_postal ;

CREATE TABLE provincia (
  id_provincia TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR (50) NOT NULL,
  codigo_3166_2 CHAR(4) NOT NULL,
  PRIMARY KEY (id_provincia),
  UNIQUE INDEX (codigo_3166_2)
) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;

CREATE TABLE localidad (
  id_localidad INT UNSIGNED NOT NULL,
  nombre VARCHAR (50) NOT NULL,
  cp CHAR(8) NOT NULL,
  id_provincia TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id_localidad),
  FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;


# Inserción en la tabla provincia
INSERT INTO provincia 
VALUES
  (1, 'BUENOS AIRES', 'AR-B') ;

INSERT INTO provincia 
VALUES
  (2, 'CATAMARCA', 'AR-K') ;

INSERT INTO provincia 
VALUES
  (3, 'CHACO', 'AR-H') ;

INSERT INTO provincia 
VALUES
  (4, 'CHUBUT', 'AR-U') ;

INSERT INTO provincia 
VALUES
  (5, 'CIUDAD AUTONOMA DE BUENOS AIRES', 'AR-C') ;

INSERT INTO provincia 
VALUES
  (6, 'CORRIENTES', 'AR-W') ;

INSERT INTO provincia 
VALUES
  (7, 'CORDOBA', 'AR-X') ;

INSERT INTO provincia 
VALUES
  (8, 'ENTRE RIOS', 'AR-E') ;

INSERT INTO provincia 
VALUES
  (9, 'FORMOSA', 'AR-P') ;

INSERT INTO provincia 
VALUES
  (10, 'JUJUY', 'AR-Y') ;

INSERT INTO provincia 
VALUES
  (11, 'LA PAMPA', 'AR-L') ;

INSERT INTO provincia 
VALUES
  (12, 'LA RIOJA', 'AR-F') ;

INSERT INTO provincia 
VALUES
  (13, 'MENDOZA', 'AR-M') ;

INSERT INTO provincia 
VALUES
  (14, 'MISIONES', 'AR-N') ;

INSERT INTO provincia 
VALUES
  (15, 'NEUQUEN', 'AR-Q') ;

INSERT INTO provincia 
VALUES
  (16, 'RIO NEGRO', 'AR-R') ;

INSERT INTO provincia 
VALUES
  (17, 'SALTA', 'AR-A') ;

INSERT INTO provincia 
VALUES
  (18, 'SAN JUAN', 'AR-J') ;

INSERT INTO provincia 
VALUES
  (19, 'SAN LUIS', 'AR-D') ;

INSERT INTO provincia 
VALUES
  (20, 'SANTA CRUZ', 'AR-Z') ;

INSERT INTO provincia 
VALUES
  (21, 'SANTA FE', 'AR-S') ;

INSERT INTO provincia 
VALUES
  (22, 'SANTIAGO DEL ESTERO', 'AR-G') ;

INSERT INTO provincia 
VALUES
  (23, 'TIERRA DEL FUEGO', 'AR-V') ;

INSERT INTO provincia 
VALUES
  (24, 'TUCUMAN', 'AR-T') ;


SELECT 
  COUNT(*) 
FROM
  localidad ;

SELECT 
  nombre,
  LENGTH(nombre) 
FROM
  localidad 
WHERE LENGTH(nombre) > 30 ;