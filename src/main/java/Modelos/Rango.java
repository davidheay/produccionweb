/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author David Herrera
 */
public class Rango {

    private Time horaIni;
    private Time horaFin;
    private Date fechaIn;
    private Date fechaFin;
    private Integer cantidad;
    private String detalle;
    private Tamaño tamaño;

    public Rango() {
    }

    public Rango(Time horaIni, Time horaFin, Date fechaIn, Date fechaFin, Integer cantidad, String detalle, Tamaño tamaño) {
        this.horaIni = horaIni;
        this.horaFin = horaFin;
        this.fechaIn = fechaIn;
        this.fechaFin = fechaFin;
        this.cantidad = cantidad;
        this.detalle = detalle;
        this.tamaño = tamaño;
    }

    public Tamaño getTamaño() {
        return tamaño;
    }

    public void setTamaño(Tamaño tamaño) {
        this.tamaño = tamaño;
    }
    

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public Time getHoraIni() {
        return horaIni;
    }

    public void setHoraIni(Time horaIni) {
        this.horaIni = horaIni;
    }

    public Date getFechaIn() {
        return fechaIn;
    }

    public void setFechaIn(Date fechaIn) {
        this.fechaIn = fechaIn;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    @Override
    public String toString() {
        return "Rango{" + "horaIni=" + horaIni + ", horaFin=" + horaFin + ", fechaIn=" + fechaIn + ", fechaFin=" + fechaFin + ", cantidad=" + cantidad + ", detalle=" +  + '}';
    }

}
