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
  cp SMALLINT NOT NULL,
  id_provincia TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id_localidad),
  FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;

# Inserción en la tabla provincia
INSERT INTO provincia 
VALUES
  (1, 'BUENOS AIRES', 'AR-B'),
  (2, 'CATAMARCA', 'AR-K'),
  (3, 'CHACO', 'AR-H'),
  (4, 'CHUBUT', 'AR-U'),
  (5, 'CIUDAD AUTONOMA DE BUENOS AIRES', 'AR-C'),
  (6, 'CORRIENTES', 'AR-W'),
  (7, 'CORDOBA', 'AR-X'),
  (8, 'ENTRE RIOS', 'AR-E'),
  (9, 'FORMOSA', 'AR-P'),
  (10, 'JUJUY', 'AR-Y'),
  (11, 'LA PAMPA', 'AR-L'),
  (12, 'LA RIOJA', 'AR-F'),
  (13, 'MENDOZA', 'AR-M'),
  (14, 'MISIONES', 'AR-N'),
  (15, 'NEUQUEN', 'AR-Q'),
  (16, 'RIO NEGRO', 'AR-R'),
  (17, 'SALTA', 'AR-A'),
  (18, 'SAN JUAN', 'AR-J'),
  (19, 'SAN LUIS', 'AR-D'),
  (20, 'SANTA CRUZ', 'AR-Z'),
  (21, 'SANTA FE', 'AR-S'),
  (22, 'SANTIAGO DEL ESTERO', 'AR-G'),
  (23, 'TIERRA DEL FUEGO', 'AR-V'),
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
