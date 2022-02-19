<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%
    boolean esRegistro = request.getParameter("idProducto") == null;
    String mdlTitle = (esRegistro) ? "Registrar" : "Actualizar";
    Negocio n = new Negocio();
    String accion = "regProducto", nombre = "", descripcion = "", imagen = "";;
    int categoria = 0;
    int proveedor = 0;
    int cantidad = 0;
    if (!esRegistro) {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        Producto p = n.obtenerProductoXId(idProducto);
        if (p != null) {
            accion = "actProducto";
            nombre = p.getNOMBRE();
            descripcion = p.getDESCRIPCION();
            categoria = p.getID_CATEGORIA();
            proveedor = p.getID_LABORATORIO();
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
            <form action="Control">
                <div class="mb-3 row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>" placeholder="Nombre del producto">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="descripcion" class="col-sm-2 col-form-label">Descripción</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Describa al producto" rows="3"></textarea>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="categoria" name="categoria"></select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="proveedor" class="col-sm-2 col-form-label">Proveedor</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="proveedor" id="proveedor"></select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="cantidad" class="col-sm-2 col-form-label">Cantidad</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="cantidad" name="cantidad">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="imagen" class="col-sm-2 col-form-label">Imagen</label>
                    <div class="col-sm-10">
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