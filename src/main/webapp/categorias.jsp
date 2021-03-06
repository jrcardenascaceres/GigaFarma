<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                        <a class="text-light" href="#" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="#" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Top Nav -->


        <jsp:include page="includes/header.jsp" />

        <!-- Modal -->
        <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="get" class="modal-content modal-body border-0 p-0">
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="modal fade" id="mdlGigaFarma" role="dialog" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false"></div>

        <!-- Start Featured Product -->
        <section class="bg-light">
            <div class="container py-4">
                <h5>Lista de categorias</h5>
                <hr>
                <div class="float-inline">
                    <a href="forms/form_categoria.jsp?accion=registrar" id="regCategoria" class="btn btn-success"><i class="fas fa-plus"></i> Agregar</a>
                </div>
                <hr>
                <table id="tblProductos" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID_Categoria</th>
                            <th>Nombre de la Categoria</th>
                            <th>Imagen</th>                                 
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Negocio n = new Negocio();
                            ArrayList<Categoria> categorias = new ArrayList<>(n.lisCategorias());
                            for (Categoria categoria : categorias) {
                                int idCategoria = categoria.getIdCategoria();
                        %>
                        <tr>
                            <td><%=idCategoria%></td>
                            <td><%=categoria.getCategoria()%></td>
                            <td>
                                <div class="text-center">
                                    <img src="assets/img/categorias/<%=categoria.getImagen()%>" class="rounded mx-auto d-block img-fluid img-thumbnail" onerror="src='assets/img/categorias/error.jpg'" alt="alt" style="width: 60px;height: 40px;"/>
                                </div>
                            </td>
                            <td>
                                <div class="text-center">
                                    <a href="forms/form_categoria.jsp?accion=actualizar&idCategoria=<%=idCategoria%>" title="Editar" class="actCategoria"><i class="fas fa-edit btn btn-success"></i></a>
                                    <button  value="<%=idCategoria%>" class="eliCategoria"><i class="fas fa-trash-alt btn btn-danger"></i></button>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ID_Categoria</th>
                            <th>Nombre de la Categoria</th>
                            <th>Imagen</th>                             
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </section>
        <!-- End Featured Product -->


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
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Informaci??n adicional</h2>
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
                        <label class="sr-only" for="subscribeEmail">Direcci??n de correo electr??nico</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Direcci??n de correo electr??nico">
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
                                Copyright &copy; 2021 GigaFarma | Di??esado por <a rel="sponsored" href="#" target="_blank">Grupo L</a>
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
