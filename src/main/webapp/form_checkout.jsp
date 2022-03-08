<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>GigaFarma: La salud es primero</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <%@include file="includes/cssheader.jsp" %>
    </head>
    <body>
        <!-- Start Top Nav -->
        <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
            <div class="container text-light">
                <div class="w-100 d-flex justify-content-between">
                    <div>
                        <i class="fa fa-envelope mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        <i class="fa fa-phone mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                    </div>
                    <div>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Top Nav -->

        <jsp:include page="includes/header.jsp" />
        <div class="container">
            <form action="Control" method="POST">
                <legend>Información personal</legend>
                <div class="mb-3">
                    <label for="correo" class="form-label">Correo electrónico</label>
                    <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp">
                    <%
                        if (session.getAttribute("idUsuario") == null) {
                    %>
                    <div id="emailHelp" class="form-text">¿Ya tienes una cuenta? <a href="login.jsp">Iniciar Sesión</a></div>
                    <%
                        }
                    %>
                </div>
                <legend>Direcciòn de envio</legend>
                <div class="row">
                    <div class="mb-3 col-6">
                        <label for="nombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" id="nombres" name="nombres">
                    </div>
                    <div class="mb-3 col-6">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos">
                    </div>
                    <div class="mb-3 col-4">
                        <label for="distrito" class="form-label">Distrito</label>
                        <input type="text" class="form-control" id="distrito" name="distrito">
                    </div>
                    <div class="mb-3 col-4">
                        <label for="provincia" class="form-label">Provincia</label>
                        <input type="text" class="form-control" id="provincia" name="provincia">
                    </div>
                    <div class="mb-3 col-4">
                        <label for="departamento" class="form-label">Departamento</label>
                        <input type="text" class="form-control" id="departamento" name="departamento">
                    </div>
                    <div class="mb-3 col-12">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion">
                    </div>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <!-- Start Footer -->
        <footer class="bg-dark" id="tempaltemo_footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-success border-bottom pb-3 border-light logo">GigaFarma</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li>
                                <i class="fas fa-map-marker-alt fa-fw"></i> Av. Arequipa 265, Cercado de Lima
                            </li>
                            <li>
                                <i class="fa fa-phone fa-fw"></i>
                                <a class="text-decoration-none" href="tel:013159610">(01) 3159610</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope fa-fw"></i>
                                <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Productos</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Medicinas</a></li>
                            <li><a class="text-decoration-none" href="#">Cuidado Personal</a></li>
                            <li><a class="text-decoration-none" href="#">Vitaminas y Suplementos</a></li>
                            <li><a class="text-decoration-none" href="#">Belleza</a></li>
                            <li><a class="text-decoration-none" href="#">Oferta</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Información adicional</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Inicio</a></li>
                            <li><a class="text-decoration-none" href="#">Acerca de</a></li>
                            <li><a class="text-decoration-none" href="#">Tienda</a></li>
                            <li><a class="text-decoration-none" href="#">Contactos</a></li>
                            <li><a class="text-decoration-none" href="#">Preguntas frecuentes</a></li>
                        </ul>
                    </div>

                </div>

                <div class="row text-light mb-4">
                    <div class="col-12 mb-3">
                        <div class="w-100 my-3 border-top border-light"></div>
                    </div>
                    <div class="col-auto me-auto">
                        <ul class="list-inline text-left footer-icons">
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="#"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="#"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="#"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="#"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="subscribeEmail">Dirección de correo electrónico</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Dirección de correo electrónico">
                            <div class="input-group-text btn-success text-light">Subscribirse</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-100 bg-black py-3">
                <div class="container">
                    <div class="row pt-2">
                        <div class="col-12">
                            <p class="text-left text-light">
                                Copyright &copy; 2021 GigaFarma | Diñesado por <a rel="sponsored" href="#" target="_blank">Grupo L</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </footer>
        <!-- End Footer -->
        <%@include file="includes/jsfooter.jsp" %>
    </body>
</html>