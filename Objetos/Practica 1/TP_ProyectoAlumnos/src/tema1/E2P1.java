/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 */
package tema1;

import PaqueteLectura.Lector;

/**
 * 2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
 * básquet y las almacene en un vector. Luego informe:
 * - la altura promedio
 * - la cantidad de jugadores con altura por encima del promedio
 */

public class E2P1 {

    public static void main(String[] args) {
        // Paso 2 y 3: Declarar y crear el vector de double para 15 jugadores
        double alturas[] = new double[15];

        // Paso 4: Variables auxiliares
        int cantAlt = 0;
        double total = 0;
        double promedio = 0;

        // Paso 6: Leer alturas y calcular la suma total
        for (int i = 0; i < 15; i++) {
            System.out.print("Ingrese la altura del jugador " + (i + 1) + ": ");
            alturas[i] = Lector.leerDouble();
            total += alturas[i];
        }

        // Paso 7: Calcular promedio
        promedio = total / 15;

        // Paso 8: Contar jugadores con altura por encima del promedio
        for (int i = 0; i < 15; i++) {
            if (alturas[i] > promedio) {
                cantAlt += 1;
            }
        }

        // Paso 9: Informar resultados
        System.out.println("\nPromedio de altura: " + promedio);
        System.out.println("Cantidad de jugadores por encima del promedio: " + cantAlt);
    }
}
