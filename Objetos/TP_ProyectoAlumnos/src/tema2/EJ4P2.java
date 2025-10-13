package tema2;
import tema3.Persona;
import PaqueteLectura.Lector;

public class EJ4P2 {
    public static void main(String[] args) {
        int dias = 5;
        int turnos = 8;
        Persona[][] participantes = new Persona[dias][turnos];
        int[] turnosOcupados = new int[dias]; // cuántos turnos tiene llenos cada día
        int totalInscriptos = 0;
        String corte = "ZZZ";

        System.out.println("Nombre del participante (ZZZ para finalizar): ");
        String nombre = Lector.leerString();

        while (!nombre.equals(corte) && totalInscriptos < dias * turnos) {
            System.out.println("DNI:");
            int dni = Lector.leerInt();
            System.out.println("Edad:");
            int edad = Lector.leerInt();
            System.out.println("Día de inscripción (1 a 5):");
            int diaInscripcion = Lector.leerInt();

            if (diaInscripcion < 1 || diaInscripcion > dias) {
                System.out.println("Día inválido. Debe ser entre 1 y 5.");
            } else if (turnosOcupados[diaInscripcion - 1] == turnos) {
                System.out.println("No hay más turnos disponibles ese día.");
            } else {
                Persona actor = new Persona();
                actor.setDNI(dni);
                actor.setEdad(edad);
                actor.setNombre(nombre);

                int turnoLibre = turnosOcupados[diaInscripcion - 1];
                participantes[diaInscripcion - 1][turnoLibre] = actor;
                turnosOcupados[diaInscripcion - 1]++;
                totalInscriptos++;
            }

            if (totalInscriptos < dias * turnos) {
                System.out.println("\nNombre del participante (ZZZ para finalizar): ");
                nombre = Lector.leerString();
            }
        }

        System.out.println("\nRESUMEN DE INSCRIPCIONES:");
        for (int d = 0; d < dias; d++) {
            System.out.println("Día " + (d + 1) + ": " + turnosOcupados[d] + " inscriptos");
            for (int t = 0; t < turnosOcupados[d]; t++) {
                System.out.println("  Turno " + (t + 1) + ": " + participantes[d][t].getNombre());
            }
        }
    }
}
