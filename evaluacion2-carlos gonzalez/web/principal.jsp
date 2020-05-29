<%-- 
    Document   : principal
    Created on : 27-05-2020, 15:44:24
    Author     : Carlos_MDFK
--%>

<%@page import="jugadores.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jugadores.Jugadores"%>
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
        <a href="Salir"><input type="button" value="Cerrar Sesion"/></a>
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
