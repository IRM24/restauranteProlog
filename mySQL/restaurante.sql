CREATE DATABASE restaurante;
USE restaurante;

-- falta lo de naturales base en agua o en leche
CREATE TABLE bebida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carbonatadas VARCHAR(100) NOT NULL,
    naturales VARCHAR(100) NOT NULL,
    temperatura VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL
);

CREATE TABLE proteina (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo varchar(50),
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL
);

CREATE TABLE acompannamiento (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL
);

CREATE TABLE postre (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    lacteo VARCHAR(100) NOT NULL,
    frutas VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL
);

-- drop table postre;

-- Inserts Bebidas -------------------------------------------------------------------------------------
INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Agua', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 0);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Coca-cola', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 150);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Sprite', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 130);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Te Negro', 'No', 'Si', 'Caliente', 'Si', 'Si', 'Si', 8);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Café', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 10);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Chocolate', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 180);

-- Inserts Proteinas ---------------------------------------------------------------------------------
INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Filete de res', 'Carnes Rojas', 'No', 'Si', 'Si', 250);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Camarones', 'Mariscos', 'No', 'Si', 'Si', 150);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Pechuga de pollo', 'Pollo', 'No', 'Si', 'Si', 180);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Costilla de cerdo', 'Carnes Rojas', 'No', 'No', 'Si', 300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Salmón', 'Mariscos', 'No', 'No', 'Si', 220);

-- INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
-- VALUES ('Salchicha', 'Cerdo', 'Si', 'No', 'No', 220);

-- Insert Acompannamientos --------------------------------------------------------
INSERT INTO acompannamiento (nombre, desayuno, almuerzo, cena, calorias)
VALUES
    ('Pan tostado', 'Si', 'Si', 'No', 80),
    ('Yogurt', 'Si', 'No', 'Si', 120),
    ('Frutas frescas', 'Si', 'No', 'No', 60);

INSERT INTO acompannamiento (nombre, desayuno, almuerzo, cena, calorias)
VALUES
    ('Arroz blanco', 'No', 'Si', 'Si', 200),
    ('Ensalada mixta', 'No', 'Si', 'Si', 150),
    ('Papas fritas', 'No', 'Si', 'Si', 250);

INSERT INTO acompannamiento (nombre, desayuno, almuerzo, cena, calorias)
VALUES
    ('Sopa de verduras', 'No', 'Si', 'Si', 120),
    ('Brócoli al vapor', 'No', 'Si', 'Si', 50),
    ('Puré de papas', 'No', 'Si', 'Si', 180);
    

-- Inserts de postres -------------------------------------------------
-- seguro que estos son postres?
INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
   ('Yogurt con frutas', 'Si', 'Si','Si', 'No', 'No', 150);
   -- ('Cereal con leche', 'Si', 'No', 'Si', 200),
   -- ('Tostadas con mermelada', 'Si', 'No', 'No', 180);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
    ('Flan de caramelo', 'Si', 'No', 'No', 'Si', 'Si', 250),
    ('Tarta de manzana', 'No', 'Si', 'No', 'Si', 'Si', 300),
    ('Gelatina de frutas', 'No', 'Si', 'Si', 'Si', 'No', 120);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
    ('Helado de vainilla', 'Si', 'No', 'No', 'Si', 'Si', 220),
    ('Pastel de chocolate', 'Si', 'No','No',  'Si', 'Si', 350),
    ('Cheesecake', 'Si', 'No','No', 'Si', 'Si', 310);




