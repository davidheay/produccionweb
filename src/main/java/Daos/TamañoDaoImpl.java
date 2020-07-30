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

/**
 *
 * @author David Herrera
 */
public class TamañoDaoImpl implements TamañoDao {

    @Override
    public ArrayList<Tamaño> listarTamaños() {
        ArrayList<Tamaño> tamaños = new ArrayList<>();
        Conn conexion = new Conn();

        try {

            //String sql = "select * from Mercancia";
            String sql = "SELECT [Id_Tamaño],[Tamaño] FROM [Analisis].[dbo].[Tamaños]";

            PreparedStatement prepareStatemente = (PreparedStatement) conexion.getConexion().prepareStatement(sql);
            ResultSet resultSet = prepareStatemente.executeQuery();
            while (resultSet.next()) {
                Tamaño tamaño = new Tamaño();
                tamaño.setNombre(resultSet.getString(1));
                tamaños.add(tamaño);
            }
            prepareStatemente.close();
            resultSet.close();
        } catch (Exception ex) {
            System.out.println("error tamaño dao" + ex);
        } finally {
            conexion.cerrarConexion();
        }

        return tamaños;
    }

}
