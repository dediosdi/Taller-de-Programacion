/*
 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
package tema2;

import tema3.Persona;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author juan
 */
public class EJ2P2 {
    
    public static void main(String[] args) {
    int i; 
    Persona [] vecP = new Persona [15]; 
    GeneradorAleatorio.iniciar();                              //inicia el generador aleatorio
    
    for (i=0; i<14; i++){
        System.out.println("Escriba el nombre de la persona");
        String name = GeneradorAleatorio.generarString(10);
        System.out.println("Escriba la edad de la persona");
        int age = GeneradorAleatorio.generarInt(99);
        System.out.println("Escriba el dni  de la persona");
        int dni = GeneradorAleatorio.generarInt(99999999);
        Persona p = new Persona (name, dni, age);
        vecP [i] = p;
        }
        
        int cant=0;
        for (i=0; i<14; i++){
            if (vecP[i].getEdad() > 65){
            cant = cant+1;
        }
        }
        System.out.println(cant);

}
}