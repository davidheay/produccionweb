/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.Capacidad;
import Modelos.CentroTrabajo;
import Utilidades.Conn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author David Herrera
 */
public class CentroTrabajoDaoImpl implements CentroTrabajoDao {

    @Override
    public ArrayList<CentroTrabajo> listarCentros() {
        Conn conexion = new Conn();

        ArrayList<CentroTrabajo> centrosTrabajo = new ArrayList<>();

        try {

            //String sql = "select * from Mercancia";
            String sql = "SELECT [Id_CT],[Descripcion],[Unidades],[Tiempo],[Id_MP] FROM [Analisis].[dbo].[Centros_Trabajo]";

            PreparedStatement prepareStatemente = (PreparedStatement) conexion.getConexion().prepareStatement(sql);
            ResultSet resultSet = prepareStatemente.executeQuery();
            while (resultSet.next()) {
                centrosTrabajo.add(new CentroTrabajo(new Capacidad(resultSet.getInt(3), resultSet.getInt(4)), resultSet.getString(2)));
            }
            prepareStatemente.close();
            resultSet.close();
        } catch (Exception ex) {
            System.out.println("error centroDao" + ex);
        } finally {
            conexion.cerrarConexion();
        }
        return centrosTrabajo;
    }

}
