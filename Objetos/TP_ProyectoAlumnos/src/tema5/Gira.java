/*
na gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).
 */
package tema5;

/**
 *
 * @author juan
 */
public class Gira extends Recitales {
    private String nombre;
    private Fechas fecha;
    private int actual;

    public Gira(String nombre, Fechas fecha, int actual, String nombreBanda, String listaTemas) {
        super(nombreBanda, listaTemas);
        this.nombre = nombre;
        this.fecha = fecha;
        this.actual = actual;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fechas getFecha() {
        return fecha;
    }

    public void setFecha(Fechas fecha) {
        this.fecha = fecha;
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }
}
