<%@page import="com.gigafarma.modelo.VentaCliente"%>
<%@page import="com.gigafarma.dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Código</th>
                                <th>Total de compras (S/)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Negocio n = new Negocio();
                                String datos = "", leyenda = "";
                                int i = 0;
                                for (VentaCliente v : n.getComprasCliByAnio(Integer.parseInt(request.getParameter("mes")), Integer.parseInt(request.getParameter("anio")))) {
                                    datos += v.getImporte() + ",";
                                    leyenda += "'" + v.getCodCliente() + "',";
                                    i++;
                                    out.print("<tr><td>" + v.getNomCliente() + "</td><td>" + v.getCodCliente() + "</td><td>" + v.getImporte() + "</td></tr>");
                                    if (i >= 10) {
                                        break;
                                    }
                                }
                                datos = "[" + datos.substring(0, datos.length() - 1) + "]";
                                leyenda = "[" + leyenda.substring(0, leyenda.length() - 1) + "]";
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <canvas id="myChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script>
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: '<%=request.getParameter("tipo")%>', //pie, line
                data: {
                    labels: <%=leyenda%>,
                    datasets: [{
                            label: 'Total Compra (S/)',
                            data: <%=datos%>,
                            backgroundColor: [
                                'Red',
                                'Yellow',
                                'Olive',
                                'Fuchsia',
                                'Lime',
                                'Teal',
                                'Black',
                                'Purple',
                                'Blue',
                                'Silver'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 159, 70, 1)',
                                'rgba(255, 159, 80, 1)',
                                'rgba(255, 159, 90, 1)',
                                'rgba(255, 159, 100, 1)'
                            ],
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </body>
</html>
