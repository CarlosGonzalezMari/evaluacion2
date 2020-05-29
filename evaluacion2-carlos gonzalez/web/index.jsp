<%-- 
    Document   : index
    Created on : 26-05-2020, 16:03:08
    Author     : Carlos_MDFK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body><center>
        <h1>Inicio de sesion</h1>
        <h2>hola</h2>
        <form action="Ingreso" method="post">   
            
            <table style="border: 1; ">
                <tr>
                    <td>Usuario</td>
                    <td><input type="text" name="usuario" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td><a href="registro.jsp">Registrar</a></td>
                    <td><input type="submit" value="ingresar"/></td>
                </tr>
            </table>
           <% if(request.getParameter("mensaje")!=null){%>
           <%=request.getParameter("mensaje") %>
           <%}%>
        </form>
        </center>
    </body>
</html>
