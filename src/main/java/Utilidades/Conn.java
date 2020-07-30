package Utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author wilsonfr
 */
public class Conn {

    private final String connectionUrl = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=Analisis;user=admin;password=admin;";
    private Connection conexion = null;

    public Conn() {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = (Connection) DriverManager.getConnection(connectionUrl);
            if (conexion != null) {
                // System.out.println("Conexion OK");
            }
        } catch (SQLException ex) {
            System.out.println("Error en Driver Manager" + ex);
        } catch (Exception ex) {
            System.out.println("Ocurrió un error inesperado en la conexión" + ex);
        }
    }

    public void cerrarConexion() {
        if (conexion != null) {
            try {
                conexion.close();
                conexion = null;
            } catch (Exception ex) {
                System.out.println("No se pudo cerrar la conexión");
            }
        }
    }

    public Connection getConexion() {
        return conexion;
    }

}
