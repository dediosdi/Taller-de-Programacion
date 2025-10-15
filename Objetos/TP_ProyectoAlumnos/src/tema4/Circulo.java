/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *  
 * @author juan
 */
public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        setRadio(radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        return (getRadio() * 3.14);
}
    public double calcularPerimetro(){
            return (2 * Math.PI * getRadio());

    }

    @Override
    public String toString() {
        String aux = super.toString() +"radio" + this.getRadio()+" Perimetro" + this.calcularPerimetro()+" area" + this.calcularArea();
        return aux;
    }

    
}
