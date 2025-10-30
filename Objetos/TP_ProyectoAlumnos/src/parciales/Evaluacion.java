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
public abstract class Evaluacion {
    private Examen examen;
    private Entrega entrega [] = new Entrega [9];

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }

    public Entrega[] getEntrega() {
        return entrega;
    }

    public void setEntrega(Entrega[] entrega) {
        this.entrega = entrega;
    }


    }

