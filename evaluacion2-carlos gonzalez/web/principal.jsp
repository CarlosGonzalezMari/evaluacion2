<%-- 
    Document   : principal
    Created on : 27-05-2020, 15:44:24
    Author     : Carlos_MDFK
--%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Jugadores"%>
<%@page import="modelos.Equipo"%>
<%@page import="modelos.Estadio"%>
<%@page import="modelos.Posicion"%>
<%@page import="modelos.Ciudad"%>
<%@page import="modelos.Division"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
    </head>
     <% if(session.getAttribute("usuario")!=null){ 
        Usuario u =(Usuario) session.getAttribute("usuario");%>      
    <body>
        <center>
        <h1>Bienvenido <%= u.getNombre()+" "+u.getApellido() %></h1>
        
        <h2>Mantenedor de Jugadores</h2>
        <menu>
            <a href="principal.jsp" >Inicio</a>||<a href="ciudades.jsp">Ciudades</a>||<a href="estadios.jsp">Estadios</a>
        </menu>
        <form action="ControlVehiculo" method="post">
        <table style="border: 2px; border-width: 2px; border-collapse: collapse; border-color:  black;">
            <tr>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Edad</td>
                <td>Codigo</td>
                <td>Posicion</td>
                <td>Equipo</td>
                <td>Sueldo</td>
            </tr>
            <tr>
                <td><input type="text" name="nombre" value="" /></td>
                <td><input type="text" name="apellido" value="" /></td>
                <td><input type="number" name="edad" value="" /></td>
                <td><input type="number" name="codigo" value="" /></td>
                <td><input type="text" name="posicion" value="" /></td>
                <td><input type="number" name="equipo" value=""</td>
                <td><input type="text" name="sueldo" value=""</td>
                <td>
                    <input type="submit" value="Agregar" />
                </td>
                <td>
                    <a href="Salir">
                        <input type="button" value="Cerrar Sesion"/>
                    </a>
                </td>
            </tr>
            <tr>

        </table>
        <input type="hidden" name="accion" value="1"/>
        </form>
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>

</html>
