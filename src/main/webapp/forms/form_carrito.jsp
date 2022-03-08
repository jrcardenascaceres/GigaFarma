<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.gigafarma.modelo.Compra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.gigafarma.modelo.Laboratorio"%>
<%@page import="com.gigafarma.modelo.Categoria"%>
<%@page import="com.gigafarma.modelo.Producto"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<div class="modal-dialog modal-xl">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="modalLabel">Carrito de la compra</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <!-- Shopping Cart -->
            <div class="shopping-cart section">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- Shopping Summery -->
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
                                    <%                                        HttpSession hs = request.getSession();
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
                            </table>
                            <!--/ End Shopping Summery -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <!-- Total Amount -->
                            <div class="total-amount">
                                <div class="row">
                                    <div class="col-lg-8 col-md-5 col-12">
                                        <div class="left">
                                            <div class="coupon">
                                                <form action="#" target="_blank">
                                                    <input name="Coupon" placeholder="Ingresa tu cupón">
                                                    <button class="btn btn-success">Aplicar</button>
                                                </form>
                                            </div>
                                            <!--div class="checkbox">
                                                <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox"> Envío (+S/10)</label>
                                            </div-->
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-7 col-12">
                                        <div class="right">
                                            Detalles del precio
                                            <ul>
                                                <li>Envío <span class="text-success">Gratis</span></li>
                                                <li class="last"><b>Subtotal de la compra <span>S/ <%=total%></span></b></li>
                                            </ul>
                                            <div class="button5">
                                                <a href="form_checkout.jsp" class="btn btn-primary">Realizar pedido</a>
                                                <a href="shop.html" class="btn btn-secondary">Seguir comprando</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Total Amount -->
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Shopping Cart -->
        </div>
    </div>
</div>
<script>
    $('.btn-number').click(function (e) {
        e.preventDefault();
        fieldName = $(this).attr('data-field');
        type = $(this).attr('data-type');
        var input = $("input[name='" + fieldName + "']");
        var currentVal = parseInt(input.val());
        if (!isNaN(currentVal)) {
            if (type == 'minus') {
                if (currentVal > input.attr('data-min')) {
                    input.val(currentVal - 1).change();
                }
                if (parseInt(input.val()) == input.attr('data-min')) {
                    $(this).attr('disabled', true);
                }
            } else if (type == 'plus') {
                if (currentVal < input.attr('data-max')) {
                    input.val(currentVal + 1).change();
                }
                if (parseInt(input.val()) == input.attr('data-max')) {
                    $(this).attr('disabled', true);
                }
            }
        } else {
            input.val(0);
        }
    });

    $('.input-number').focusin(function () {
        $(this).data('oldValue', $(this).val());
    });

    $('.input-number').change(function () {
        minValue = parseInt($(this).attr('data-min'));
        maxValue = parseInt($(this).attr('data-max'));
        valueCurrent = parseInt($(this).val());

        name = $(this).attr('name');
        if (valueCurrent >= minValue) {
            $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
            alert('Lo sentimos, se ha alcanzado el valor mínimo');
            $(this).val($(this).data('oldValue'));
        }
        if (valueCurrent <= maxValue) {
            $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
            alert('Lo sentimos, se ha alcanzado el valor máximo');
            $(this).val($(this).data('oldValue'));
        }
    });

    $(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 || // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) || // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
</script>                                                