<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>GigaFarma - Iniciar sesión</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12 mt-1">
                    <form class="card login-form" id="frmLogin">
                        <input type="hidden" name="accion" value="login" id="accion">
                        <div class="card-body">
                            <div class="text-center mb-3">
                                <img src="assets/img/logo.png" class="card-img-top" style="width: 50%; height: 40%;" alt="GigaFarma">
                                <h5 class="card-title">Iniciar sesión en GigaFarma</h5>
                            </div>
                            <div id="result"></div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="name@test.com" required>
                                <label for="usuario">Correo electrónico o usuario</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" required>
                                <label for="clave">Contraseña</label>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between bottom-content mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input width-auto" id="recuerda" name="recuerda">
                                    <label class="form-check-label" for="recuerda">Recuérdame</label>
                                </div>
                                <a class="lost-pass" href="account-password-recovery.html">¿Olvidaste tu contraseña?</a>
                            </div>
                            <div class="d-grid gap-2 mb-3">
                                <button class="btn btn-primary btn-lg" type="submit" id="btnLogin">Acceder</button>
                            </div>
                            <p class="outer-link text-center">
                                ¿No tienes una cuenta?<br>
                                <a href="register.html">Registrarse aquí</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
            <div id="foo"></div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://rawgit.com/notifyjs/notifyjs/master/dist/notify.js"></script>
        <script>
            $(document).ready(function () {
                $("#btnLogin").click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        type: "post",
                        url: "Login",
                        data: {
                            "accion": $("#accion").val(),
                            "usuario": $("#usuario").val(),
                            "clave": $("#clave").val()
                        },
                        dataType: "json",
                        beforeSend: function () {
                            $("form :input").prop("disabled", true);
                        },
                        success: function (data) {
                            console.log(data);
                            const rsp = data.respuesta;
                            var msg = rsp.mensaje;
                            var typ = rsp.tipo;
                            $.notify(msg, typ);
                            var sts = rsp.estado;
                            if (sts) {
                                setTimeout(() => { location.href = "."; }, 1000);
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
                });
            });
        </script>
    </body>
</html>