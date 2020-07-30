/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.Capacidad;
import Modelos.CentroTrabajo;
import Modelos.Demanda;
import Modelos.EventoVista;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David Herrera
 */
public interface EventoVistaDao {

    public ArrayList<EventoVista> listarEventos(String fechaStr, String horaStr, ArrayList<Demanda> demandas, ArrayList<CentroTrabajo> centros);

}
