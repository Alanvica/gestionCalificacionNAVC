<%@page import="com.emergentes.modelo.EstudianteNAVC"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listaest") == null) {
        ArrayList<EstudianteNAVC> lisaux = new ArrayList<EstudianteNAVC>();
        session.setAttribute("listaest", lisaux);
    }
    ArrayList<EstudianteNAVC> lista = (ArrayList<EstudianteNAVC>) session.getAttribute("listaest");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                width: 600px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        <div class="cab" >
            <table border="1">
                <tr>
                    <td>PRIMER PARCIAL TEM-742 <br> Nombre: Nelson Alan Villalba Castro <br> Carnet: 10069306</td>
                </tr>
            </table>
        </div>
        <div class="tit"><h1>GESTION DE CALIFICACIONES</h1></div>
        <div class="con" >
        <a href="MainServlet?op=nuevo"><input type="button" value="NUEVO" ></a> 

        <table border="1">
            <tr>
                <th>id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>EF(40)</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null) {
                    for (EstudianteNAVC item : lista) {

            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getP1()%></td>
                <td><%= item.getP2()%></td>
                <td><%= item.getEf()%></td>
                <td><%= item.getP1() + item.getP2() + item.getEf()%></td>
                <td> <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a> </td>
                <td> <a href="MainServlet?op=eliminar&id=<%= item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a> </td>
            </tr>
            <%
                    }
                }
            %>
            </div>
    </body>
</html>
