/*2- Queremos representar a los empleados de un club: jugadores y entrenadores.
 Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
 Los jugadores son empleados que se caracterizan por el número de partidos
jugados y el número de goles anotados.
 Los entrenadores son empleados que se caracterizan por la cantidad de
campeonatos ganados.
A- Implemente la jerarquía de clases declarando atributos, métodos para
obtener/modificar su valor y constructores que reciban los datos necesarios.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
  */
package tema4;

/**
 *
 * @author juan
 */
public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        setCampeonatos(campeonatos);
    }
    
    
    
  
    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    
    public double calcularEfectividad(){
       double promedio = this.getCampeonatos()/this.getAntiguedad();
    return promedio;
}

    }
