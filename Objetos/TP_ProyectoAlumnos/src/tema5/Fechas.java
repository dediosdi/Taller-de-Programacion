package tema5;

public class Fechas {
    private String ciudad;
    private String dia;

    public Fechas(String ciudad, String dia) {
        setCiudad(ciudad);
        setDia(dia);
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
}
