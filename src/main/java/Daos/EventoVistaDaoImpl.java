/*
 * 06-06-2019
 *  
 */
package Daos;

import Modelos.EventoVista;
import Modelos.*;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author David Herrera
 */
public class EventoVistaDaoImpl implements EventoVistaDao {

    @Override
    public ArrayList<EventoVista> listarEventos(String fechaStr, String horaStr, ArrayList<Demanda> demandas, ArrayList<CentroTrabajo> centros) {

        ArrayList<EventoVista> eventosVista = new ArrayList<>();
        ArrayList<Rango> rangos = new ArrayList<>();

        Date fecha = Date.valueOf(fechaStr);
        Time horaIn = Time.valueOf(horaStr);

        Time horaFi = new Time(horaIn.getHours() + centros.get(0).getCapacidad().getHoras(), horaIn.getMinutes(), horaIn.getSeconds());

        rangos.add(new Rango(horaIn, horaFi, fecha, fecha, 0, "Rango: " + horaIn.getHours() + "-" + horaFi.getHours(), null));

        Integer contadorDeCiclo = 0;
        for (Demanda demanda2 : demandas) {

            ArrayList<Tamaño> tamaños = demandas.get(demandas.indexOf(demanda2)).getTamaños();
            Capacidad capacidad = centros.get(demandas.indexOf(demanda2)).getCapacidad();
            if (demandas.indexOf(demanda2) == 1 || demandas.indexOf(demanda2) == 3) {
                horaIn = new Time(rangos.get(0).getHoraIni().getHours(), rangos.get(0).getHoraIni().getMinutes(), 0);
                horaFi = new Time(horaIn.getHours() + centros.get(demandas.indexOf(demanda2)).getCapacidad().getHoras(), horaIn.getMinutes(), horaIn.getSeconds());
                fecha = new Date(rangos.get(0).getFechaIn().getYear(), rangos.get(0).getFechaIn().getMonth(), rangos.get(0).getFechaIn().getDate());
                Date fechaFin;
                if (horaIn.getHours() + capacidad.getHoras() >= 24) {
                    fechaFin = new Date(fecha.getYear(), fecha.getMonth(), fecha.getDate() + 1);
                } else {
                    fechaFin = new Date(fecha.getYear(), fecha.getMonth(), fecha.getDate());
                }

                rangos.clear();
                contadorDeCiclo = 0;
                rangos.add(new Rango(horaIn, horaFi, fecha, fechaFin, 0, "Rango: " + horaIn.getHours() + "-" + horaFi.getHours(), null));
            } else {
                horaIn = rangos.get(contadorDeCiclo).getHoraIni();
                horaFi = new Time(horaIn.getHours() + capacidad.getHoras(), 0, 0);
                fecha = rangos.get(contadorDeCiclo).getFechaIn();
                Date fechaF;
                if (horaIn.getHours() + capacidad.getHoras() >= 24) {
                    fechaF = new Date(rangos.get(contadorDeCiclo).getFechaIn().getYear(), rangos.get(contadorDeCiclo).getFechaIn().getMonth(), rangos.get(contadorDeCiclo).getFechaIn().getDate() + 1);
                } else {
                    fechaF = new Date(rangos.get(contadorDeCiclo).getFechaIn().getYear(), rangos.get(contadorDeCiclo).getFechaIn().getMonth(), rangos.get(contadorDeCiclo).getFechaIn().getDate());
                }
                rangos.clear();
                contadorDeCiclo = 0;

                rangos.add(new Rango(horaIn, horaFi, fecha, fechaF, 0, "", null));
            }

            Integer total = 0;
            for (Tamaño tamaño : tamaños) {
                for (Producto producto : tamaño.getProductos()) {
                    total += producto.getCantidad();
                }
            }

            Integer ciclos = (int) Math.ceil((double) (total / capacidad.getUnidades()));

            Integer contador = rangos.size() - 1;
            for (int i = 0; i <= ciclos; i++) {
                Date fechaIni = rangos.get(contador).getFechaFin();
                Time horaFin = rangos.get(contador).getHoraFin();

                Date fechaFin;
                if (horaFin.getHours() + capacidad.getHoras() >= 24) {
                    fechaFin = new Date(fechaIni.getYear(), fechaIni.getMonth(), fechaIni.getDate() + 1);
                } else {
                    fechaFin = new Date(fechaIni.getYear(), fechaIni.getMonth(), fechaIni.getDate());
                }
                rangos.add(new Rango(new Time(horaFin.getHours(), horaFin.getMinutes(), horaFin.getSeconds()), new Time(horaFin.getHours() + capacidad.getHoras(), horaFin.getMinutes(), horaFin.getSeconds()), rangos.get(contador).getFechaFin(), fechaFin, 0, "Rango: " + horaFin.getHours() + "-" + (horaFin.getHours() + capacidad.getHoras()), null));
                contador++;
            }

            for (Tamaño tamaño : tamaños) {

                for (Producto producto : tamaño.getProductos()) {

                    while (rangos.get(contadorDeCiclo).getCantidad() != capacidad.getUnidades() && producto.getCantidad() != 0) {

                        if (rangos.get(contadorDeCiclo).getCantidad() + producto.getCantidad() <= capacidad.getUnidades()) {
                            if (producto.getCantidad() / capacidad.getUnidades() == 1) {
                                rangos.get(contadorDeCiclo).setCantidad(producto.getCantidad());
                                rangos.get(contadorDeCiclo).setDetalle(rangos.get(contadorDeCiclo).getDetalle() + "\n" + producto.getNombre() + " " + tamaño.getNombre() + " cantidad " + producto.getCantidad());
                                rangos.get(contadorDeCiclo).setTamaño(tamaño);
                                eventosVista.add(new EventoVista(eventosVista.size() + "", producto.getNombre(), tamaño.getNombre() + "", producto.getCantidad() + "", rangos.get(contadorDeCiclo).getFechaIn() + " " + rangos.get(contadorDeCiclo).getHoraIni(), rangos.get(contadorDeCiclo).getFechaFin() + " " + rangos.get(contadorDeCiclo).getHoraFin()));
                                producto.setCantidad(0);
                                contadorDeCiclo++;

                            } else if (producto.getCantidad() / capacidad.getUnidades() < 1) {
                                rangos.get(contadorDeCiclo).setCantidad(rangos.get(contadorDeCiclo).getCantidad() + producto.getCantidad());
                                rangos.get(contadorDeCiclo).setDetalle(rangos.get(contadorDeCiclo).getDetalle() + "\n" + producto.getNombre() + " " + tamaño.getNombre() + " cantidad " + producto.getCantidad());
                                rangos.get(contadorDeCiclo).setTamaño(tamaño);
                                eventosVista.add(new EventoVista(eventosVista.size() + "", producto.getNombre(), tamaño.getNombre() + "", producto.getCantidad() + "", rangos.get(contadorDeCiclo).getFechaIn() + " " + rangos.get(contadorDeCiclo).getHoraIni(), rangos.get(contadorDeCiclo).getFechaFin() + " " + rangos.get(contadorDeCiclo).getHoraFin()));
                                producto.setCantidad(0);
                                if (rangos.get(contadorDeCiclo).getCantidad() == capacidad.getUnidades()) {
                                    contadorDeCiclo++;
                                }

                            }
                        } else {
                            Boolean noCabe = true;
                            Integer temp = producto.getCantidad();
                            while (noCabe) {
                                temp--;
                                if (temp + rangos.get(contadorDeCiclo).getCantidad() <= capacidad.getUnidades()) {
                                    rangos.get(contadorDeCiclo).setCantidad(rangos.get(contadorDeCiclo).getCantidad() + temp);

                                    producto.setCantidad(producto.getCantidad() - temp);
                                    rangos.get(contadorDeCiclo).setDetalle(rangos.get(contadorDeCiclo).getDetalle() + "\n" + producto.getNombre() + " " + tamaño.getNombre() + " cantidad " + temp);
                                    rangos.get(contadorDeCiclo).setTamaño(tamaño);
                                    eventosVista.add(new EventoVista(eventosVista.size() + "", producto.getNombre(), tamaño.getNombre() + "", temp + "", rangos.get(contadorDeCiclo).getFechaIn() + " " + rangos.get(contadorDeCiclo).getHoraIni(), rangos.get(contadorDeCiclo).getFechaFin() + " " + rangos.get(contadorDeCiclo).getHoraFin()));
                                    contadorDeCiclo++;

                                    noCabe = false;
                                }
                            }
                        }

                    }
                }

            }

        }
        return eventosVista;
    }

}
