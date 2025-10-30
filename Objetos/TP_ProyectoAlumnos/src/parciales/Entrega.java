/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales;

/**
 *
 * @author juan
 */
public class Entrega extends Evaluacion {
    private String Docente;
    private String fecha;
    private int nP, nC, nO;

    public Entrega(String Docente, String fecha, int nP, int nC, int nO) {
        this.Docente = Docente;
        this.fecha = fecha;
        this.nP = nP;
        this.nC = nC;
        this.nO = nO;
    }

    public String getDocente() {
        return Docente;
    }

    public void setDocente(String Docente) {
        this.Docente = Docente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getnP() {
        return nP;
    }

    public void setnP(int nP) {
        this.nP = nP;
    }

    public int getnC() {
        return nC;
    }

    public void setnC(int nC) {
        this.nC = nC;
    }

    public int getnO() {
        return nO;
    }

    public void setnO(int nO) {
        this.nO = nO;
    }
    
}
