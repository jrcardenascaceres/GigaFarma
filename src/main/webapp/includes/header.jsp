<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href=".">
            GigaFarma
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html">Acerca de</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop.html">Tienda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contacto</a>
                    </li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex">
                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                        <div class="input-group-text">
                            <i class="fa fa-fw fa-search"></i>
                        </div>
                    </div>
                </div>
                <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                    <i class="fa fa-fw fa-search text-dark mr-2"></i>
                </a>
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><%=(session.getAttribute("carrito") != null) ? session.getAttribute("cantArticulos") : ""%></span>
                </a>
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-user-circle"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
                                <%
                                    if (session.getAttribute("idUsuario") != null) {
                                %>
                                <li><a class="dropdown-item" href="form_user.jsp">Actualizar datos</a></li>
                                <li><a class="dropdown-item" href="Control?accion=cerrarSes">Cerrar Sesión</a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a class="dropdown-item" href="login.jsp">Iniciar sesión</a></li>
                                <li><a class="dropdown-item" href="register.html">Registrarse</a></li>
                                    <%}%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</nav>
<!-- Close Header -->