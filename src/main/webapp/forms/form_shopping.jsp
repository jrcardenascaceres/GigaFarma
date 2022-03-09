<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.gigafarma.modelo.Compra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.gigafarma.modelo.Laboratorio"%>
<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="modalLabel">Flujo de compra en linea</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <%
                HttpSession hs = request.getSession();
                if (hs.getAttribute("carrito") != null) {
            %>
            <form id="wizard-form" action="#">
                <h1>Carrito</h1>
                <fieldset>
                    <table class="table shopping-summery">
                        <thead>
                            <tr class="main-hading">
                                <th colspan="2">Nombre del producto</th>
                                <th>Precio unitario</th>
                                <th>Cantidad</th>
                                <th>Total</th> 
                                <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Compra> compras = (ArrayList<Compra>) hs.getAttribute("carrito");
                                int item = 0;
                                double total = 0;
                                for (Compra cmpr : compras) {
                            %>
                            <tr>
                                <td class="image" data-title="No"><img src="${pageContext.request.contextPath}/assets/img/productos/<%=cmpr.getIMAGEN()%>" alt="#" class="img-fluid" width="100px" height="100px"></td>
                                <td class="product-des" data-title="Description">
                                    <p class="product-name"><a href="#"><%=cmpr.getNOMBRE()%></a></p>
                                    <p class="product-des"><%=cmpr.getDESCRIPCION()%></p>
                                </td>
                                <td class="price" data-title="Price"><span>S/ <%=cmpr.getPRECIO()%></span></td>
                                <td class="qty" data-title="Qty">
                                    <!-- Input Order -->
                                    <div class="input-group">
                                        <div class="button minus">
                                            <button type="button" class="btn btn-number" data-type="minus" data-field="quant[<%=item%>]">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" name="quant[<%=item%>]" class="input-number" data-min="1" data-max="<%=cmpr.getCANTIDAD()%>" value="<%=cmpr.getCantidad()%>">
                                        <div class="button plus">
                                            <button type="button" class="btn btn-number" data-type="plus" data-field="quant[<%=item%>]">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>                                            
                                    <!--/ End Input Order -->
                                </td>
                                <td class="total-amount" data-title="Total">S/ <span><%=cmpr.total()%></span></td>
                                <td class="action" data-title="Remove"><a href="Control?accion=eliProdDCanasta&index=<%=item%>"><i class="ti-trash remove-icon"></i></a></td>
                            </tr>
                            <%
                                    total += cmpr.total();
                                    item++;
                                }
                            %>
                        </tbody>
                        <tfoot>
                            <tr class="main-hading">
                                <th colspan="4">Subtotal de la compra</th>
                                <th>S/ <%=total%></th>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="float-start">
                        <a href="shop.jsp" class="btn btn-secondary">Seguir comprando</a>
                    </div>
                </fieldset>
                <h1>Información de envío</h1>
                <fieldset>
                    <div class="row">
                        <div class="mb-3 col-12">
                            <label for="correo" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp">
                            <%
                                if (session.getAttribute("idUsuario") == null) {
                            %>
                            <div id="emailHelp" class="form-text">¿Ya tienes una cuenta? <a href="login.jsp">Iniciar sesión</a></div>
                            <%
                                }
                            %>
                        </div>
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
                        <div class="col-12">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion">
                        </div>
                    </div>
                </fieldset>
                <h1>Metodo de envío</h1>
                <fieldset>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="metodo_envio" id="domicilio" value="Envío a domicilio">
                        <label class="form-check-label" for="domicilio">Envío a domicilio</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="metodo_envio" id="tienda" value="Recojo en tienda">
                        <label class="form-check-label" for="tienda">Recojo en tienda</label>
                    </div>
                </fieldset>
                <h1>Metodo de pagó</h1>
                <fieldset>
                    <div class="row">
                        <div class="mb-3 col-12">
                            <label for="num_trjt" class="form-label">Número de tarjeta</label>
                            <input type="text" class="form-control" id="num_trjt" name="num_trjt">
                        </div>
                        <div class="mb-3 col-5">
                            <label for="nom_trjt" class="form-label">Nombre de tarjeta</label>
                            <input type="text" class="form-control" id="nom_trjt" name="nom_trjt">
                        </div>
                        <div class="mb-3 col-4">
                            <label for="fexpiracion" class="form-label">Expira</label>
                            <input type="text" class="form-control" id="fexpiracion" name="fexpiracion">
                        </div>
                        <div class="mb-3 col-3">
                            <label for="cseguridad" class="form-label">Código de seguridad</label>
                            <input type="text" class="form-control" id="cseguridad" name="cseguridad">
                        </div>

                    </div>
                </fieldset>
                <h1>Confirmación de compra</h1>
                <fieldset>
                    <div class="container-fluid">
                        <ul class="list-group">
                            <li class="list-group-item"><label>Dirección de envío:</label> <span id="direnvio"></span></li>
                            <li class="list-group-item"><label>Metodo de envío:</label> <span id="menvio"></span></li>
                            <li class="list-group-item"><label>Metodo de pagó:</label> <span id="mpago"></span></li>
                        </ul>
                    </div>
                </fieldset>
                <input type="hidden" name="accion" value="regVenta">
            </form>
            <%
                } else {
                    out.print("No hay productos en el carro");
                }
            %>
        </div>
    </div>
</div>
<script src="assets/js/shopping.js"></script>
<script>
    $(document).ready(function () {
        var form = $("#wizard-form");
        $(form).steps({
            bodyTag: "fieldset",
            labels: {
                finish: "Finalizar",
                next: "Siguiente",
                previous: "Anterior"
            },
            onStepChanging: function (event, currentIndex, newIndex) {
                if (currentIndex > newIndex) {
                    return true;
                }
                if (newIndex == 4) {
                    $("#direnvio").html($("#direccion").val() + " | " + $("#distrito").val() + " - " + $("#provincia").val() + " - " + $("#departamento").val());
                    $("#menvio").html($("input:radio[name='metodo_envio']:checked").val());
                    $("#mpago").html("Tarjeta");
                }
                form.validate().settings.ignore = ":disabled,:hidden";
                return form.valid();
            },
            onFinishing: function (event, currentIndex) {
                // form.validate().settings.ignore = ":disabled";
                form.validate().settings.ignore = ":disabled,:hidden";
                return form.valid();
            },
            onFinished: function (event, currentIndex) {
                var formData = new FormData($("#wizard-form")[0]);
                $.ajax({
                    type: "POST",
                    enctype: "multipart/form-data",
                    url: "Control",
                    dataType: "json",
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    beforeSend: function () {
                        $("form :input").prop("disabled", true);
                    },
                    success: function (data) {
                        const rsp = data.respuesta;
                        $.notify(rsp.mensaje, rsp.tipo);
                        if (rsp.estado) {
                            $("#mdlGigaFarma").modal("hide");
                            setTimeout(() => {
                                location.reload();
                            }, 3000);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $.notify(errorThrown, "error");
                    },
                    complete: function () {
                        $("form :input").prop("disabled", false);
                    }
                });
            }
        }).validate({
            errorPlacement: function errorPlacement(error, element) {
                element.before(error);
            },
            rules: {
                correo: "required",
                nombres: "required",
                apellidos: "required",
                distrito: "required",
                provincia: "required",
                departamento: "required",
                direccion: "required",
                metodo_envio: "required",
                num_trjt: "required",
                nom_trjt: "required",
                fexpiracion: "required",
                cseguridad: "required"
            },
            messages: {
            }
        });
    });
</script>                                                