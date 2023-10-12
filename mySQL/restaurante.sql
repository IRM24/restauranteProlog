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
    temperatura VARCHAR(100) NOT NULL,
    carbohidratos VARCHAR(100) NOT NULL,
    vegetales VARCHAR(100) NOT NULL,
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

-- drop table acompannamiento;

-- Inserts Bebidas -------------------------------------------------------------------------------------
INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Jugo de Naranja', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 110);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Café', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 10);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Chocolate', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 180);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Coca-cola', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 150);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Sprite', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 130);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Te Negro', 'No', 'Si', 'Caliente', 'Si', 'Si', 'Si', 8);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Limonada con Hierbabuena', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 115);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Dr.Pepper', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 170);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias)
VALUES ('Agua', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 0);

-- Inserts Proteinas ---------------------------------------------------------------------------------
INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Salchichas', 'Carnes Rojas', 'Si', 'No', 'No', 210);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Tocineta', 'Carnes Rojas', 'Si', 'No', 'No', 180);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Jamon', 'Carnes Rojas', 'Si', 'No', 'No', 165);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Filete de res', 'Carnes Rojas', 'No', 'Si', 'Si', 250);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Camarones', 'Mariscos', 'No', 'Si', 'Si', 150);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Pechuga de pollo', 'Pollo', 'No', 'Si', 'Si', 180);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Costilla de cerdo', 'Carnes Rojas', 'No', 'Si', 'Si', 300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Salmón Ahumado', 'Mariscos', 'No', 'No', 'Si', 220);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias)
VALUES ('Pollo Frito', 'Pollo', 'No', 'Si', 'Si', 310);


-- Insert Acompannamientos --------------------------------------------------------

INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias)
VALUES
    ('Pan tostado', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 85),
    ('Frutas Frescas', 'Frio', 'Si', 'No', 'Si', 'No', 'No', 50),
    ('Pancakes', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 100);

INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias)
VALUES
    ('Arroz blanco','Caliente', 'Si', 'No', 'No', 'Si', 'Si', 190),
    ('Pasta Pesto','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 220),
	('Pure de papa','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 160),
    ('Tofu Salteado','Caliente', 'No', 'No', 'No', 'Si', 'Si', 140),
    ('Hummus','Frio', 'Si', 'No', 'No', 'Si', 'Si', 175),
    ('Ensalada Verde','Frio', 'No', 'Si', 'No', 'Si', 'Si', 80),
    ('Ensalada Cesar','Frio', 'No', 'Si', 'No', 'Si', 'Si', 130);

-- select * from postre;
-- delete from acompannamiento;
-- Inserts de postres -------------------------------------------------
INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
   ('Yogurt con frutas', 'Si', 'Si','Si', 'No', 'No', 150),
   ('Tostadas Francesas', 'No', 'Si','Si', 'Si', 'No', 190),
   ('Crepa con fresas', 'No', 'Si','Si', 'Si', 'Si', 250);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
    ('Flan de caramelo', 'Si', 'No', 'No', 'Si', 'Si', 250),
    ('Tarta de manzana', 'No', 'Si', 'No', 'Si', 'Si', 300),
    ('Gelatina de frutas', 'No', 'Si', 'Si', 'Si', 'No', 120);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias)
VALUES
    ('Helado de vainilla', 'Si', 'No', 'No', 'Si', 'Si', 220),
    ('Pastel de chocolate', 'Si', 'No','No',  'Si', 'Si', 350),
    ('Gelato', 'No', 'No','No',  'Si', 'Si', 110),
    ('Cheesecake', 'Si', 'No','No', 'Si', 'Si', 310);


delete from bebida;
delete from proteina;
delete from acompannamiento;
delete from postre;

