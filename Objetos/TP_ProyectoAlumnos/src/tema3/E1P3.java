/*
 * 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s =
𝐚+𝐛+𝐜
2
. La función raíz cuadrada es Math.sqrt(#)
 */
package tema3;

/**
 *
 * @author juan
 */   
import PaqueteLectura.Lector;

public class E1P3 {
   public static void main(String[] args) {
       
       System.out.println("VALOR DE SUS 3 LADOS");
       double lado1 = Lector.leerDouble();
       double lado2 = Lector.leerDouble();
       double lado3 = Lector.leerDouble();
       
       System.out.println("COLOR DE LINEA Y COLOR DE FONDO");
       String color1 = Lector.leerString();
       String color2 = Lector.leerString();

       Triangulo tri = new Triangulo (lado1, lado2, lado3, color1, color2);
       
       System.out.println("AREA" + tri.calcularArea(lado1, lado2, lado3));
       System.out.println("PERIMETRO" + tri.calcularPerimetro(lado1, lado2, lado3));


   }
   }


