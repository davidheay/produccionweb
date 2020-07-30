/*
 * 06-06-2019
 *  
 */
package Modelos;

/**
 *
 * @author David Herrera
 */
public class CentroTrabajo {

    private Capacidad capacidad;
    private String nombre;

    public CentroTrabajo() {
    }

    public CentroTrabajo(Capacidad capacidad, String nombre) {
        this.capacidad = capacidad;
        this.nombre = nombre;
    }

    public Capacidad getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(Capacidad capacidad) {
        this.capacidad = capacidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
