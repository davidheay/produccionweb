/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David Herrera
 */
public interface ProductoDao {

    public ArrayList<Producto> listarProductos();
}
