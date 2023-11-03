-- SQL proyecto 2 
-- Ian Calvo Madrigal y Camila Ulate Chaves

CREATE DATABASE restaurante;
USE restaurante;

-- Creacion Tablas ---------------------

CREATE TABLE bebida
 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carbonatadas VARCHAR(100) NOT NULL,
    naturales VARCHAR(100) NOT NULL,
    temperatura VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE proteina (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo varchar(50),
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
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
    calorias INT NOT NULL,
    precio INT NOT NULL
);
CREATE TABLE postre (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    lacteo VARCHAR(100) NOT NULL,
    frutas VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE plato (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    proteina VARCHAR(100) NOT NULL,
	acompannamiento1 VARCHAR(100),
	acompannamiento2 VARCHAR(100),
	acompannamiento3 VARCHAR(100),
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE combo (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    proteina VARCHAR(100) NOT NULL,
	acompannamiento1 VARCHAR(100),
	acompannamiento2 VARCHAR(100),
	acompannamiento3 VARCHAR(100),
    bebida VARCHAR(100) NOT NULL,
    postre VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE factura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    monto_total DOUBLE
);

CREATE TABLE orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    detalle VARCHAR(250)
);

-- Inserts de Totas las Tablas ----------------------------

-- Inserts Bebidas -------------------------------------------------------------------------------------
INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jugo de Naranja', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 110, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Café', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 10, 1500);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Chocolate', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 180, 1600);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Batido de Chocolate', 'No', 'No', 'Fria', 'Si', 'No', 'No', 170, 2000);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Batido de Vainilla', 'No', 'No', 'Fria', 'Si', 'No', 'No', 130, 2000);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Coca-cola', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 150,1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Sprite', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 130, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Te Negro', 'No', 'Si', 'Caliente', 'Si', 'Si', 'Si', 8, 1500);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Limonada con Hierbabuena', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 115, 2200);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Dr.Pepper', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 170, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Agua', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 0, 0);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Agua con gas', 'Si', 'Si', 'Fria', 'Si', 'Si', 'Si', 0, 1400);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jugo de Arandanos', 'No', 'Si', 'Fria', 'Si', 'Si', 'No', 110, 1800);

-- Inserts Proteinas ---------------------------------------------------------------------------------
INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Salchichas', 'Carnes Rojas', 'Si', 'No', 'No', 210, 1750);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Tocineta', 'Carnes Rojas', 'Si', 'No', 'No', 180, 2100);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pepperoni', 'Carnes Rojas', 'Si', 'No', 'No', 195, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jamon de Pavo', 'Carnes Rojas', 'Si', 'No', 'No', 175, 1200);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jamon de Pollo', 'Carnes Rojas', 'Si', 'No', 'No', 135, 1200);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Atun', 'Mariscos', 'Si', 'Si', 'No', 210, 2600);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Filete de res', 'Carnes Rojas', 'No', 'Si', 'Si', 250, 2800);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Camarones', 'Mariscos', 'No', 'Si', 'Si', 150, 3100);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pechuga de Pollo', 'Pollo', 'No', 'Si', 'Si', 180, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Albondigas', 'Carnes Rojas', 'No', 'Si', 'Si', 180, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Costilla de cerdo', 'Carnes Rojas', 'No', 'Si', 'Si', 300, 3000);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Salmón Ahumado', 'Mariscos', 'No', 'No', 'Si', 220, 3600);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pollo Frito', 'Pollo', 'No', 'Si', 'Si', 310, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pierna de Cordero', 'Carnes Rojas', 'No', 'Si', 'Si', 290, 3400);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Langosta', 'Mariscos', 'No', 'Si', 'Si', 270, 3500);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Chorizo', 'Carnes Rojas', 'Si', 'Si', 'No', 300, 200);

-- Delete from proteina;
SELECT * FROM proteina;

-- Insert Acompannamientos --------------------------------------------------------
INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Pan tostado', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 85, 750),
    ('Huevos', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 95, 800),
    ('Omelet', 'Caliente', 'Si', 'Si', 'Si', 'No', 'No', 105, 1300),
    ('Waffles', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 100, 1800),
    ('Avena', 'Frio', 'Si', 'No', 'Si', 'No', 'No', 90, 900),
    ('Frutas Frescas', 'Frio', 'Si', 'No', 'Si', 'No', 'No', 50, 1250),
    ('Porcion Frutos Rojos','Frio', 'Si', 'No', 'Si', 'Si', 'No', 70, 1500),
    ('Queso', 'Frio', 'No', 'No', 'Si', 'No', 'No', 80, 950),
    ('Croissants', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 180, 1000),
    ('Pancakes', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 100, 1800);

INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Arroz blanco','Caliente', 'Si', 'No', 'Si', 'Si', 'Si', 190, 1200),
    ('Frijoles','Caliente', 'Si', 'No', 'Si', 'Si', 'No', 160, 1200),
    ('Foccacia','Caliente', 'Si', 'No', 'Si', 'Si', 'Si', 180, 1400),
    ('Arroz integral','Caliente', 'Si', 'No', 'Si', 'Si', 'Si', 160, 1200),
    ('Papas Fritas','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 230, 1400),
    ('Hongos Salteados','Caliente', 'NO', 'Si', 'No', 'Si', 'Si', 110, 1500),
    ('Pasta Pesto','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 220, 2000),
    ('Pasta Pomodoro','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 230, 1800),
    ('Pasta en Salsa Blanca', 'Caliente', 'Si', 'No', 'No', 'Si', 'Si', 210, 2000),
	('Pure de papa','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 160, 1500),
    ('Tofu Salteado','Caliente', 'No', 'No', 'No', 'Si', 'Si', 140, 2500),
    ('Berenjenas a la parrilla','Caliente', 'No', 'Si', 'No', 'Si', 'Si', 130, 1750),
    ('Hummus','Frio', 'Si', 'No', 'No', 'Si', 'Si', 175, 2500),
    ('Crema de Ayote', 'Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 120, 1200),
    ('Ensalada Verde','Frio', 'No', 'Si', 'No', 'Si', 'Si', 80, 2100),
    ('Ensalada de Pasta','Frio', 'Si', 'No', 'No', 'Si', 'Si', 150, 2300),
    ('Ensalada Cesar','Frio', 'No', 'Si', 'No', 'Si', 'Si', 130, 2600),
    ('Ensalada de Garbanzos','Frio', 'Si', 'Si', 'No', 'Si', 'Si', 110, 2500);

-- Inserts de postres -------------------------------------------------
INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
   ('Yogurt con frutas', 'Si', 'Si','Si', 'No', 'No', 150, 1500),
   ('Tostadas Francesas', 'No', 'Si','Si', 'Si', 'No', 190, 2100),
   ('Muffins con Arandanos', 'Si', 'Si','Si', 'Si', 'No', 200, 1500),
   ('Muffins de Vainilla', 'Si', 'No','Si', 'Si', 'No', 170, 1200),
   ('Tartaleta de Frambuesa', 'Si', 'Si','Si', 'Si', 'Si', 210, 1700),
   ('Galletas de Avena', 'No', 'No','Si', 'No', 'No', 100, 800),
   ('Galletas con Chocolate', 'No', 'No','Si', 'No', 'No', 150, 950),
   ('Crepa con fresas', 'No', 'Si','Si', 'Si', 'Si', 250, 2500);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Flan de caramelo', 'Si', 'No', 'No', 'Si', 'Si', 250, 2100),
    ('Tarta de manzana', 'No', 'Si', 'No', 'Si', 'Si', 300, 2500),
    ('Gelatina de frutas', 'No', 'Si', 'Si', 'Si', 'No', 120, 1500),
    ('Torta Chilena', 'Si', 'No', 'No', 'Si', 'No', 210, 1700);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Helado de vainilla', 'Si', 'No', 'No', 'Si', 'Si', 220, 1100),
    ('Pastel de chocolate', 'Si', 'No','No',  'Si', 'Si', 350, 2500),
    ('Pie de Limon', 'Si', 'Si','No',  'Si', 'Si', 270, 2200),
    ('Tiramisu', 'Si', 'No','No',  'Si', 'Si', 250, 2300),
    ('Mousse de chocolate', 'Si', 'No','No',  'Si', 'Si', 320, 2200),
    ('Gelato', 'No', 'No','No',  'Si', 'Si', 110, 2200),
    ('Cheesecake', 'Si', 'No','No', 'Si', 'Si', 310, 2500);
    
   
-- Insert platos ------------------------------
INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 1','Salmón Ahumado', 'Ensalada Verde', 'Arroz blanco', 'Pasta Pesto',510, 7500);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 2','Filete de res', 'Pure de papa', 'Ensalada Cesar','Tofu Salteado',600, 6000);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 3','Tocineta', 'Pan tostado', 'Frutas Frescas','Pancakes', 480, 4500);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 4','Pollo Frito', 'Pure de papa', 'Arroz blanco','Ensalada Verde', 620, 5800);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 5','Pechuga de Pollo', 'Crema de Ayote', 'Arroz integral','Ensalada de Garbanzos', 7500, 7800);

-- Insert combos -------------------

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 1','Costilla de cerdo', 'Ensalada Cesar', 'Hummus', 'Tofu Salteado', 'Coca-cola','Flan de Caramelo', 800, 8500);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 2','Salchichas', 'Pancakes','Frutas Frescas', 'Pan tostado','Jugo de Naranja','Tostadas Francesas', 570, 7500);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 3','Pierna de Cordero', 'Berenjenas a la parrilla','Ensalada de Garbanzos', 'Arroz Integral','Limonada con Hierbabuena','Cheesecake', 860, 7000);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 4','Jamon de Pavo', 'Waffles','Omelet', 'Queso','Jugo de Arandanos','Galletas de Avena', 520, 6800);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 5','Atun', 'Hummus','Arroz Blanco', 'Pasta Pesto','Agua','Tiramisu', 880, 7250);


-- Insert Factura -----------------------------
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-9', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-15', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-15', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-29', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-1', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-17', 16500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-28', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-2', 3500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-8', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-20', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-29', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-4-2', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-4-17', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-7', 5500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-3', 45000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-20', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-10', 5500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-16', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-22', 40000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-28', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-28', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-6-1', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-6-20', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-2', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-14', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-17', 23000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-29', 34000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-5', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-14', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-23', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-1', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-10', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-18', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-28', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-1', 11000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-1', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-21', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-3', 29000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-15', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-28', 19000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-1', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-7', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-25', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-3', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-19', 25000.0);

INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-1', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-15', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-15', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-28', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-9', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-12', 16500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-28', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-2', 9500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-9', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-20', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-29', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-4-2', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-4-15', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-7', 5500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-13', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-21', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-21', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-28', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-6-2', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-6-17', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-1', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-14', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-17', 23000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-28', 34000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-1', 23000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-5', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-14', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-23', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-4', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-10', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-18', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-28', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-1', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-7', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-21', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-28', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-24', 5600.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-26', 21000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-30', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-22', 32000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-8', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-22', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-30', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-11-1', 34000.0);

-- Insert orden --------------------------
INSERT INTO orden (fecha, detalle) VALUES ('2022-1-1', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-2-21', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-3-2', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Proteina: Pollo");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Acompannamiento: Arroz blanco");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Bebida: Agua");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Postre: Pie de Limon");
INSERT INTO orden (fecha, detalle) VALUES ('2022-7-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-8-6', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Proteina: Pollo");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Acompannamiento: Arroz blanco");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Bebida: Agua");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Postre: Pie de Limon");
INSERT INTO orden (fecha, detalle) VALUES ('2022-4-9', "Nombre:'Plato Fuerte 2', Filete de res', Pure de papa', Ensalada Cesar', Tofu Salteado' Calorias:, 600 Precio:, 6000");
INSERT INTO orden (fecha, detalle) VALUES ('2022-5-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-6-10', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-8', "Proteina: Pollo Asado");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-8', "Acompannamiento: Arroz Integral");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-8', "Bebida: Dr.Pepper");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-8', "Postre: Pie de Limon");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-9', "Nombre:'Plato Fuerte 2', Filete de res', Pure de papa', Ensalada Cesar', Tofu Salteado' Calorias:, 600 Precio:, 6000");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-10', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-8', "Proteina: Pollo Asado");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-8', "Acompannamiento: Arroz Blanco");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-8', "Bebida: Dr.Pepper");
INSERT INTO orden (fecha, detalle) VALUES ('2022-12-8', "Postre: Pie de Limon");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-22', "Proteina: Atun");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-22', "Acompannamiento: Ensalada Verde");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-22', "Bebida: Agua");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-22', "Postre: Galletas de Avena");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-28', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");

INSERT INTO orden (fecha, detalle) VALUES ('2023-1-1', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-1-1', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-2-1', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-2-21', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-2-6', "Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-5', "Proteina: Tocineta");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-5', "Acompannamiento: Pancakes");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-5', "Bebida: Agua");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-5', "Postre: Tostadas Francesas");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-6', "Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-5-8', "Nombre:'Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-7-20', "Proteina: Pollo Asado");
INSERT INTO orden (fecha, detalle) VALUES ('2023-7-20', "Acompannamiento: Pure de papa");
INSERT INTO orden (fecha, detalle) VALUES ('2023-7-20', "Bebida: Te Negro");
INSERT INTO orden (fecha, detalle) VALUES ('2023-7-20', "Postre: Cheesecake");
INSERT INTO orden (fecha, detalle) VALUES ('2022-8-25', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-5', "Proteina: Pollo Frito");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-5', "Acompannamiento: Hongos Salteados");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-5', "Bebida: Limonada con Hierbabuena");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-5', "Postre: Gelato");
INSERT INTO orden (fecha, detalle) VALUES ('2023-6-22', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-8-3', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-30', "Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-1', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-20', "Nombre:'Plato Fuerte 2', Filete de res', Pure de papa', Ensalada Cesar', Tofu Salteado' Calorias:, 600 Precio:, 6000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-7-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-23', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-5-22', "Proteina: Salchichas");
INSERT INTO orden (fecha, detalle) VALUES ('2023-5-22', "Acompannamiento: Ensalada Verde");
INSERT INTO orden (fecha, detalle) VALUES ('2023-5-22', "Bebida: Limonada con Hierbabuena");
INSERT INTO orden (fecha, detalle) VALUES ('2022-6-1', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-6', "Postre: Cheesecake");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-6', "Proteina: Pollo Frito");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-6', "Acompannamiento: Hongos Salteados");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-6', "Bebida: Limonada con Hierbabuena");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-6', "Postre: Gelato");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-20', "Proteina: Atun");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-20', "Acompannamiento: Pasta Pesto");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-20', "Bebida: Sprite");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-20', "Postre: Galletas de Avena");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-25', "Proteina: Salchichas");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-25', "Acompannamiento: Ensalada Verde");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-25', "Bebida: Limonada con Hierbabuena");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-25', "Postre: Cheesecake");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-11-1', "Proteina: Jamon de Pavo");
INSERT INTO orden (fecha, detalle) VALUES ('2023-11-1', "Acompannamiento: Frijoles");
INSERT INTO orden (fecha, detalle) VALUES ('2023-11-1', "Bebida: Jugo de Naranja");
INSERT INTO orden (fecha, detalle) VALUES ('2023-11-1', "Postre: Galletas de Chocolate");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-10-23', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-30', "Nombre:'Plato Fuerte 2', Filete de res', Pure de papa', Ensalada Cesar', Tofu Salteado' Calorias:, 600 Precio:, 6000");
INSERT INTO orden (fecha, detalle) VALUES ('2022-11-1', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-31', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");

-- Funcion para obtener el nombre de un producto y calorias
DELIMITER //

CREATE PROCEDURE BuscarProductoPorNombre(IN nombreProducto VARCHAR(100))
BEGIN
    SELECT nombre, calorias
    FROM bebida
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM proteina
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM acompannamiento
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM postre
    WHERE nombre = nombreProducto;
END //

DELIMITER ;

-- Procedimientos almacenados para los CRUD de elmentos -----------

-- CRUD Bebidas --------------------------
-- Creacion de una bebida
DELIMITER //
CREATE PROCEDURE crear_bebida(
    IN nombre VARCHAR(100),
    IN carbonatadas VARCHAR(100),
    IN naturales VARCHAR(100),
    IN temperatura VARCHAR(100),
    IN desayuno VARCHAR(100),
    IN almuerzo VARCHAR(100),
    IN cena VARCHAR(100),
    IN calorias INT,
    IN precio INT
)
BEGIN
    INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
    VALUES (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio);
END //
DELIMITER ;

-- Lectura Bebidas
DELIMITER //
CREATE PROCEDURE leer_bebida()
BEGIN
    SELECT * FROM bebida;
END //
DELIMITER ;

-- Actualizar Bebidas
DELIMITER //
CREATE PROCEDURE actualizar_precio_bebida_nombre(
    IN bebida_nombre VARCHAR(50),
    IN nuevo_precio INT
)
BEGIN
    UPDATE bebida SET precio = nuevo_precio WHERE nombre = bebida_nombre;
END //
DELIMITER ;

-- Eliminar Bebidas 
DELIMITER //
CREATE PROCEDURE eliminar_bebida_nombre(
    IN bebida_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM bebida WHERE nombre = bebida_nombre;
END //
DELIMITER ;
select * from bebida;

-- CRUD Proteinas --------------------

-- Creacion Proteinas
DELIMITER //
CREATE PROCEDURE crear_proteina(
    IN p_nombre VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_tipo, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;

-- Lectura Proteinas
DELIMITER //

CREATE PROCEDURE leer_proteina()
BEGIN
    SELECT * FROM proteina;
END//

DELIMITER ;

-- Actualizar Proteinas
DELIMITER //

CREATE PROCEDURE actualizar_proteina_nombre(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE proteina
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- Eliminar proteinas
DELIMITER //

CREATE PROCEDURE eliminar_proteina_nombre(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM proteina
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- CRUD Acompannamientos ----------------

-- Crear acompannamiento
DELIMITER //

CREATE PROCEDURE crear_acompannamiento(
    IN p_nombre VARCHAR(100),
    IN p_temperatura VARCHAR(100),
    IN p_carbohidratos VARCHAR(100),
    IN p_vegetales VARCHAR(100),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_temperatura, p_carbohidratos, p_vegetales, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;

-- Leer acompannamiento
DELIMITER //

CREATE PROCEDURE leer_acompannamiento()
BEGIN
    SELECT * FROM acompannamiento;
END//

DELIMITER ;

-- actualizar acompannamiento 
DELIMITER //

CREATE PROCEDURE actualizar_acompannamiento_nombree(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE acompannamiento
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- eliminar acompannamiento

DELIMITER //

CREATE PROCEDURE eliminar_acompannamiento_nombree(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM acompannamiento
    WHERE nombre = p_nombre;
END//

DELIMITER ;

select * from acompannamiento;

-- CRUD postre ----------------

-- Crear postre
DELIMITER //

CREATE PROCEDURE crear_postre(
    IN p_nombre VARCHAR(100),
    IN p_lacteo VARCHAR(100),
    IN p_frutas VARCHAR(100),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_lacteo, p_frutas, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;

-- Leer postre
DELIMITER //

CREATE PROCEDURE leer_postre()
BEGIN
    SELECT * FROM postre;
END//

DELIMITER ;

-- Actualizar postre 
DELIMITER //

CREATE PROCEDURE actualizar_postre_nombre(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE postre
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- Eliminar postre

DELIMITER //

CREATE PROCEDURE eliminar_postre_nombre(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM postre
    WHERE nombre = p_nombre;
END//

DELIMITER ;

SELECT * FROM postre;

-- Funciones Combo -----------------

-- Leer Combo
DELIMITER //

CREATE PROCEDURE leer_combos()
BEGIN
    SELECT * FROM combo;
END;

//
DELIMITER ;

-- Funciones Plato ----------------------

-- Leer Plato
DELIMITER //

CREATE PROCEDURE leer_platos()
BEGIN
    SELECT * FROM plato;
END;

//
DELIMITER ;

-- Funciones Factura ----------------------

-- Crear Factura 
DELIMITER //
CREATE PROCEDURE crear_factura(
    in p_fecha DATE,
    in p_monto_total DOUBLE
)
BEGIN
    INSERT INTO factura (fecha, monto_total) VALUES (p_fecha, p_monto_total);
END //
DELIMITER ;

-- Leer Factura 
DELIMITER //

CREATE PROCEDURE leer_facturas()
BEGIN
    SELECT * FROM factura;
END;

//
DELIMITER ;
select * from factura;

-- Orden --------------
-- Leer Ordenes
DELIMITER //

CREATE PROCEDURE leer_ordenes()
BEGIN
    SELECT * FROM orden;
END;

//
DELIMITER ;

-- Crear Orden
DELIMITER //
CREATE PROCEDURE crear_orden(
    in p_fecha DATE,
    in p_detalle VARCHAR(250)
)
BEGIN
    INSERT INTO orden (fecha, detalle) VALUES (p_fecha, p_detalle);
END //
DELIMITER ;

-- Selects de las tablas
select * from factura;
select * from orden;
select * from plato;
select * from postre;
select * from proteina;
select * from acompannamiento;
select * from bebida;
select * from combo;

-- drop database restaurante;

