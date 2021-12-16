<%--
  Created by IntelliJ IDEA.
  User: 2daw
  Date: 01/12/2021
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jmm.recuperacion1ev.Ahorcado"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="css/vistaAhorcado.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--Iconos Fontawesome-->
    <script src="https://kit.fontawesome.com/f33f57c2f7.js" crossorigin="anonymous"></script>
    <style>
        /*ESTILO DE LAS IMÁGENES*/
        #seis {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') 0 0;
        }
        #cinco {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -78.15px 0;
        }
        #cuatro {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -156.30px 0;
        }
        #tres {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -234.45px 0;
        }
        #dos {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -312.60px 0;
        }
        #uno {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -390.75px 0;
        }
        #cero {
            width: 78.15px;
            height: 92px;
            border: 1px black solid;
            background: url('recursos/ahorcados.jpg') -468.90px 0;
        }
    </style>
    <title>Recuperación 1EV. JSP Y JSTL</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <header class="col-12 col-lg-12 col-md-12 col-sm-12">
                <div class="row">
                    <article class="col-4 col-lg-4 col-md-4 col-sm-4">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="#imagenArticle">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#quienesSomos">¿Quiénes somos?</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" data-bs-target="#buttonNuestrosJuegosDropdown" aria-haspopup="true" aria-expanded="false">
                                            Nuestros juegos
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="buttonNuestrosJuegosDropdown">
                                            <a class="dropdown-item" href="#">Estrategia</a>
                                            <a class="dropdown-item" href="#">Clásicos</a>
                                            <a class="dropdown-item" href="#">Juegos de mesa</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </article>
                    <article id="titulo" class="col-7 col-lg-7 col-md-6 col-sm-6">
                        <h3>BIENVENIDO A SOLOJUEGOS.COM</h3>
                    </article>
                </div>
            </header>
        </div>

        <main class="">
            <div class="row">
                <article class="" id="imagenArticle" name="imagenArticle">
                    <img class="img-fluid" src="images/juegos.jpg" alt="juegos" width="100%">
                </article>
            </div>
            <section class="" id="ahorcado">
                <div class="row">
                    <section class="col-12 col-lg-4 col-md-4 col-sm-12">
                        <article id="imagenAhorcado">
                            <img class="img-fluid" src="images/ahorcado.jpg" height="100%" width="100%"/>
                        </article>
                    </section>
                    <section class="col-12 col-lg-8 col-md-8 col-sm-12">
                        <h2 style="text-align: center">JUEGO DEL AHORCADO</h2>
                        <article id="formulario">
                            <form action="Ahorcado" method="get" >

                                <!--Aqui se pintan las imágenes -->
                                <article id="">
                                    <c:choose>

                                        <c:when test = "${fallo == 0}">
                                            <c:set var = "imagen" value = "cero"/>
                                        </c:when>

                                        <c:when test = "${fallo == 1}">
                                            <c:set var = "imagen" value = "uno"/>
                                        </c:when>

                                        <c:when test = "${fallo == 2}">
                                            <c:set var = "imagen" value = "dos"/>
                                        </c:when>

                                        <c:when test = "${fallo == 3}">
                                            <c:set var = "imagen" value = "tres"/>
                                        </c:when>

                                        <c:when test = "${fallo == 4}">
                                            <c:set var = "imagen" value = "cuatro"/>
                                        </c:when>

                                        <c:when test = "${fallo == 5}">
                                            <c:set var = "imagen" value = "cinco"/>
                                        </c:when>

                                        <c:when test = "${fallo == 6}">
                                            <c:set var = "imagen" value = "seis"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var = "imagen" value = "cero"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <img id="${imagen}" src="recursos/FFFFFF.png" alt="ahorcado"/>
                                    <h3>FALLOS: ${fallo}</h3>
                                </article>
                                <br>
                                <br>
                                <br>
                                <h6>Palabra escogida... Introduce una letra cuando quieras empezar a jugar.</h6>
                                <h6>Restan
                                    <c:forEach var="intentos" items="${intentos}">
                                        <c:out value="${intentos}"></c:out>
                                    </c:forEach>
                                    intentos
                                </h6>
                                <h4>
                                    <input type="text" id="letra" name="letra" placeholder="Letra...">
                                    <input type="submit" value="Comprobar">
                                </h4>
                                <c:if test = "${letra == letrasAcertadas}">
                                    <span value="${mensaje}"></span>
                                </c:if>
                                <div class="row">
                                    <article id="palabraAdivinar" class="col-12 col-lg-4 col-md-4 col-sm-4">
                                        <h5>Palabra a adivinar: </h5>
                                        <c:forEach var="solucion" items="${solucion}">
                                            <c:out value="${solucion}"></c:out>
                                        </c:forEach>
                                    </article>
                                    <article id="letrasCorrectas" class="col-12 col-lg-4 col-md-4 col-sm-4">
                                        <h5>Letras correctas</h5>
                                        <c:forEach var="letrasAcertadas" items="${letrasAcertadas}">
                                            <c:out value="${letrasAcertadas}"></c:out>

                                            <c:if test="${letrasAcertadas == 'HAS GANADO'}">
                                                <br><br><button value="<%request.getSession().invalidate();%>">Jugar de nuevo</button>
                                            </c:if>
                                        </c:forEach>
                                    </article>
                                    <article id="letrasErroneas" class="col-12 col-lg-4 col-md-4 col-sm-4">
                                        <h5>Letras falladas</h5>
                                        <c:forEach var="letrasErroneas" items="${letrasErroneas}">
                                            <c:out value="${letrasErroneas}"></c:out>

                                            <c:if test="${letrasErroneas == 'HAS PERDIDO'}">
                                                <br><br><button value="<%request.getSession().invalidate();%>">Jugar de nuevo</button>
                                            </c:if>
                                        </c:forEach>
                                    </article>
                                </div>
                            </form>
                        </article>
                    </section>
                </div>
            </section>
            <div class="row">
                <section class="col-12 col-lg-8 col-md-8 col-sm-8" id="quienesSomos" name="quienesSomos">
                    <h5 class="text-uppercase">¿Quiénes somos?</h5>

                    <p>
                        SOLOJUESGOS.COM fue fundado y creado por Javier Martinez en 2021 debido a la necesidad que éste tenía
                        por recuperar la primera evaluación de desarrollo en entorno servidor.
                        <br>
                        El primer juego que hemos desarrollado es el ahorcado versión jsp, pero en próximas actualizaciones
                        los usuarios también podrán jugar al ahorcado versión Spring, siendo toda una novedad.
                    </p>
                </section>
            </div>

        </main>
        <div class="row">
            <footer class="text-center text-white">
                <!-- Grid container -->
                <div class="container pt-4">
                    <!-- Section: Social media -->
                    <section class="mb-4">
                        <!-- Facebook -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://facebook.com"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-facebook-f"></i
                        ></a>

                        <!-- Twitter -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://twitter.com"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-twitter"></i
                        ></a>

                        <!-- Google -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://google.com"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-google"></i
                        ></a>

                        <!-- Instagram -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://instagram.com"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-instagram"></i
                        ></a>

                        <!-- Linkedin -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://linkedin.com"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-linkedin"></i
                        ></a>
                        <!-- Github -->
                        <a
                                class="btn btn-link btn-floating btn-lg text-dark m-1"
                                href="https://github.com/jmm-1999/"
                                role="button"
                                data-mdb-ripple-color="dark"
                        ><i class="fab fa-github"></i
                        ></a>
                    </section>
                    <!-- Section: Social media -->
                </div>
                <!-- Grid container -->

                <!-- Copyright -->
                <div class="text-center text-dark p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    © 2021 Copyright:
                    <a class="text-dark" href="https://mdbootstrap.com/">Javier Martinez</a>
                </div>
                <!-- Copyright -->
            </footer>
        </div>
    </div>
</body>

<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</html>
