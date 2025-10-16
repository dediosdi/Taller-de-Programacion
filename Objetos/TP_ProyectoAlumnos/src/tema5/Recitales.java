package tema5;

public abstract class Recitales {
    private String nombreBanda;
    private String[] listaTemas;
    private int temasAgregados;

    public Recitales(String nombreBanda, int cantTemas) {
        setNombreBanda(nombreBanda);
        setListaTemas(new String[cantTemas]);
        setTemasAgregados(0);
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public int getTemasAgregados() {
        return temasAgregados;
    }

    public void setTemasAgregados(int temasAgregados) {
        this.temasAgregados = temasAgregados;
    }

    public void agregarTema(String tema) {
        listaTemas[getTemasAgregados()] = tema;
        setTemasAgregados(getTemasAgregados() + 1);
    }

    public void actuar() {
        for (int i = 0; i < getTemasAgregados(); i++) {
            System.out.println("Y ahora tocaremos... " + getListaTemas()[i]);
        }
    }

    public abstract double calcularCosto();
}
