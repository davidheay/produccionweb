/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author David Herrera
 */
public class Capacidad {

    private Integer unidades;
    private Integer horas;

    public Capacidad() {
    }

    public Capacidad(Integer unidades, Integer horas) {
        this.unidades = unidades;
        this.horas = horas;
    }

    public Integer getUnidades() {
        return unidades;
    }

    public void setUnidades(Integer unidades) {
        this.unidades = unidades;
    }

    public Integer getHoras() {
        return horas;
    }

    public void setHoras(Integer horas) {
        this.horas = horas;
    }

    @Override
    public String toString() {
        return "Demanda{" + "unidades=" + unidades + ", horas=" + horas + '}';
    }

}
