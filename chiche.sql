drop database chichebombon;
CREATE DATABASE IF NOT EXISTS chichebombon
    CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;
USE chichebombon;

create table I_Modelo(
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_modelo VARCHAR(100) NOT NULL UNIQUE
);

create table I_ano(
    id_ano INT PRIMARY KEY AUTO_INCREMENT,
    ano INT NOT NULL UNIQUE
);

create table I_region(
    id_region INT PRIMARY KEY AUTO_INCREMENT,
    nombre_region VARCHAR(100) NOT NULL UNIQUE
);

create table I_color(
    id_color INT PRIMARY KEY AUTO_INCREMENT,
    nombre_color VARCHAR(50) NOT NULL UNIQUE
);

create table I_tipo_combustible(
    id_tipo_combustible INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_combustible VARCHAR(50) NOT NULL UNIQUE
);

create table I_transmision(
    id_transmision INT PRIMARY KEY AUTO_INCREMENT,
    nombre_transmision VARCHAR(50) NOT NULL UNIQUE
);

create table I_ltsMotor(
    id_ltsMotor INT PRIMARY KEY AUTO_INCREMENT,
    ltsMotor DECIMAL(6,2) NOT NULL UNIQUE
);

create table Master ( 
        id_master INT PRIMARY KEY AUTO_INCREMENT,
        fk_id_modelo INT,
        fk_id_ano INT,
        fk_id_region INT,
        fk_id_color INT,
        fk_id_tipo_combustible INT,
        fk_id_transmision INT,
        fk_id_ltsMotor INT,
        precio DECIMAL(12,2) NOT NULL,
        ventas INT NOT NULL,
        FOREIGN KEY (fk_id_modelo) REFERENCES I_Modelo(id_modelo),
        FOREIGN KEY (fk_id_ano) REFERENCES I_ano(id_ano),
        FOREIGN KEY (fk_id_region) REFERENCES I_region(id_region),
        FOREIGN KEY (fk_id_color) REFERENCES I_color(id_color),
        FOREIGN KEY (fk_id_tipo_combustible) REFERENCES I_tipo_combustible(id_tipo_combustible),
        FOREIGN KEY (fk_id_transmision) REFERENCES I_transmision(id_transmision),
        FOREIGN KEY (fk_id_ltsMotor) REFERENCES I_ltsMotor(id_ltsMotor)
);

-- ================================
START TRANSACTION;

-- Insertar valores únicos en dimensiones (alternativa a INSERT IGNORE si no quieres UNIQUEs)
INSERT INTO I_Modelo (nombre_modelo)
SELECT DISTINCT TRIM(s.Model) 
FROM staging_cars s
LEFT JOIN I_Modelo m ON m.nombre_modelo = TRIM(s.Model)
WHERE m.id_modelo IS NULL AND TRIM(s.Model) <> '';

INSERT INTO I_ano (ano)
SELECT DISTINCT s.Year
FROM staging_cars s
LEFT JOIN I_ano a ON a.ano = s.Year
WHERE a.id_ano IS NULL AND s.Year IS NOT NULL;

INSERT INTO I_region (nombre_region)
SELECT DISTINCT TRIM(s.Region)
FROM staging_cars s
LEFT JOIN I_region r ON r.nombre_region = TRIM(s.Region)
WHERE r.id_region IS NULL AND TRIM(s.Region) <> '';

INSERT INTO I_color (nombre_color)
SELECT DISTINCT TRIM(s.Color)
FROM staging_cars s
LEFT JOIN I_color c ON c.nombre_color = TRIM(s.Color)
WHERE c.id_color IS NULL AND TRIM(s.Color) <> '';

INSERT INTO I_tipo_combustible (nombre_tipo_combustible)
SELECT DISTINCT TRIM(s.Fuel_Type)
FROM staging_cars s
LEFT JOIN I_tipo_combustible f ON f.nombre_tipo_combustible = TRIM(s.Fuel_Type)
WHERE f.id_tipo_combustible IS NULL AND TRIM(s.Fuel_Type) <> '';

INSERT INTO I_transmision (nombre_transmision)
SELECT DISTINCT TRIM(s.Transmission)
FROM staging_cars s
LEFT JOIN I_transmision t ON t.nombre_transmision = TRIM(s.Transmission)
WHERE t.id_transmision IS NULL AND TRIM(s.Transmission) <> '';

INSERT INTO I_ltsMotor (ltsMotor)
SELECT DISTINCT CAST(s.Engine_Size_L AS DECIMAL(6,2))
FROM staging_cars s
LEFT JOIN I_ltsMotor l ON l.ltsMotor = CAST(s.Engine_Size_L AS DECIMAL(6,2))
WHERE l.id_ltsMotor IS NULL AND s.Engine_Size_L IS NOT NULL AND TRIM(s.Engine_Size_L) <> '';

-- Población final de Master (usa JOINs para obtener FK)
INSERT INTO Master (
    fk_id_modelo,
    fk_id_ano,
    fk_id_region,
    fk_id_color,
    fk_id_tipo_combustible,
    fk_id_transmision,
    fk_id_ltsMotor,
    precio,
    ventas
)
SELECT
    mo.id_modelo,
    an.id_ano,
    re.id_region,
    co.id_color,
    fu.id_tipo_combustible,
    tr.id_transmision,
    lt.id_ltsMotor,
    CAST(s.Price_USD AS DECIMAL(12,2)),
    CAST(s.Sales_Volume AS SIGNED)
FROM staging_cars s
JOIN I_Modelo mo ON mo.nombre_modelo = TRIM(s.Model)
JOIN I_ano an ON an.ano = s.Year
JOIN I_region re ON re.nombre_region = TRIM(s.Region)
JOIN I_color co ON co.nombre_color = TRIM(s.Color)
JOIN I_tipo_combustible fu ON fu.nombre_tipo_combustible = TRIM(s.Fuel_Type)
JOIN I_transmision tr ON tr.nombre_transmision = TRIM(s.Transmission)
JOIN I_ltsMotor lt ON lt.ltsMotor = CAST(s.Engine_Size_L AS DECIMAL(6,2));

COMMIT;

drop table staging_cars;
USE chichebombon;
CREATE TABLE IF NOT EXISTS staging_cars (
  Model VARCHAR(100),
  Year INT,
  Region VARCHAR(100),
  Color VARCHAR(50),
  Fuel_Type VARCHAR(50),
  Transmission VARCHAR(50),
  Engine_Size_L DECIMAL(6,2),
  Price_USD DECIMAL(10,2),
  Sales_Volume INT
);
LOAD DATA LOCAL INFILE 'C:/Users/FRANCISCO/Desktop/ucc/BD2/proyecto_muy_homosensual/CSVs/cars_modified.csv'
INTO TABLE staging_cars
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Model,Year,Region,Color,Fuel_Type,Transmission,Engine_Size_L,Price_USD,Sales_Volume);


SELECT * FROM staging_cars LIMIT 10;