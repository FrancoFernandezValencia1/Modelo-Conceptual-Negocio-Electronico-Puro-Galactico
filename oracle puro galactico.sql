CREATE TABLE Proveedores (
    ProductorID NUMBER PRIMARY KEY,
    NombreP VARCHAR2(100),
    ApellidoP VARCHAR2(100),
    DNIP VARCHAR2(20),
    Comunidad VARCHAR2(100),
    Region VARCHAR2(100),
    Telefono VARCHAR2(20),
    Email VARCHAR2(100)
);

CREATE TABLE Productos (
    ProductoID NUMBER PRIMARY KEY,
    NombreP VARCHAR2(100),
    DescripcionP CLOB,
    CategoriaP VARCHAR2(50),
    Precio NUMBER(10,2),
    UnidadMedida VARCHAR2(50),
    ImagenP BLOB
);

CREATE TABLE Clientes (
    ClienteID NUMBER PRIMARY KEY,
    NombreC VARCHAR2(100),
    ApellidoC VARCHAR2(100),
    DNIC VARCHAR2(20),
    Direccion VARCHAR2(255),
    Telefono VARCHAR2(20),
    Email VARCHAR2(100)
);

CREATE TABLE Pedidos (
    PedidoID NUMBER PRIMARY KEY,
    ClienteID NUMBER,
    FechaPedido DATE,
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE DetallesPedido (
    DetalleID NUMBER PRIMARY KEY,
    PedidoID NUMBER,
    ProductoID NUMBER,
    Cantidad NUMBER,
    PrecioUnitario NUMBER(10,2),
    CONSTRAINT FK_DetallesPedido_Pedidos FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    CONSTRAINT FK_DetallesPedido_Productos FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

CREATE TABLE Pagos (
    PagoID NUMBER PRIMARY KEY,
    PedidoID NUMBER,
    Monto NUMBER(10,2),
    FechaPago DATE,
    CONSTRAINT FK_Pagos_Pedidos FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

CREATE TABLE Logistica (
    LogisticaID NUMBER PRIMARY KEY,
    PedidoID NUMBER,
    EmpresaEnvio VARCHAR2(100),
    NumeroGuia VARCHAR2(50),
    FechaEnvio DATE,
    FechaEntregaEstimada DATE,
    EstadoEnvio VARCHAR2(50),
    DireccionEnvio VARCHAR2(255),
    CONSTRAINT FK_Logistica_Pedidos FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

CREATE TABLE UsuarioPlataforma (
    UsuarioID NUMBER PRIMARY KEY,
    Contraseña VARCHAR2(255),
    Rol VARCHAR2(50)
);

CREATE TABLE MetodoPago (
    Yape NUMBER(10,2),
    Plin NUMBER(10,2)
);