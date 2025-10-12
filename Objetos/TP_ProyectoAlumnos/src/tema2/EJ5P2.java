/*
 *5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package tema2;

import PaqueteLectura.Lector;
/**
 *
 * @author juan
 */
public class EJ5P2 {
    public static void main(String[] args) {
        /*DECLARACION DE DATOS*/
        int totalPartidos=20;
        Partido vector [] = new Partido[totalPartidos];
        String local,visitor;
        int golL,golV;
        int partidosJugados=0;
        
       
        /*P.PRINCIPAL*/
        System.out.println("VISITANTE:");
        visitor = Lector.leerString();
        while ((partidosJugados < 20) && (!visitor.equals("ZZZ"))) {
            System.out.println("LOCAL:");
            local = Lector.leerString();
            System.out.println("GOLES DEL LOCAL:");
            golL = Lector.leerInt();
            System.out.println("GOLES DEL VISITANTE:");
            golV = Lector.leerInt();
            
            vector [partidosJugados]= new Partido(local, visitor, golL, golV);
            partidosJugados++;

            System.out.println("VISITANTE:");
            visitor = Lector.leerString(); 
        }
    
        
        int i, cantRiver=0, cantBocaLocal=0;
        for (i=1; i<totalPartidos; i++){
            System.out.println(vector[i].getLocal());
            System.out.println(vector[i].getGolesLocal());
            System.out.println(vector[i].getVisitante());
            System.out.println(vector[i].getGolesVisitante());
            
            if (vector[i].getGanador().equals("river")) {
                cantRiver++;
            };
            if (vector[i].getLocal().equals("boca")){
                cantBocaLocal++;
            };
        }
        System.out.println("Partidos ganados por River" + cantRiver);
        System.out.println("Partidos ganados por Boca de Local" + cantBocaLocal);


    }
}
