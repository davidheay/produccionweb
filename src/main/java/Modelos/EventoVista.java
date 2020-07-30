/*
 * 06-06-2019
 *  
 */
package Modelos;

import com.google.gson.annotations.SerializedName;

/**
 *
 * @author David Herrera
 */
public class EventoVista {

    @SerializedName("id")
    private String idEvento;
    @SerializedName("section_id")
    private String centro;
    @SerializedName("tamaño")
    private String tamaño;
    @SerializedName("text")
    private String textoVista;
    @SerializedName("start_date")
    private String fechaInicial;
    @SerializedName("end_date")
    private String fechaFinal;

    public EventoVista() {
    }

    public EventoVista(String idEvento, String centro, String tamaño, String textoVista, String fechaInicial, String fechaFinal) {
        this.idEvento = idEvento;
        this.centro = centro;
        this.tamaño = tamaño;
        this.textoVista = textoVista;
        this.fechaInicial = fechaInicial;
        this.fechaFinal = fechaFinal;
    }

    public String getTamaño() {
        return tamaño;
    }

    public void setTamaño(String tamaño) {
        this.tamaño = tamaño;
    }

   

    public String getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(String idEvento) {
        this.idEvento = idEvento;
    }

    public String getCentro() {
        return centro;
    }

    public void setCentro(String centro) {
        this.centro = centro;
    }

    public String getTextoVista() {
        return textoVista;
    }

    public void setTextoVista(String textoVista) {
        this.textoVista = textoVista;
    }

    public String getFechaInicial() {
        return fechaInicial;
    }

    public void setFechaInicial(String fechaInicial) {
        this.fechaInicial = fechaInicial;
    }

    public String getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(String fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

}
