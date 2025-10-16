package tema5;

public class Gira extends Recital {
    private String nombreGira;
    private Fechas[] fechas;
    private int cantFechas;
    private int fechaActual;

    public Gira(String nombreGira, int cantFechas, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        setNombreGira(nombreGira);
        setFechas(new Fechas[cantFechas]);
        setCantFechas(0);
        setFechaActual(0);
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fechas[] getFechas() {
        return fechas;
    }

    public void setFechas(Fechas[] fechas) {
        this.fechas = fechas;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }

    public void agregarFecha(Fechas unaFecha) {
        getFechas()[getCantFechas()] = unaFecha;
        setCantFechas(getCantFechas() + 1);
    }

    public void actuar() {
        System.out.println("Buenas noches " + getFechas()[getFechaActual()].getCiudad());
        super.actuar();
        if (getFechaActual() < getCantFechas() - 1)
            setFechaActual(getFechaActual() + 1);
    }

    public double calcularCosto() {
        return 30000 * getCantFechas();
    }
}
