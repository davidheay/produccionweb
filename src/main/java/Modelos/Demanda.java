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
public class Demanda {

    private ArrayList<Producto> productos;
    private ArrayList<Tamaño> tamaños;

    public Demanda() {
    }

    public Demanda(Demanda demanda) {

        this.productos = null;
        ArrayList<Tamaño> tamañosNew = new ArrayList<>();
        for (Tamaño tamaño : demanda.getTamaños()) {
            ArrayList<Producto> productosNew = new ArrayList<>();
            for (Producto producto : tamaño.getProductos()) {
                productosNew.add(new Producto(producto.getNombre(), producto.getCantidad()));
            }
            tamañosNew.add(new Tamaño(tamaño.getNombre(), productosNew));
        }
        this.tamaños = tamañosNew;
    }

    public Demanda(ArrayList<Producto> productos, ArrayList<Tamaño> tamaños) {
        this.productos = productos;
        this.tamaños = tamaños;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    public ArrayList<Tamaño> getTamaños() {
        return tamaños;
    }

    public void setTamaños(ArrayList<Tamaño> tamaños) {
        this.tamaños = tamaños;
    }

    @Override
    public String toString() {
        return "Demanda{" + "productos=" + productos + ", tama\u00f1os=" + tamaños + '}';
    }

}
