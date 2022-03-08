
$(document).ready(function () {
    function confirma() {
        $(".eliProducto, .eliCategoria").click(function (e) {
            e.preventDefault();
            var url = $(this).attr("href");
            var id = $(this).attr("id");
            var clase = $(this).attr("class");
            if (id === "id") {
            } else {
                switch (clase) {
                    case "eliProducto":
                        eliProducto($(this).attr("value"));
                    break;
                    case "eliCategoria":
                        eliCategoria($(this).attr("value"));
                    break;
                }
            }
        });
    }

    function modales() {
        $("#regProducto, .actProducto, #verCarrito,#regCategoria, .actCategoria").click(function (e) {
            e.preventDefault();
            var url = $(this).attr("href");
            var id = $(this).attr("id");
            var clase = $(this).attr("class");
            if (url.indexOf("#") === 0) {
                $(url).modal("show");
            } else {
                $.ajax({
                    type: "get",
                    url: url,
                    success: function (response) {
                        $("#mdlGigaFarma").html(response);
                        $("#mdlGigaFarma").modal("show");
                        if (id === "regPersona") {
                        } else if (id === "regProducto") {
                            regProducto();
                        } else if (id === "regCategoria") {
                            regCategoria();
                        } else if (id === "verCarrito") {
                        } else {
                            switch (clase) {
                                case "actProducto":
                                    actProducto();
                                    break;
                                 case "actCategoria":
                                    actCategoria();
                                    break;
                                case "valor2":
                                    break;
                            }
                        }
                    }
                });
            }
        });
    }

    function regProducto() {
        $("#formProducto").validate({
            rules: {
                nombre: "required",
                categoria: "required",
                laboratorio: "required",
                precio: "required",
                cantidad: "required",
                imagen: "required"
            },
            submitHandler: function (form) {
                var formData = new FormData(form);
                $.ajax({
                    type: $(form).attr('method'),
                    enctype: "multipart/form-data",
                    url: $(form).attr('action'),
                    dataType: "json",
                    data: formData, //$(form).serialize(),
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
                            }, 1000);
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
        });
    }

    function actProducto() {
        $("#formProducto").validate({
            rules: {
                nombre: "required",
                categoria: "required",
                laboratorio: "required",
                precio: "required",
                cantidad: "required"
            },
            submitHandler: function (form) {
                var formData = new FormData(form);
                $.ajax({
                    type: $(form).attr('method'),
                    enctype: "multipart/form-data",
                    url: $(form).attr('action'),
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
                            }, 1000);
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
        });
    }

    function eliProducto(idProd) {
        $.confirm({
            title: 'Confirmar!',
            content: '¿Estás seguro de eliminar el producto?',
            buttons: {
                confirm: function () {
                    $.ajax({
                        type: 'GET',
                        url: 'Control',
                        data: {
                            accion: 'eliProducto',
                            idProducto: idProd
                        },
                        dataType: "json",
                        timeout: 600000,
                        beforeSend: function () {
                            $("body :input").prop("disabled", true);
                        },
                        success: function (data) {
                            const rsp = data.respuesta;
                            $.notify(rsp.mensaje, rsp.tipo);
                            if (rsp.estado) {
                                setTimeout(() => {
                                    location.reload();
                                }, 1000);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $.notify(errorThrown, "error");
                        },
                        complete: function () {
                            $("body :input").prop("disabled", false);
                        }
                    });
                },
                cancel: function () {
                }
            }
        });
    }
    
    function regCategoria() {
        $("#formCategoria").validate({
            rules: {
                nombre: "required",
                imagen: "required"
            },
            submitHandler: function (form) {
                var formData = new FormData(form);
                $.ajax({
                    type: $(form).attr('method'),
                    enctype: "multipart/form-data",
                    url: $(form).attr('action'),
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
                            }, 2000);
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
        });
    }

    function actCategoria() {
        $("#formCategoria").validate({
            rules: {
                nombre: "required",
            },
            submitHandler: function (form) {
                var formData = new FormData(form);
                $.ajax({
                    type: $(form).attr('method'),
                    enctype: "multipart/form-data",
                    url: $(form).attr('action'),
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
                            }, 2000);
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
        });
    }
    
    function eliCategoria(idCate) {
        $.confirm({
            title: 'Confirmar!',
            content: '¿Estás seguro de eliminar la categoria?',
            buttons: {
                confirm: function () {
                    $.ajax({
                        type: 'GET',
                        url: 'Control',
                        data: {
                            accion: 'eliCategoria',
                            idCategoria: idCate
                        },
                        dataType: "json",
                        timeout: 600000,
                        beforeSend: function () {
                            $("body :input").prop("disabled", true);
                        },
                        success: function (data) {
                            const rsp = data.respuesta;
                            $.notify(rsp.mensaje, rsp.tipo);
                            if (rsp.estado) {
                                setTimeout(() => {
                                    location.reload();
                                }, 1000);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $.notify(errorThrown, "error");
                        },
                        complete: function () {
                            $("body :input").prop("disabled", false);
                        }
                    });
                },
                cancel: function () {
                }
            }
        });
    }

    confirma();
    modales();

    $("#tblProductos").DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        },
        initComplete: function (settings, json) {
        }
    });
});
