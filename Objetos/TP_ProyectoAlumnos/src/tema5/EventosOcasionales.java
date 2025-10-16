/*
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV
o show privado), el nombre del contratante del recital y el día del evento.
El constructor de eventos ocasionales además
recibe el motivo, el nombre del contratante y día del evento.
 */
package tema5;

/**
 *
 * @author juan
 */
public class EventosOcasionales extends Recitales{
    private String motivo;
    private String contratante;
    private String fecha;

    public EventosOcasionales(String motivo, String contratante, String fecha, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.fecha = fecha;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}
