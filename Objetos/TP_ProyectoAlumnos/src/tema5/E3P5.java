package tema5;

public class E3P5 {
    public static void main(String[] args) {
        EventosOcasionales e = new EventosOcasionales("privado", "Juan Pérez", "15/10", "Los Auténticos", 3);
        e.agregarTema("Tema 1");
        e.agregarTema("Tema 2");
        e.agregarTema("Tema 3");

        System.out.println("Costo del evento ocasional: $" + e.calcularCosto());
        e.actuar();

        System.out.println();

        Gira g = new Gira("Tour 2025", 2, "La Renga", 2);
        g.agregarTema("El final es en donde partí");
        g.agregarTema("Panic Show");
        g.agregarFecha(new Fecha("La Plata", "20/10"));
        g.agregarFecha(new Fecha("Mar del Plata", "25/10"));

        System.out.println("Costo de la gira: $" + g.calcularCosto());
        g.actuar();
        g.actuar(); // segunda fecha
    }
}
