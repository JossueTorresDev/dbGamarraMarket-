-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-04-30 14:30:56.98

-- tables
-- Table: CLIENTE
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

USE dbGamarraMarket;

CREATE TABLE CLIENTE (
    id int  NOT NULL,
    Tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    email varchar(80)  NULL,
    celular char(9)  NULL,
    fecha_nacimiento date  NOT NULL,
    activo bool  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de los clientes';

-- Table: PRENDA
CREATE TABLE PRENDA (
    id int  NOT NULL,
    descripcion varchar(90)  NOT NULL,
    marca varchar(60)  NOT NULL,
    cantidad int  NOT NULL,
    talla varchar(10)  NOT NULL,
    precio decimal(8,2)  NOT NULL,
    activo char(9)  NOT NULL,
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de los prendas';

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    id int  NOT NULL,
    Tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    salario decimal(8,2)  NOT NULL,
    celular char(9)  NULL,
    email varchar(80)  NULL,
    activo bool  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de los vendedores';

-- Table: VENTA
CREATE TABLE VENTA (
    id int  NOT NULL,
    fecha_hora timestamp  NOT NULL,
    activo bool  NOT NULL,
    CLIENTE_id int  NOT NULL,
    VENDEDOR_id int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de registros de la venta';

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id int  NOT NULL,
    cantidad int  NOT NULL,
    VENTA_id int  NOT NULL,
    PRENDA_id int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de registros de la venta detalle';

-- foreign keys
-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CLIENTE_id)
    REFERENCES CLIENTE (id);

-- Reference: VENTA_DETALLE_PRENDA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (PRENDA_id)
    REFERENCES PRENDA (id);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (VENTA_id)
    REFERENCES VENTA (id);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_id)
    REFERENCES VENDEDOR (id);

-- End of file.