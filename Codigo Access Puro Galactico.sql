Sub ReiniciarTablas()
    Dim db As DAO.Database
    Set db = CurrentDb

    ' Eliminar tablas si existen
    On Error Resume Next
    db.Execute "DROP TABLE Proveedores;"
    db.Execute "DROP TABLE Productos;"
    db.Execute "DROP TABLE Clientes;"
    db.Execute "DROP TABLE Pedidos;"
    db.Execute "DROP TABLE DetallesPedido;"
    db.Execute "DROP TABLE Pagos;"
    db.Execute "DROP TABLE UsuarioPlataforma;"
    db.Execute "DROP TABLE Logistica;"
    db.Execute "DROP TABLE MetodoPago;"
    On Error GoTo 0

    ' Crear tabla Proveedores
    db.Execute "CREATE TABLE Proveedores (" & _
              "ProveedorID AUTOINCREMENT PRIMARY KEY, " & _
              "NombreP TEXT(100), " & _
              "ApellidoP TEXT(100), " & _
              "DNIP TEXT(20), " & _
              "Comunidad TEXT(100), " & _
              "Region TEXT(100), " & _
              "Telefono TEXT(20), " & _
              "Email TEXT(100));"

    ' Crear tabla Productos
    db.Execute "CREATE TABLE Productos (" & _
              "ProductoID AUTOINCREMENT PRIMARY KEY, " & _
              "NombreP TEXT(100), " & _
              "DescripcionP MEMO, " & _
              "CategoriaP TEXT(50), " & _
              "PrecioP CURRENCY, " & _
              "UnidadMedida TEXT(50), " & _
              "ImagenP OLEOBJECT, " & _
              "ProveedorID INT, " & _
              "FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID));"

    ' Crear tabla Clientes
    db.Execute "CREATE TABLE Clientes (" & _
              "ClienteID AUTOINCREMENT PRIMARY KEY, " & _
              "NombreC TEXT(100), " & _
              "ApellidoC TEXT(100), " & _
              "DNIC TEXT(20), " & _
              "Direccion TEXT(255), " & _
              "Telefono TEXT(20), " & _
              "Email TEXT(100));"

    ' Crear tabla Pedidos
    db.Execute "CREATE TABLE Pedidos (" & _
              "PedidoID AUTOINCREMENT PRIMARY KEY, " & _
              "ClienteID INT, " & _
              "FechaPedido DATE, " & _
              "Campo TEXT(100), " & _
              "FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID));"

    ' Crear tabla DetallesPedido
    db.Execute "CREATE TABLE DetallesPedido (" & _
              "DetalleID AUTOINCREMENT PRIMARY KEY, " & _
              "PedidoID INT, " & _
              "ProductoID INT, " & _
              "Cantidad INT, " & _
              "PrecioUnitario CURRENCY, " & _
              "FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID), " & _
              "FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID));"

    ' Crear tabla Pagos
    db.Execute "CREATE TABLE Pagos (" & _
              "PagoID AUTOINCREMENT PRIMARY KEY, " & _
              "PedidoID INT, " & _
              "Monto CURRENCY, " & _
              "FechaPago DATE, " & _
              "FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID));"

    ' Crear tabla UsuarioPlataforma
    db.Execute "CREATE TABLE UsuarioPlataforma (" & _
              "UsuarioID AUTOINCREMENT PRIMARY KEY, " & _
              "Contrasena TEXT(100), " & _
              "Rol TEXT(50));"

    ' Crear tabla Logistica
    db.Execute "CREATE TABLE Logistica (" & _
              "LogisticaID AUTOINCREMENT PRIMARY KEY, " & _
              "PedidoID INT, " & _
              "EmpresaEnvio TEXT(100), " & _
              "NumeroGuia TEXT(50), " & _
              "FechaEnvio DATE, " & _
              "FechaEntregaEstimada DATE, " & _
              "EstadoEnvio TEXT(50), " & _
              "DireccionEnvio TEXT(255), " & _
              "FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID));"

    ' Crear tabla MetodoPago
    db.Execute "CREATE TABLE MetodoPago (" & _
              "MetodoPagoID AUTOINCREMENT PRIMARY KEY, " & _
              "Yape CURRENCY, " & _
              "Plin CURRENCY);"

    MsgBox "Tablas eliminadas y recreadas con éxito", vbInformation

End Sub
