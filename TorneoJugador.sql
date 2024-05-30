CREATE DATABASE torneo;
USE torneo;

CREATE TABLE torneo(
NomTorneo VARCHAR(30) PRIMARY KEY
);
CREATE TABLE jugador(
RangoInicial INT(3),
FIDEID VARCHAR(15),
Nombre VARCHAR (70) NOT NULL,
ELO INT NOT NULL,
Pais VARCHAR(5),
CV BOOLEAN NOT NULL,
Hotel BOOLEAN NOT NULL,
RangoFinal INT(3) UNIQUE,
NomTorneo VARCHAR(30),
PRIMARY KEY (RangoInicial, NomTorneo),
CONSTRAINT fk_jug_torn FOREIGN KEY (NomTorneo) REFERENCES torneo(NomTorneo) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Premio(
NomTorneo VARCHAR(30),
Tipo VARCHAR(30),
Puesto INT(2),
Cantidad INT,
RangoInicial INT(3),
PRIMARY KEY(NomTorneo,Tipo,Puesto),
CONSTRAINT fk_pre_tor FOREIGN KEY (NomTorneo) REFERENCES torneo(NomTorneo) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_pre_jug FOREIGN KEY (RangoInicial) REFERENCES jugador(RangoInicial) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jugadoroptapremio(
NomTorneo VARCHAR(30),
Tipo VARCHAR(30),
RangoInicial INT(3),
PRIMARY KEY(NomTorneo,Tipo, RangoInicial)
);

INSERT INTO torneo VALUES ("OPEN A"), ("OPEN B");

-- Tabla Premio General
INSERT INTO Premio VALUES
('OPEN A','General',1,2300,null),
('OPEN A','General',2,1200,null),
('OPEN A','General',3,650,null),
('OPEN A','General',4,550,null),
('OPEN A','General',5,500,null),
('OPEN A','General',6,400,null),
('OPEN A','General',7,300,null),
('OPEN A','General',8,250,null),
('OPEN A','General',9,200,null),
('OPEN A','General',10,150,null),
('OPEN A','General',11,100,null),
('OPEN A','General',12,100,null);

-- Tabla Premio Com.Valenciana
INSERT INTO Premio VALUES
('OPEN A','Com.Valenciana',1,500,null),
('OPEN A','Com.Valenciana',2,400,null),
('OPEN A','Com.Valenciana',3,300,null),
('OPEN A','Com.Valenciana',4,200,null),
('OPEN A','Com.Valenciana',5,100,null);

-- Tabla Premio SUB 2400
INSERT INTO Premio VALUES
('OPEN A','SUB 2400',1,225,null),
('OPEN A','SUB 2400',2,150,null),
('OPEN A','SUB 2400',3,120,null),
('OPEN A','SUB 2400',4,100,null);

-- Tabla Premio SUB 2200
INSERT INTO Premio VALUES
('OPEN A','SUB 2200',1,150,null),
('OPEN A','SUB 2200',2,100,null);

-- Tabla Alojados A
INSERT INTO Premio VALUES
('OPEN A','Alojados',1,2500,null),
('OPEN A','Alojados',2,2500,null),
('OPEN A','Alojados',3,2500,null),
('OPEN A','Alojados',4,2500,null),
('OPEN A','Alojados',5,2500,null),
('OPEN A','Alojados',6,2500,null),
('OPEN A','Alojados',7,2500,null),
('OPEN A','Alojados',8,2500,null),
('OPEN A','Alojados',9,2500,null),
('OPEN A','Alojados',10,2500,null),
('OPEN A','Alojados',11,2500,null),
('OPEN A','Alojados',12,2500,null),
('OPEN A','Alojados',13,2500,null),
('OPEN A','Alojados',14,2500,null),
('OPEN A','Alojados',15,2500,null),
('OPEN A','Alojados',16,2500,null),
('OPEN A','Alojados',17,2500,null),
('OPEN A','Alojados',18,2500,null),
('OPEN A','Alojados',19,2500,null),
('OPEN A','Alojados',20,2500,null);

-- Tabla Premio General 
INSERT INTO Premio VALUES
('OPEN B','General',1,2300,null),
('OPEN B','General',2,1200,null),
('OPEN B','General',3,650,null),
('OPEN B','General',4,550,null),
('OPEN B','General',5,500,null),
('OPEN B','General',6,400,null),
('OPEN B','General',7,300,null),
('OPEN B','General',8,250,null),
('OPEN B','General',9,200,null),
('OPEN B','General',10,150,null),
('OPEN B','General',11,100,null),
('OPEN B','General',12,100,null);

-- Tabla Premio Com.Valenciana
INSERT INTO Premio VALUES
('OPEN B','Com.Valenciana',1,500,null),
('OPEN B','Com.Valenciana',2,400,null),
('OPEN B','Com.Valenciana',3,300,null),
('OPEN B','Com.Valenciana',4,200,null),
('OPEN B','Com.Valenciana',5,100,null);

-- Tabla Premio SUB 1800
INSERT INTO Premio VALUES
('OPEN B','SUB 1800',1,150,null),
('OPEN B','SUB 1800',2,100,null);

-- Tabla Premio SUB 1600
INSERT INTO Premio VALUES
('OPEN B','SUB 1600',1,150,null),
('OPEN B','SUB 1600',2,100,null);

-- Tabla Premio SUB 1400
INSERT INTO Premio VALUES
('OPEN B','SUB 1400',1,150,null),
('OPEN B','SUB 1400',2,100,null);

-- Tabla Premio Alojados B
INSERT INTO Premio VALUES
('OPEN B','Alojados',1,2500,null),
('OPEN B','Alojados',2,2500,null),
('OPEN B','Alojados',3,2500,null),
('OPEN B','Alojados',4,2500,null),
('OPEN B','Alojados',5,2500,null),
('OPEN B','Alojados',6,2500,null),
('OPEN B','Alojados',7,2500,null),
('OPEN B','Alojados',8,2500,null),
('OPEN B','Alojados',9,2500,null),
('OPEN B','Alojados',10,2500,null),
('OPEN B','Alojados',11,2500,null),
('OPEN B','Alojados',12,2500,null),
('OPEN B','Alojados',13,2500,null),
('OPEN B','Alojados',14,2500,null),
('OPEN B','Alojados',15,2500,null),
('OPEN B','Alojados',16,2500,null),
('OPEN B','Alojados',17,2500,null),
('OPEN B','Alojados',18,2500,null),
('OPEN B','Alojados',19,2500,null),
('OPEN B','Alojados',20,2500,null);


select jugador.nombre,jugadoroptapremio.RangoInicial,group_concat(distinct Tipo) as Tipo , jugadoroptapremio.NomTorneo from jugadoroptapremio join jugador on jugador.RangoInicial = jugadoroptapremio.RangoInicial group by jugadoroptapremio.RangoInicial;
-- SELECT j.RangoInicial, j.Nombre, p.Tipo, p.NomTorneo FROM jugador j JOIN premio p ON j.NomTorneo = p.NomTorneo WHERE (p.NomTorneo = 'OPEN A' AND j.NomTorneo = 'OPEN A') AND (j.CV = true AND p.Tipo = 'Com.Valenciana') GROUP BY p.Tipo, j.Nombre ORDER BY j.RangoInicial;
-- SELECT * FROM jugador;
-- DELIMITER //

-- CREATE FUNCTION PremiosQueOpta(RangoInicial INT) RETURNS VARCHAR(500)
-- BEGIN
    -- DECLARE premios VARCHAR(500);
    
    -- SELECT GROUP_CONCAT(CONCAT(p.Tipo, ' - Puesto ', p.Puesto, ': ', p.Cantidad, ' EUR') SEPARATOR '; ')
    -- INTO premios
    -- FROM jugadoroptapremio jop
    -- JOIN Premio p ON jop.NomTorneo = p.NomTorneo AND jop.Tipo = p.Tipo AND jop.Puesto = p.Puesto
    -- WHERE jop.RangoInicial = RangoInicial;
    
    -- RETURN premios;
-- END //
-- SELECT PremiosQueOpta(2)//
-- DROP FUNCTION MostrarTipo//
-- CREATE FUNCTION MostrarTipo(CatTipo VARCHAR(1000)) RETURNS TEXT
-- BEGIN
    -- DECLARE v_tipo TEXT;
    -- SELECT GROUP_CONCAT(result SEPARATOR '|||') INTO v_tipo
    -- FROM (
        -- SELECT DISTINCT CONCAT(j.RangoInicial, ' ', j.Nombre, ' ', p.Tipo, ' ', p.NomTorneo) AS result
       --  FROM jugador j 
        -- JOIN Premio p ON j.NomTorneo = p.NomTorneo
        -- WHERE p.Tipo = CatTipo
        -- GROUP BY j.RangoInicial, j.Nombre, p.Tipo, p.NomTorneo
        -- ORDER BY j.RangoInicial
   -- ) AS grouped_results;
    -- RETURN v_tipo;
-- END//

-- SELECT REPLACE(MostrarTipo('Com.Valenciana'), '|||', '\n') AS Result//



