<%@page import="com.gigafarma.modelo.Laboratorio"%>
<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%
    boolean esRegistro = request.getParameter("idLaboratorio") == null;
    String mdlTitle = (esRegistro) ? "Registrar" : "Actualizar";
    Negocio n = new Negocio();
    String accion = "regLaboratorio", nombre = "", descripcion = "";;
    int idLaboratorio = 0;
    if (!esRegistro) {
        idLaboratorio = Integer.parseInt(request.getParameter("idLaboratorio"));
        Laboratorio l = n.obtenerLaboratorioXId(idLaboratorio);
        if (l != null) {
            accion = "actLaboratorio";
            nombre = l.getNOMBRE();
            descripcion = l.getDESCRIPCION();
        }
    }
%>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="modalLabel"><%=mdlTitle%> Laboratorio</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="formLaboratorio" action="Control" method="post" enctype="multipart/form-data">
                <input type="hidden" name="accion" value="<%=accion%>">
                <input type="hidden" name="idLaboratorio" value="<%=idLaboratorio%>">
                <div class="mb-3 row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>" placeholder="Nombre del laboratorio">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="descripcion" class="col-sm-2 col-form-label">Descripción</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Describa al laboratorio" rows="3"><%=descripcion%></textarea>
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