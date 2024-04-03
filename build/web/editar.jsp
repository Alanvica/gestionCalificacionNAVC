<%@page import="com.emergentes.modelo.EstudianteNAVC"%>
<%
    EstudianteNAVC reg = (EstudianteNAVC) request.getAttribute("miobjest");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .cab{
                width: 300px;
                margin-left: auto;
                margin-right: auto;
            }
            .tit{
                width: 500px;
                margin-left: auto;
                margin-right: auto;
            }
            .con{
                width: 500px;
                margin-left: auto;
                margin-right: auto;
            }
            .non{
                display: none;
            }
        </style>
    </head>

    <body>
    <body>
        <div class="cab" >
            <table border="1">
                <tr>
                    <td>PRIMER PARCIAL TEM-742 <br> Nombre: Nelson Alan Villalba Castro <br> Carnet: 10069306</td>
                </tr>
            </table>
        </div>
        <div class="tit"><h1>GESTION DE CALIFICACIONES</h1></div>
        <div class="con">
        <form action="MainServlet" method="post">
            <table>
                <tr class="non">
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<%=reg.getId()%>" size="2" readonly></td>
                </tr>
                <tr>
                    <td>Nombre del estudiante:</td>
                    <td><input type="text" name="nombre" value="<%=reg.getNombre()%>"></td>
                </tr>
                <tr>
                    <td>Primer parcial(sobre 30 pts):</td>
                    <td><input type="text" name="p1" value="<%=reg.getP1()%>"></td>
                </tr>
                <tr>
                    <td>Segundo parcial(sobre 30 pts):</td>
                    <td><input type="text" name="p2" value="<%=reg.getP2()%>"></td>
                </tr>
                <tr>
                    <td>Examen final(sobre 40 pts):</td>
                    <td><input type="text" name="ef" value="<%=reg.getEf()%>"></td>
                </tr>
            </table>
            <input type="submit" value="Enviar">
        </form>
        </div>
    </body>
</html>
