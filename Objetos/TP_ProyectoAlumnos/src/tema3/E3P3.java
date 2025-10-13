/*
 * 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema3;

/**
 *
 * @author juan
 */
public class E3P3 { 
    public static void main(String[] args) {
        Estante  Cubiculo = new Estante();
        Libro Libro1 = new Libro("Hegel", "Rosas", new Autor("Hegel"), "23423");
        Libro Libro2 = new Libro("Mujercitas", "Otilio", new Autor("Ricardo Fort"), "444432");


        Cubiculo.AgregarLibro(Libro1);
        Cubiculo.AgregarLibro(Libro2);
        
        Libro buscado = Cubiculo.getLibroTitulo("Mujercitas");
        if (buscado != null) {
            System.out.println ("El autor es" + buscado.getPrimerAutor());
        }
    }

    
    /*Parte C ( reflexión)

    Para permitir estantes con N libros en lugar de 20 fijos, hay que:

    Agregar un constructor que reciba int N

    Usar ese N para crear el array:

    public Estante(int N) {
        setCantLibros(N);
        estante = new Libro[N];
        setCantActual(0);
}*/
}

   

 