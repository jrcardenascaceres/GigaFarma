
$(document).ready(function () {
    function modales() {
        $("#regProducto, .actProducto").click(function (e) {
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
                        } else {
                            switch (clase) {
                                case "actProducto":
                                    actProducto();
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
                    data: formData,//$(form).serialize(),
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

    $("#tblProductos").DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        },
        drawCallback: function (settings) {
            modales();
        },
        initComplete: function (settings, json) {
            modales();
        }
    });
});
