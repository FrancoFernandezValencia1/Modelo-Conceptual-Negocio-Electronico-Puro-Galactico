CREATE TABLE Proveedores (
    ProductorID INT PRIMARY KEY,
    NombreP VARCHAR(100),
    ApellidoP VARCHAR(100),
    DNIP VARCHAR(20),
    Comunidad VARCHAR(100),
    Region VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    NombreP VARCHAR(100),
    DescripcionP TEXT,
    CategoriaP VARCHAR(50),
    Precio DECIMAL(10,2),
    UnidadMedida VARCHAR(50),
    ImagenP BLOB
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NombreC VARCHAR(100),
    ApellidoC VARCHAR(100),
    DNIC VARCHAR(20),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY,
    PedidoID INT,
    Monto DECIMAL(10,2),
    FechaPago DATE,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

CREATE TABLE Logistica (
    LogisticaID INT PRIMARY KEY,
    PedidoID INT,
    EmpresaEnvio VARCHAR(100),
    NumeroGuia VARCHAR(50),
    FechaEnvio DATE,
    FechaEntregaEstimada DATE,
    EstadoEnvio VARCHAR(50),
    DireccionEnvio VARCHAR(255),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

CREATE TABLE UsuarioPlataforma (
    UsuarioID INT PRIMARY KEY,
    Contraseña VARCHAR(255),
    Rol VARCHAR(50)
);

CREATE TABLE MetodoPago (
    Yape DECIMAL(10,2),
    Plin DECIMAL(10,2)
);