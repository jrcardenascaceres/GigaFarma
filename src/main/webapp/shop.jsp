<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>GigaFarma - Listado de productos</title>
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



        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">

                <div class="col-lg-3">
                    <ul class="list-unstyled templatemo-accordion">
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                Categorias
                                <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul class="pb-3">
                                <%
                                    Negocio n = new Negocio();
                                    ArrayList<Categoria> categorias = new ArrayList<>(n.lisCategorias());
                                    String cate = "";
                                    for (Categoria categoria : categorias) {
                                        int idCategoria = categoria.getIdCategoria();
                                        cate = "<li><a class='text-decoration-none' href='Control?accion=listprodxcategoria&idCategoria="+idCategoria+"'>"+categoria.getCategoria()+"</a></li>";
                                        out.println(cate);
                                    }
                                %>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-inline shop-top-menu pb-3 pt-1">
                                <li class="list-inline-item">
                                    <a class="h3 text-dark text-decoration-none mr-3" href="shop.jsp">Ver todos los Productos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                                <%
                                    ArrayList<Producto> productos = new ArrayList<>(n.lisProductos());
                                    String prod = "";
                                    for (Producto producto : productos) {
                                        int idProducto = producto.getID_PRODUCTO();
                                        cate = "<div class='col-md-4'>"
                                        +"<div class='card mb-4 product-wap rounded-0'>"
                                        +"<div class='card rounded-0'>"        
                                        +"<img class='card-img rounded-0 img-fluid' src='assets/img/productos/"+producto.getIMAGEN()+"' onerror=src='assets/img/productos/P00001.png'>"
                                        +"<div class='card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center'>"        
                                        +"<ul class='list-unstyled'>"        
                                        +"<li><a class='btn btn-success text-white' href='shop-single.html'><i class='far fa-heart'></i></a></li>"
                                        +"<li><a class='btn btn-success text-white mt-2' href='shop-single.html'><i class='far fa-eye'></i></a></li>"
                                        +"<li><a class='btn btn-success text-white mt-2' href='shop-single.html'><i class='fas fa-cart-plus'></i></a></li>"
                                        +"</ul>"
                                        +"</div>"       
                                        +"</div>"     
                                        +"<div class='card-body'>"
                                        +"<a href='shop-single.html' class='h3 text-decoration-none'>"+producto.getNOMBRE()+"</a>"
                                        +"<ul class='w-100 list-unstyled d-flex justify-content-between mb-0'>"
                                        +"<li>"+producto.getDESCRIPCION()+"</li>"
                                        +"<li class='pt-2'>"
                                        +"<span class='product-color-dot color-dot-red float-left rounded-circle ml-1'></span>"
                                        +"<span class='product-color-dot color-dot-blue float-left rounded-circle ml-1'></span>" 
                                        +"<span class='product-color-dot color-dot-black float-left rounded-circle ml-1'></span>"
                                        +"<span class='product-color-dot color-dot-light float-left rounded-circle ml-1'></span>"
                                        +"<span class='product-color-dot color-dot-green float-left rounded-circle ml-1'></span>"
                                        +"</li>"
                                        +"</ul>"    
                                        +"<ul class='list-unstyled d-flex justify-content-center mb-1'>"
                                        +"<li>"
                                        +"<i class='text-warning fa fa-star'></i>"
                                        +"<i class='text-warning fa fa-star'></i>"
                                        +"<i class='text-warning fa fa-star'></i>"
                                        +"<i class='text-muted fa fa-star'></i>"
                                        +"<i class='text-muted fa fa-star'></i>"
                                        +"</li>"
                                        +"</ul>"
                                        +"<p class='text-center mb-0'>S/"+producto.getPRECIO()+"</p>"
                                        +"</div>"
                                        +"</div>"
                                        +"</div>";
                                        out.println(cate);
                                    }
                                %>
                    </div>
                    
                </div>

            </div>
        </div>
        <!-- End Content -->

        <!-- Start Brands -->
        <section class="bg-light py-5">
            <div class="container my-4">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Our Brands</h1>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet.
                        </p>
                    </div>
                    <div class="col-lg-9 m-auto tempaltemo-carousel">
                        <div class="row d-flex flex-row">
                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                    <i class="text-light fas fa-chevron-left"></i>
                                </a>
                            </div>
                            <!--End Controls-->

                            <!--Carousel Wrapper-->
                            <div class="col">
                                <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel">
                                    <!--Slides-->
                                    <div class="carousel-inner product-links-wap" role="listbox">

                                        <!--First slide-->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First slide-->

                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Second slide-->

                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Third slide-->

                                    </div>
                                    <!--End Slides-->
                                </div>
                            </div>
                            <!--End Carousel Wrapper-->

                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                    <i class="text-light fas fa-chevron-right"></i>
                                </a>
                            </div>
                            <!--End Controls-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Brands-->


        <!-- Start Footer -->
        <footer class="bg-dark" id="tempaltemo_footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li>
                                <i class="fas fa-map-marker-alt fa-fw"></i> 123 Consectetur at ligula 10660
                            </li>
                            <li>
                                <i class="fa fa-phone fa-fw"></i>
                                <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope fa-fw"></i>
                                <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                            <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                            <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                            <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                            <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                            <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                            <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Home</a></li>
                            <li><a class="text-decoration-none" href="#">About Us</a></li>
                            <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                            <li><a class="text-decoration-none" href="#">FAQs</a></li>
                            <li><a class="text-decoration-none" href="#">Contact</a></li>
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
                                <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="subscribeEmail">Email address</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                            <div class="input-group-text btn-success text-light">Subscribe</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-100 bg-black py-3">
                <div class="container">
                    <div class="row pt-2">
                        <div class="col-12">
                            <p class="text-left text-light">
                                Copyright &copy; 2021 Company Name | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
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
