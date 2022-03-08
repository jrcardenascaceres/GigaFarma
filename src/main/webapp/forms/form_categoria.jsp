<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%
    boolean esRegistro = request.getParameter("idCategoria") == null;
    String mdlTitle = (esRegistro) ? "Registrar" : "Actualizar";
    Negocio n = new Negocio();
    String accion = "regCategoria", nombre = "", imagen = "";
    int idCategoria = 0;
    if (!esRegistro) {
        idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        Categoria c = n.obtenerCategoriaXCod(idCategoria);
        if (c != null) {
            accion = "actCategoria";
            nombre = c.getCategoria();
            imagen = c.getImagen();
        }
    }
%>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="modalLabel"><%=mdlTitle%> Categoria</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="formCategoria" action="Control" method="post" enctype="multipart/form-data">
                <input type="hidden" name="accion" value="<%=accion%>">
                <input type="hidden" name="idCategoria" value="<%=idCategoria%>">
                <input type="hidden" name="prevImg" value="<%=imagen%>">
                <div class="mb-3 row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>" placeholder="Nombre de la Categoria">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="imagen" class="col-sm-2 col-form-label">Imagen</label>
                    <div class="col-sm-10">
                        <%
                            if (!esRegistro && !imagen.isEmpty()) {
                        %>
                        <img src="${pageContext.request.contextPath}/assets/img/categorias/<%=imagen%>" alt="alt" class="img-fluid"/>
                        <%
                            }
                        %>
                        <input type="file" name="imagen" id="imagen" class="form-control">
                    </div>
                </div>
                <hr>
                <div class="text-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary"><%=mdlTitle%></button>
                </div>
            </form>
        </div>
    </div>
</div>