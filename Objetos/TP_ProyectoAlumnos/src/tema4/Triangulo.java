/*
E1P4 B- Incluya la clase Triángulo a la jerarquía de figuras. Triángulo debe heredar de Figura
todo lo que es común y definir su constructor y sus atributos y métodos propios. Además
debe redefinir el método toString.
 */
package tema4;

/**
 *
 * @author juan
 */
public class Triangulo extends Figura {
    private double lado1,lado2,lado3;

    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    
    public double calcularArea(){
        return this.getLado1() + this.getLado2() + this.getLado3();
}
    public double calcularPerimetro(){
            return (getLado1() + getLado2() + getLado3());

    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }


    @Override
    public String toString() {
        String aux = super.toString() +"Lado 1" + this.getLado1()+"Lado 2" + this.getLado2()+"Lado 3" + this.getLado3();
        return aux;
    }
}
 