/*
 * 06-06-2019
 *  
 */
package Modelos;

import java.util.ArrayList;

/**
 *
 * @author David Herrera
 */
public class JsonVista {

    private ArrayList<EventoVista> eventosVista;
    private Demanda demanda;
    private ArrayList<CentroTrabajo> centroTrabajos;

    public JsonVista() {
    }

    public JsonVista(ArrayList<EventoVista> eventosVista, Demanda demanda, ArrayList<CentroTrabajo> centroTrabajos) {
        this.eventosVista = eventosVista;
        this.demanda = demanda;
        this.centroTrabajos = centroTrabajos;
    }

    public ArrayList<CentroTrabajo> getCentroTrabajos() {
        return centroTrabajos;
    }

    public void setCentroTrabajos(ArrayList<CentroTrabajo> centroTrabajos) {
        this.centroTrabajos = centroTrabajos;
    }

    public ArrayList<EventoVista> getEventosVista() {
        return eventosVista;
    }

    public void setEventosVista(ArrayList<EventoVista> eventosVista) {
        this.eventosVista = eventosVista;
    }

    public Demanda getDemanda() {
        return demanda;
    }

    public void setDemanda(Demanda demanda) {
        this.demanda = demanda;
    }

}
