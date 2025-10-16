package tema5;

public class EventosOcasionales extends Recitales {
    private String motivo;
    private String contratante;
    private String diaEvento;

    public EventosOcasionales(String motivo, String contratante, String diaEvento, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        setMotivo(motivo);
        setContratante(contratante);
        setDiaEvento(diaEvento);
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

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }

    public void actuar() {
        if (getMotivo().equalsIgnoreCase("beneficencia")) {
            System.out.println("Recuerden colaborar con " + getContratante());
        } else if (getMotivo().equalsIgnoreCase("TV")) {
            System.out.println("Saludos amigos televidentes");
        } else if (getMotivo().equalsIgnoreCase("privado")) {
            System.out.println("Un feliz cumpleaños para " + getContratante());
        }
        super.actuar();
    }

    public double calcularCosto() {
        double costo = 0;
        if (getMotivo().equalsIgnoreCase("TV"))
            costo = 50000;
        else if (getMotivo().equalsIgnoreCase("privado"))
            costo = 150000;
        // Si es a beneficio, devuelve 0
        return costo;
    }
}
