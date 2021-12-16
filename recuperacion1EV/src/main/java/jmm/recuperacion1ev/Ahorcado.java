package jmm.recuperacion1ev;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.Normalizer;
import java.util.Arrays;

@WebServlet("/Ahorcado")
public class Ahorcado extends HttpServlet {

    Partida partida = new Partida();

    /*Método que recoge los datos ignorando si son Post o Get*/
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // se crea una sesión asociada a la petición
        //al ser sesion true, se comprueba si existe una igual. De no ser así la crea.
        //al ser sesion false, se comprueba si existe una igual. De no ser así retorna null.
        HttpSession sesion = request.getSession(true);


        if (sesion != null) {

            //se comprueba si hay solucion establecida
            //si no la hay la crea
            if (sesion.getAttribute("solucion") == null) {
                String[] soluciones = new String[4];
                soluciones[0] = "carlos";
                soluciones[1] = "javier";
                soluciones[2] = "aventura";
                soluciones[3] = "armario";

                //se escoge un elemento del array de forma aleatoria
                int numero = (int) Math.floor(Math.random() * 4 + 1);
                partida.setSolucion(soluciones[numero]);
                sesion.setAttribute("solucion", partida.getSolucion());
            }

            //puede que ya exista de antes o la acabe de crear, sea como sea, la recupera y la guarda en el string "solucion"
            partida.setSolucion((String) sesion.getAttribute("solucion"));

            if (request.getParameter("letra") != null) {

                //obtenemos la letra del formulario
                partida.setLetra(request.getParameter("letra"));

                //eliminamos las tildes
                partida.setLetra(limpiarAcentos(partida.getLetra()));

                //ignoramos mayúsculas/minúsculas
                for (int i = 0; i < partida.getSolucion().length(); i++) {
                    char letraSolucion = partida.getSolucion().charAt(i);
                    if(partida.getLetra().equalsIgnoreCase(String.valueOf(letraSolucion))){
                        partida.setLetra(String.valueOf(letraSolucion));
                    }
                }

                //si la letra está en la palabra
                if (partida.getSolucion().contains(partida.getLetra())) {
                    if (sesion.getAttribute("letrasAcertadas") == null) { //si letrasAcertadas no existe, se crea asignandole un valor
                        sesion.setAttribute("letrasAcertadas", partida.getLetra());

                    } else { //si letrasAcertadas existe, se le asigna un nuevo valor
                        partida.setLetrasAcertadas((String) sesion.getAttribute("letrasAcertadas"));
                        if (!partida.getLetrasAcertadas().contains(partida.getLetra())) { //si no contiene la letra, la añade
                            sesion.setAttribute("letrasAcertadas", partida.getLetrasAcertadas() + partida.getLetra());

                        }
                    }

                    /*
                    FORMA DE ORDENAR LAS LETRAS
                     */
                    //recupera de la clase java las letras acertadas
                    String letras = (String) sesion.getAttribute("letrasAcertadas");
                    //recupera de la clase java la palabra a adivinar
                    String solucion = (String) sesion.getAttribute("solucion");
                    //variable auxiliar
                    String auxiliar = "";

                    String[] letrasDivididas = letras.split("");
                    String[] solucionDividida = solucion.split("");

                    for (int i = 0; i < solucionDividida.length; i++) {
                        for (int j = 0; j < letrasDivididas.length; j++) {
                            if (solucionDividida[i].equals(letrasDivididas[j])){
                                auxiliar += solucionDividida[i] + " ";
                            }
                        }
                    }

                    String solucionEspaciada = "";
                    for (int i = 0; i < solucion.length(); i++) {
                        solucionEspaciada += solucion.charAt(i) + " ";
                    }

                    if (auxiliar.equals(solucionEspaciada)) {
                        auxiliar = "HAS GANADO";
                    }

                    sesion.setAttribute("letrasAcertadas", auxiliar); // j a v i e r  ||  HAS GANADO

                    request.setAttribute("letrasAcertadas", sesion.getAttribute("letrasAcertadas"));
                } else { //si la letra no está en la palabra
                    if (sesion.getAttribute("letrasErroneas") == null) { //si letrasErroneas no existe, lo crea asignandole un valor
                        sesion.setAttribute("letrasErroneas", partida.getLetra());
                    } else { //si existe le añade la nueva letra
                        partida.setLetrasErroneas((String) sesion.getAttribute("letrasErroneas"));
                        if (!partida.getLetrasErroneas().contains(partida.getLetra())) { //si no contiene la letra, la añade
                            sesion.setAttribute("letrasErroneas", partida.getLetrasErroneas() + partida.getLetra());
                            if (sesion.getAttribute("fallo") == null) {//se crea fallo con valor 1 y se asigna al atributo
                                partida.setFallo(1);
                                sesion.setAttribute("fallo", partida.getFallo());
                            } else { //se recupera el atributo fallos, se incrementa y lo vuelve a asignar
                                partida.setFallo((int) sesion.getAttribute("fallo"));
                                partida.setFallo(partida.getFallo() + 1);
                                sesion.setAttribute("fallo", partida.getFallo());

                                String auxiliar;
                                if (partida.getFallo()==6){
                                    auxiliar = "HAS PERDIDO";
                                    sesion.setAttribute("letrasErroneas", auxiliar);
                                }
                            }
                        }
                    }
                    request.setAttribute("letrasErroneas", sesion.getAttribute("letrasErroneas"));
                }
            }
            // enruta a la vista
            request.getRequestDispatcher("/vistaAhorcado.jsp").forward(request, response);
        }
    }

    //Método para eliminar tildes
    public static String limpiarAcentos(String cadena) {
        String limpio = null;
        if (cadena != null) {
            String valor = cadena;
            valor = valor.toUpperCase();
            // Normalizar texto para eliminar acentos, dieresis, cedillas y tildes
            limpio = Normalizer.normalize(valor, Normalizer.Form.NFD);
            // Quitar caracteres no ASCII excepto la ñ, interrogacion que abre, exclamacion que abre, grados, U con dieresis.
            limpio = limpio.replaceAll("[^\\p{ASCII}(N\u0303)(n\u0303)(\u00A1)(\u00BF)(\u00B0)(U\u0308)(u\u0308)]", "");
            // Regresar a la forma compuesta, para poder comparar la ñ con la tabla de valores
            limpio = Normalizer.normalize(limpio, Normalizer.Form.NFC);
        }
        return limpio;
    }
}
