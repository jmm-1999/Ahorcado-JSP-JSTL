package jmm.recuperacion1ev;

import lombok.Data;

@Data
public class Partida {

    private String solucion;
    private String letra;
    private String letrasAcertadas;
    private String letrasErroneas;
    private int fallo;

    public Partida(String solucion, String letra, String letrasAcertadas, String letrasErroneas, int fallo) {
        this.solucion = solucion;
        this.letra = letra;
        this.letrasAcertadas = letrasAcertadas;
        this.letrasErroneas = letrasErroneas;
        this.fallo = fallo;
    }

    public Partida() {

    }

}
