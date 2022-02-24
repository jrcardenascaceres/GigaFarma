
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
                                    actProducto()
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
        
    }
    function actProducto() {
        
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
