/*
 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 */
package tema3;

/**
 *
 * @author juan
 */
public class Estante {
    private int capacidad=20;
    private Libro Estante [] = new Libro[capacidad];
    private int librosAlmacenados=0;

    public Estante() {
    }


    public int getCantidad() {
        return librosAlmacenados;
    }
    
    

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
    
    public int getCapacidad() {
     return capacidad;
    }
    
        
    public Libro[] getEstante() {
        return Estante;
    }

    public void setEstante(Libro[] Estante) {
        this.Estante = Estante;
    }

    public int getLibrosAlmacenados() {
        return librosAlmacenados;
    }

    public void setLibrosAlmacenados(int librosAlmacenados) {
        this.librosAlmacenados = librosAlmacenados;
    }


    
    public boolean estaLleno(){
        if (this.getCapacidad()==librosAlmacenados){
            return true;
        }else{ 
            return false;
        }
        
    }
    
        
    public void AgregarLibro(Libro L){
    if (this.getLibrosAlmacenados()<this.getCapacidad()){
        Estante[librosAlmacenados]=L;
        librosAlmacenados++;
    } }

public Libro getLibroTitulo(String titulo) {
    for (int i = 0; i < librosAlmacenados; i++) {
        if (Estante[i].getTitulo().equalsIgnoreCase(titulo)) {
            return Estante[i];
        }
    }
    // Devuelve null si no se encuentra
    return null;
}



}
        
   
       
       