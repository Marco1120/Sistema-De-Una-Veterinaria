<h1 align="center"> SISTEMA PARA VETERINARIA - "El Pibe" </h1>

<h1 align="center"> <img width="500" height="500" alt="Diseño sin título (15)" src="https://github.com/user-attachments/assets/78abcecc-84eb-4d38-84d2-1411745415f1" /></h1>

<p align="center"> Imagen 1. Logotipo creado con IA </p>

## EQUIPO 7

### Integrantes:
- Jiménez Juárez Marco Antonio - [Marco1120](https://github.com/Marco1120)
- Gonzales Valentín Adrián - [Adrian-Valentin27](https://github.com/Adrian-Valentin27)

### ¿Qué hace el sistema?
Este sistema está diseñado para gestionar una clínica veterinaria, permitiendo el registro y control de empleados, dueños, mascotas y consultas. Incluye roles como administrador y veterinario, con acceso mediante correo y contraseña para mayor seguridad.

### Tipo de sistema:
Aplicación de escritorio en Java, desarrollada con Swing y conectada a MySQL

### Componente utilizado:
- Captcha: https://github.com/FanyBr07/ComponenteVisual
- Barra de progreso: https://github.com/Marco1120/Componente-Visual

## 
## FUNCIONALIDADES CLAVE
### Integración de Captcha:
El componente Captcha desarrollado por el equipo 2 se utiliza durante el proceso de inicio de sesión. Este se activa al seleccionar el ComboBox con la opción "No soy un robot". Es obligatorio marcar esta opción, ya que aunque se ingresen correctamente los demás datos, no será posible acceder al sistema sin completar esta verificación.

<img width="1140" height="780" alt="Captura de pantalla 2025-07-28 024139" src="https://github.com/user-attachments/assets/7301cd66-f2e0-4a47-8517-b6f034901f51" />
Imagen 2.

### CRUD de usuarios:
Create (Crear). El botón registrar abre un JDialog llamada registro de usuario ya que en esta crea nuevos usuarios. En este se ingresaran los datos necesarios de cada usuario, tendremos un Combo Box en el cual vienen los tipos de usuarios, si es veterinario debe meter una especialidad, si no lo es el Text Field se mantendrá bloqueado.

<img width="1334" height="785" alt="Captura de pantalla 2025-07-28 042025" src="https://github.com/user-attachments/assets/11c71099-cace-448a-ad8c-df40aac36a14" />
Imagen 3.



Read (Leer). En caso de ser administrador del programa se mostraran  todos los empleados o también puede mostrar por su ID, Nombre, Apellidos, Teléfono, Dirección, Correo, Contraseña, Tipo de Empleado. Para ello utilizamos un JTable, combo Box para seleccionar el tipo de busqueda y un Text Field para escribir los datos por los cuales buscaremos, de igual manera un botón para comenzar con la busqueda.

```java
public void mostrarUsuarios(int opcbuscar, String valor) {
        DefaultTableModel tUsuario = new DefaultTableModel();
        tUsuario.addColumn("Identificación");
        tUsuario.addColumn("Nombre");
        tUsuario.addColumn("Apellidos");
        tUsuario.addColumn("Telefono");
        tUsuario.addColumn("Dirección");
        tUsuario.addColumn("Correo");
        tUsuario.addColumn("Contraseña");
        tUsuario.addColumn("Especialidad");
        tUsuario.addColumn("Tipo Empleado");

        tablaUsuarios.setModel(tUsuario);

        String codsql = "";
        PreparedStatement ps = null;
        ResultSet resultado = null;

        try {
            if (opcbuscar == 0 || valor == null || valor.trim().isEmpty()) {
                // Mostrar todos los empleados
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado";
                ps = cn.prepareStatement(codsql);

            } else if (opcbuscar == 1) {
                // Buscar por ID
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.id_empleado = ?";
                ps = cn.prepareStatement(codsql);
                ps.setInt(1, Integer.parseInt(valor.trim()));

            } else if (opcbuscar == 2) {
                // Buscar por Nombre
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.nombre LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 3) {
                // Buscar por Apellidos
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.apellidos LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 4) {
                // Buscar por Teléfono
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.telefono LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 5) {
                // Buscar por Dirección
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.direccion LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 6) {
                // Buscar por Correo
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.correo LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 7) {
                // Buscar por Contraseña
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE e.contraseña LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");

            } else if (opcbuscar == 8) {
                // Buscar por Tipo de Empleado
                codsql = "SELECT e.id_empleado, e.nombre, e.apellidos, e.telefono, e.direccion, e.correo, e.contraseña, e.especialidad, t.tipo "
                        + "FROM empleados e "
                        + "JOIN tipos_empleado t ON e.id_tipo_empleado = t.id_tipo_empleado "
                        + "WHERE t.tipo LIKE ?";
                ps = cn.prepareStatement(codsql);
                ps.setString(1, "%" + valor.trim() + "%");
            }

            if (ps != null) {
                resultado = ps.executeQuery();
                String[] datos = new String[9];

                while (resultado.next()) {
                    datos[0] = resultado.getString("id_empleado");
                    datos[1] = resultado.getString("nombre");
                    datos[2] = resultado.getString("apellidos");
                    datos[3] = resultado.getString("telefono");
                    datos[4] = resultado.getString("direccion");
                    datos[5] = resultado.getString("correo");
                    datos[6] = resultado.getString("contraseña");
                    datos[7] = resultado.getString("especialidad");
                    datos[8] = resultado.getString("tipo");

                    tUsuario.addRow(datos);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Consulta: " + codsql);
            lblError.setText("Error en la consulta: " + e.getMessage());
            lblError.setForeground(Color.RED);
        } catch (NumberFormatException e) {
            lblError.setText("ID debe ser un número válido");
            lblError.setForeground(Color.RED);
        } catch (Exception e) {
            System.out.println("Error general: " + e.getMessage());
            lblError.setText("Error inesperado: " + e.getMessage());
            lblError.setForeground(Color.RED);
        } finally {
            try {
                if (resultado != null) {
                    resultado.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("Error cerrando recursos: " + e.getMessage());
            }
        }
    }
```

<img width="1364" height="744" alt="Captura de pantalla 2025-07-28 043102" src="https://github.com/user-attachments/assets/b1682827-3f72-4800-a5fe-2672a25dff61" />
Imagen 4.


Update (Actualizar). Permite editar los empleados directamente en la tabla. Actualiza todos los campos del empleado seleccionado. Como se puede ver en la imagen 4.
```java
public void actualizarDatos() {
        lblError.setText("");
        lblError.setVisible(true);

        // Detener cualquier edición en curso antes de leer los datos
        if (tablaUsuarios.isEditing()) {
            tablaUsuarios.getCellEditor().stopCellEditing();
        }

        int fila = tablaUsuarios.getSelectedRow();
        if (fila < 0) {
            lblError.setText("Por favor, selecciona una fila de la tabla antes de actualizar");
            lblError.setForeground(Color.red);
            return;
        }

        // Obtener datos de la fila seleccionada
        try {
            int id = Integer.parseInt(tablaUsuarios.getValueAt(fila, 0).toString());
            String nombre = tablaUsuarios.getValueAt(fila, 1).toString();
            String apellidos = tablaUsuarios.getValueAt(fila, 2).toString();
            String telefono = tablaUsuarios.getValueAt(fila, 3).toString();
            String direccion = tablaUsuarios.getValueAt(fila, 4).toString();
            String correo = tablaUsuarios.getValueAt(fila, 5).toString();
            String contraseña = tablaUsuarios.getValueAt(fila, 6).toString();
            String especialidad = tablaUsuarios.getValueAt(fila, 7).toString();
            String tipoEmpleado = tablaUsuarios.getValueAt(fila, 8).toString();

            // Verificar conexión
            if (cn == null || cn.isClosed()) {
                lblError.setText("Error de conexión a la base de datos");
                lblError.setForeground(Color.red);
                return;
            }

            // Usar try-with-resources para manejo automático de recursos
            try {
                // Verificar si el empleado existe
                try (PreparedStatement verificar = cn.prepareStatement(
                        "SELECT id_empleado FROM empleados WHERE id_empleado = ?")) {
                    verificar.setInt(1, id);
                    try (ResultSet rs = verificar.executeQuery()) {
                        if (!rs.next()) {
                            lblError.setText("Empleado no encontrado con ID: " + id);
                            lblError.setForeground(Color.red);
                            return;
                        }
                    }
                }

                // Obtener id_tipo_empleado
                int idTipoEmpleado = 0;
                try (PreparedStatement obtenerTipo = cn.prepareStatement(
                        "SELECT id_tipo_empleado FROM tipos_empleado WHERE tipo = ?")) {
                    obtenerTipo.setString(1, tipoEmpleado);
                    try (ResultSet rs = obtenerTipo.executeQuery()) {
                        if (rs.next()) {
                            idTipoEmpleado = rs.getInt("id_tipo_empleado");
                        } else {
                            lblError.setText("Tipo de empleado no encontrado: " + tipoEmpleado);
                            lblError.setForeground(Color.red);
                            return;
                        }
                    }
                }

                // Actualizar los datos - CORREGIDO: usar tabla empleados en lugar de dueños
                try (PreparedStatement actualizar = cn.prepareStatement(
                        "UPDATE empleados SET nombre=?, apellidos=?, telefono=?, direccion=?, "
                        + "correo=?, contraseña=?, especialidad=?, id_tipo_empleado=? WHERE id_empleado=?")) {

                    actualizar.setString(1, nombre);
                    actualizar.setString(2, apellidos);
                    actualizar.setString(3, telefono);
                    actualizar.setString(4, direccion);
                    actualizar.setString(5, correo);
                    actualizar.setString(6, contraseña);
                    actualizar.setString(7, especialidad);
                    actualizar.setInt(8, idTipoEmpleado);
                    actualizar.setInt(9, id);

                    int filasAfectadas = actualizar.executeUpdate();

                    if (filasAfectadas > 0) {
                        mostrarUsuarios(0, null); // refrescar tabla
                        lblError.setText("Datos actualizados correctamente");
                        lblError.setForeground(new Color(0, 100, 0)); 
                    } else {
                        lblError.setText("No se actualizó ningún registro");
                        lblError.setForeground(Color.red);
                    }
                }
            } catch (SQLException e) {
                lblError.setText("Error de base de datos: " + e.getMessage());
                lblError.setForeground(Color.red);
                e.printStackTrace();
            }
        } catch (NumberFormatException e) {
            lblError.setText("Error: ID de empleado inválido");
            lblError.setForeground(Color.red);
        } catch (Exception e) {
            lblError.setText("Error inesperado: " + e.getMessage());
            lblError.setForeground(Color.red);
        }
    }
```

Delete (Eliminar). Elimina empleado seleccionado de la tabla. Incluye validación para evitar eliminar empleados con citas asociadas.

```java
public void eliminarUsuarios() {
        int fila = tablaUsuarios.getSelectedRow();

        if (fila == -1) {
            lblError.setText("Se debe seleccionar una fila para eliminar");
            return;
        }

        String valor = tablaUsuarios.getValueAt(fila, 0).toString();
        int idEmpleado = Integer.parseInt(valor);

        try {
            String consultaCitas = "SELECT COUNT(*) FROM citas WHERE id_veterinario = ?";
            PreparedStatement verificar = cn.prepareStatement(consultaCitas);
            verificar.setInt(1, idEmpleado);
            ResultSet rs = verificar.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                lblError.setText("No se puede eliminar. El usuario tiene citas asociadas.");
                lblError.setForeground(Color.RED);
                return;
            }

            String sql = "DELETE FROM empleados WHERE id_empleado = ?";
            PreparedStatement delete = cn.prepareStatement(sql);
            delete.setInt(1, idEmpleado);

            int filasAfectadas = delete.executeUpdate();

            if (filasAfectadas > 0) {
                lblError.setText("Usuario eliminado exitosamente.");
                lblError.setForeground(Color.GREEN);
            } else {
                lblError.setText("No se encontró el usuario a eliminar.");
                lblError.setForeground(Color.RED);
            }

            mostrarUsuarios(0, null);

        } catch (Exception e) {
            lblError.setText("Fallo al eliminar el registro: " + e.getMessage());
            lblError.setForeground(Color.RED);
            e.printStackTrace();
        }
    }
```

### CRUD de tratamientos:
Create (Crear). El botón registrar abre un JDialog llamada registro de tratamientos ya que en esta crean los regsitros de los tratamientos realizados. En este se ingresaran la descripcion del tratamiento, el costo e id de la cita.

<img width="1328" height="756" alt="Captura de pantalla 2025-07-28 045533" src="https://github.com/user-attachments/assets/9f2da09e-07ef-4697-afc3-aa3a8e7f3036" />
Imagen 5.

Read (Leer). Muestrar todos los tratamientos, busca por ID, descripción, costo, o ID de cita y carga datos en la tabla desde la base de datos.
```java
public void mostrarTratamientos(int opcionBuscar, String Valor) {
        DefaultTableModel tTratamiento = new DefaultTableModel();
        tTratamiento.addColumn("Identificación");
        tTratamiento.addColumn("Descripción");
        tTratamiento.addColumn("Costo");
        tTratamiento.addColumn("ID Cita");
        tablaTratamientos.setModel(tTratamiento);

        String codsql;

        if (opcionBuscar == 0 && Valor == null) {
            codsql = "SELECT * FROM tratamientos";
        } else {
            if (opcionBuscar == 1 && Valor != null) {
                codsql = "SELECT * FROM tratamientos WHERE id_tratamiento = '" + Valor + "'";
            } else {
                if (opcionBuscar == 2 && Valor != null) {
                    codsql = "SELECT * FROM tratamientos WHERE descripcion = '" + Valor + "'";
                } else {
                    if (opcionBuscar == 3 && Valor != null) {
                        codsql = "SELECT * FROM tratamientos WHERE costo = '" + Valor + "'";
                    } else {
                        if (opcionBuscar == 4 && Valor != null) {
                            codsql = "SELECT * FROM tratamientos WHERE id_cita ='" + Valor + "'";
                        } else {
                            codsql = "SELECT * FROM tratamientos";
                        }
                    }
                }
            }
        }

        String[] datos = new String[4];

        try {
            Statement leer = cn.createStatement();
            ResultSet resultado = leer.executeQuery(codsql);

            while (resultado.next()) {
                datos[0] = resultado.getString(1);
                datos[1] = resultado.getString(2);
                datos[2] = resultado.getString(3);
                datos[3] = resultado.getString(4);

                tTratamiento.addRow(datos);
            }
            tablaTratamientos.setModel(tTratamiento);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + "Error en la consulta.");
        }
    }
```

Update (Actualizar). Actualiza un tratamiento seleccionado en la tabla.

```java
public void ActualizarDatos() {
        int Fila;
        int id;
        String Descripcion;
        double Costo;
        String Cita;

        Fila = tablaTratamientos.getSelectedRow();
        id = Integer.parseInt(tablaTratamientos.getValueAt(Fila, 0).toString());
        Descripcion = tablaTratamientos.getValueAt(Fila, 1).toString();
        Costo = Double.parseDouble(tablaTratamientos.getValueAt(Fila, 2).toString());
        Cita = tablaTratamientos.getValueAt(Fila, 3).toString();

        try {
            PreparedStatement actualizar = cn.prepareStatement(
                    "UPDATE tratamientos SET Descripcion = ?, Costo = ?, id_cita = ? WHERE id_tratamiento = ?"
            );
            actualizar.setString(1, Descripcion);
            actualizar.setDouble(2, Costo);
            actualizar.setString(3, Cita);
            actualizar.setInt(4, id);

            actualizar.executeUpdate();
            mostrarTratamientos(0, null);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + " No se logró actualizar los datos.");
        }
    }
```

Delete (Eliminar). Elimina el tratamiento seleccionado.

```java
public void eliminarTratamientos() {
        int fila = tablaTratamientos.getSelectedRow();

        if (fila == -1) {
            lblError.setText("Se debe seleccionar una fila para eliminar");
            return;
        }

        String valor = tablaTratamientos.getValueAt(fila, 0).toString();

        try {
            String sql = "DELETE FROM tratamientos WHERE id_tratamiento = ?";
            PreparedStatement delete = cn.prepareStatement(sql);
            delete.setInt(1, Integer.parseInt(valor));

            int filasAfectadas = delete.executeUpdate();

            if (filasAfectadas > 0) {
                lblError.setText("Tratamiento eliminado exitosamente.");
                lblError.setForeground(Color.green);
            } else {
                lblError.setText("No se encontró la mascota a eliminar.");
            }

            mostrarTratamientos(0, null);
        } catch (Exception e) {
            lblError.setText("Fallo al eliminar el tratamiento: " + e.getMessage());
            e.printStackTrace();
        }
    }
```

### Envio de correo electrónico.

[registro_Marco_Antonio_Jimenez_Juarez.pdf](https://github.com/user-attachments/files/21467553/registro_Marco_Antonio_Jimenez_Juarez.pdf)




## DEPENDENCIAS Y CONFIGURACION
### Nombre de librerias utilizadas:

- Libreria.jar
- javax.mail.jar
- activation.jar
- itextpdf-5.5.13.3.jar
- mysql-connector-j-9.3.0.jar
- Crud.jar
- Correo.jar
- j.Calendar
- Ticket.jar

### Pasos para instalar/ejecutar:





## :hammer: Requisitos minimos:
- `Funcionalidad 1`:  Java 11
- `Funcionalidad 2`:  MySQL 8.0.4 

## 👥 Autores

[![Marco1120](https://github.com/Marco1120.png?size=100)](https://github.com/Marco1120)
[![Adrian-Valentin27](https://github.com/Adrian-Valentin27.png?size=100)](https://github.com/Adrian-Valentin27)
