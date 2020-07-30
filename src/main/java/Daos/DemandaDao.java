/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.CentroTrabajo;
import Modelos.Demanda;
import Modelos.Producto;
import Modelos.Tamaño;
import java.util.ArrayList;

/**
 *
 * @author David Herrera
 */
public interface DemandaDao {

    public ArrayList<Demanda> getDemanda(ArrayList<Producto> productos, ArrayList<Tamaño> tamaños, ArrayList<CentroTrabajo> centroTrabajos);

    public void insertarDemanda(Integer a, Integer b, Integer c, Integer d, Integer e, Integer f, Integer g, Integer h, Integer i);

}
