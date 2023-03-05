CREATE TABLE cliente (
    id_cliente SERIAL NOT NULL,
    nom_cliente VARCHAR(50) NOT NULL,
    ape_cliente VARCHAR(50) NOT NULL,
    dir_cliente VARCHAR(80) NOT NULL,
    tlfn_cliente VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_cliente)
);

CREATE TABLE mesa (
    nro_mesa INT NOT NULL,
    reservada BOOLEAN ,
    puestos INT NOT NULL,

    PRIMARY KEY (nro_mesa)
);

CREATE TABLE mesero (
    id_mesero SERIAL NOT NULL,
    nom_mesero VARCHAR(50) NOT NULL,
    ape_mesero VARCHAR(50) NOT NULL,
    edad_mesero INT NOT NULL,
    antiguedad INT NOT NULL,
    fecha_contratacion DATE NOT NULL,

    PRIMARY KEY (id_mesero)
);

CREATE TABLE supervisor (
    id_supervisor SERIAL NOT NULL,
    nom_supervisor VARCHAR(50) NOT NULL,
    ape_supervisor VARCHAR(50) NOT NULL,
    edad_supervisor INT NOT NULL,
    fecha_contratacion DATE NOT NULL,
    antiguedad INT NOT NULL,


    PRIMARY KEY (id_supervisor)
);

CREATE TABLE plato (
    id_plato SERIAL NOT NULL,
    nom_plato VARCHAR(50) NOT NULL,
    precio_plato NUMERIC NOT NULL,

    PRIMARY KEY (id_plato)
);

CREATE TABLE factura (
    nro_factura SERIAL NOT NULL,
    fecha_factura DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_mesero INT NOT NULL,
    id_supervisor INT NOT NULL,
    nro_mesa INT NOT NULL,

    PRIMARY KEY (nro_factura),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_mesero) REFERENCES mesero(id_mesero),
    FOREIGN KEY (id_supervisor) REFERENCES supervisor(id_supervisor),
    FOREIGN KEY (nro_mesa) REFERENCES mesa(nro_mesa)
);

CREATE TABLE detalle_factura (
    nro_factura INT NOT NULL,
    id_plato INT NOT NULL,
    cantidad INT NOT NULL,

    PRIMARY KEY (nro_factura, id_plato),
    FOREIGN KEY (nro_factura) REFERENCES factura(nro_factura),
    FOREIGN KEY (id_plato) REFERENCES plato(id_plato)
);


