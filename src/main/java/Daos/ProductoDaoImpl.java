/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.Producto;
import Modelos.Tamaño;
import Utilidades.Conn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author David Herrera
 */
public class ProductoDaoImpl implements ProductoDao {

    @Override
    public ArrayList<Producto> listarProductos() {
        ArrayList<Producto> productos = new ArrayList<>();

        Conn conexion = new Conn();

        try {

            //String sql = "select * from Mercancia";
            String sql = "SELECT  [Id_Tipo],[Tipo] FROM [Analisis].[dbo].[Tipos]";

            PreparedStatement prepareStatemente = (PreparedStatement) conexion.getConexion().prepareStatement(sql);
            ResultSet resultSet = prepareStatemente.executeQuery();
            while (resultSet.next()) {
                productos.add(new Producto(resultSet.getString(1), 0));
            }
            prepareStatemente.close();
            resultSet.close();
        } catch (Exception ex) {
            System.out.println("error producto dao" + ex);
        } finally {
            conexion.cerrarConexion();
        }
        return productos;
    }

}
