<%@page import="com.gigafarma.modelo.Laboratorio"%>
<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%
    boolean esRegistro = request.getParameter("idProducto") == null;
    String mdlTitle = (esRegistro) ? "Registrar" : "Actualizar";
    Negocio n = new Negocio();
    String accion = "regProducto", nombre = "", descripcion = "", imagen = "";;
    int categoria = 0;
    int laboratorio = 0;
    double precio = 0.0;
    int cantidad = 0;
    int idProducto = 0;
    if (!esRegistro) {
        idProducto = Integer.parseInt(request.getParameter("idProducto"));
        Producto p = n.obtenerProductoXId(idProducto);
        if (p != null) {
            accion = "actProducto";
            nombre = p.getNOMBRE();
            descripcion = p.getDESCRIPCION();
            categoria = p.getID_CATEGORIA();
            laboratorio = p.getID_LABORATORIO();
            precio = p.getPRECIO();
            cantidad = p.getCANTIDAD();
            imagen = p.getIMAGEN();
        }
    }
%>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="modalLabel"><%=mdlTitle%> Producto</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="formProducto" action="Control" method="post" enctype="multipart/form-data">
                <input type="hidden" name="accion" value="<%=accion%>">
                <input type="hidden" name="idProducto" value="<%=idProducto%>">
                <input type="hidden" name="prevImg" value="<%=imagen%>">
                <div class="mb-3 row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>" placeholder="Nombre del producto">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="descripcion" class="col-sm-2 col-form-label">Descripción</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Describa al producto" rows="3"><%=descripcion%></textarea>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
                    <div class="col-sm-10">
                        <select class="form-select" id="categoria" name="categoria">
                            <option value="">---------Elegir---------</option>
                            <%
                                for (Categoria c : n.lisCategorias()) {
                                    String selected = (categoria == c.getIdCategoria()) ? "selected" : "";
                                    out.print("<option value='" + c.getIdCategoria() + "' " + selected + ">" + c.getCategoria() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="laboratorio" class="col-sm-2 col-form-label">Laboratorio</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="laboratorio" id="laboratorio">
                            <option value="">---------Elegir---------</option>
                            <%
                                for (Laboratorio lab : n.lisLab()) {
                                    String selected = (laboratorio == lab.getID_LABORATORIO()) ? "selected" : "";
                                    out.print("<option value='" + lab.getID_LABORATORIO() + "' " + selected + ">" + lab.getNOMBRE() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="precio" class="col-sm-2 col-form-label">Precio x Unidad</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="precio" name="precio" value="<%=precio%>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="cantidad" class="col-sm-2 col-form-label">Cantidad Disponible</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="cantidad" name="cantidad" value="<%=cantidad%>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="imagen" class="col-sm-2 col-form-label">Imagen</label>
                    <div class="col-sm-10">
                        <%
                            if (!esRegistro && !imagen.isEmpty()) {
                        %>
                        <img src="${pageContext.request.contextPath}/assets/img/productos/<%=imagen%>" alt="alt" class="img-fluid"/>
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