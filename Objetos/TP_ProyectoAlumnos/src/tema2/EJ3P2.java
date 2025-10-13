/*
 *3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package tema2;
import tema3.Persona;
import PaqueteLectura.Lector;
/**
 *
 * @author juan
 */
public class EJ3P2 {
    public static void main (String [] args) {
    int dias = 5; int turnos = 8;
    Persona [][] participantes = new Persona [dias][turnos];
    String nombre = "";
    int edad; int dni;int totalInscriptos=0;
    String corte = "zzz";
    int dia = 0;
    int turno = 0;
    
    
    
    while (!nombre.equals(corte) && totalInscriptos < dias * turnos) {
        System.out.println("Nombre del participante");
        nombre = Lector.leerString();
        System.out.println("DNI");
        dni = Lector.leerInt();
        System.out.println("Edad");
        edad = Lector.leerInt();
    
        Persona Actor = new Persona(); 
        Actor.setDNI(dni);
        Actor.setEdad(edad);
        Actor.setNombre(nombre);
        participantes[dia][turno]=Actor;
        totalInscriptos ++;
        
        turno++;
            if (turno == turnos) {
                turno = 0;
                dia++;
            }   
        }
        int i, j;
        for (i=0; i<5; i++){
            for (j=0; j<8; j++){
                    System.out.println("Día " + (i + 1) + ", turno " + (j + 1) + ": " + participantes[i][j].getNombre());

     
        }
    
    
    
    
    
    }}}
            



    
