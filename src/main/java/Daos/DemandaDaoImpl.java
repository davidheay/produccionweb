/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.CentroTrabajo;
import Modelos.Demanda;
import Modelos.Producto;
import Modelos.Tamaño;
import Utilidades.Conn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author David Herrera
 */
public class DemandaDaoImpl implements DemandaDao {

    @Override
    public ArrayList<Demanda> getDemanda(ArrayList<Producto> productos, ArrayList<Tamaño> tamaños, ArrayList<CentroTrabajo> centroTrabajos) {

        ArrayList<Demanda> demandas = new ArrayList<>();

        Conn conexion = new Conn();

        try {

            String sql = "SELECT  [Id_Demanda],Productos.Id_Tipo,Productos.Id_Tamaño,[Cantidad] FROM [Analisis].[dbo].[Demanda] inner join Productos on Demanda.Id_Producto=Productos.Id_Producto WHERE Id_Demanda = (SELECT  max([Id_Demanda]) FROM [Analisis].[dbo].[Demanda] )";

            PreparedStatement prepareStatemente = (PreparedStatement) conexion.getConexion().prepareStatement(sql);
            ResultSet resultSet = prepareStatemente.executeQuery();
            for (int i = 0; i < centroTrabajos.size(); i++) {
                while (resultSet.next()) {
                    for (Tamaño tamaño : tamaños) {
                        if (tamaño.getNombre().equals(resultSet.getString(3))) {
                            switch (i) {
                                case 0:
                                    tamaño.getProductos().add(new Producto((i + 1) + "" + resultSet.getString(2), resultSet.getInt(4) * 5));
                                    break;
                                case 1:
                                    tamaño.getProductos().add(new Producto((i + 1) + "" + resultSet.getString(2), resultSet.getInt(4) * 2));
                                    break;
                                case 2:
                                    tamaño.getProductos().add(new Producto((i + 1) + "" + resultSet.getString(2), resultSet.getInt(4) * 100));
                                    break;
                                case 3:
                                    tamaño.getProductos().add(new Producto((i + 1) + "" + resultSet.getString(2), resultSet.getInt(4) * 2));
                                    break;
                                case 4:
                                    tamaño.getProductos().add(new Producto((i + 1) + "" + resultSet.getString(2), resultSet.getInt(4)));
                                    break;
                                default:
                                    System.out.println("error");
                            }

                        }
                    }

                }

                demandas.add(new Demanda(new Demanda(productos, tamaños)));
                resultSet = prepareStatemente.executeQuery();
                for (Tamaño tamaño : tamaños) {
                    tamaño.getProductos().clear();
                }

            }

            prepareStatemente.close();
            resultSet.close();
        } catch (Exception ex) {
            System.out.println("error tamaño dao" + ex);
        } finally {
            conexion.cerrarConexion();
        }

        return demandas;
    }

    @Override
    public void insertarDemanda(Integer a, Integer b, Integer c, Integer d, Integer e, Integer f, Integer g, Integer h, Integer i) {
        Conn conexion = new Conn();

        try {

            String sql = "exec dbo.insertarDemnda ?,?,?,?,?,?,?,?,?;";

            PreparedStatement prepareStatemente = (PreparedStatement) conexion.getConexion().prepareStatement(sql);
            prepareStatemente.setInt(1, a);
            prepareStatemente.setInt(2, b);
            prepareStatemente.setInt(3, c);
            prepareStatemente.setInt(4, d);
            prepareStatemente.setInt(5, e);
            prepareStatemente.setInt(6, f);
            prepareStatemente.setInt(7, g);
            prepareStatemente.setInt(8, h);
            prepareStatemente.setInt(9, i);

            prepareStatemente.executeQuery();

            prepareStatemente.close();

        } catch (Exception ex) {
            System.out.println("error tamaño dao" + ex);
        } finally {
            conexion.cerrarConexion();
        }
    }

}
