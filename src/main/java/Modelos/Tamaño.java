/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.ArrayList;

/**
 *
 * @author David Herrera
 */
public class Tamaño {

    private String nombre;
    private ArrayList<Producto> productos;

    public Tamaño() {
        this.productos = new ArrayList<>();
    }

    public Tamaño(String nombre, ArrayList<Producto> colores) {
        this.nombre = nombre;
        this.productos = colores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    @Override
    public String toString() {
        return "Tamaño=" + nombre + ", prodcuto=" + productos.toString() + '}';
    }

}
