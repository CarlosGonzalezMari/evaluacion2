<%@page import="modelos.Usuario"%>
<%@page import="modelos.Ciudad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%-- 
    Document   : eliminar
    Created on : 30-05-2020, 15:10:31
    Author     : Carlos_MDFK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Registro</title>
    </head>
    <body> <center>
        <h1>Valide que sea el usuario correcto</h1>
        <form action="" method="post">
            <% String jugador = request.getParameter("codigo");
               Usuario u = new Usuario().obtenerUsuario(jugador);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="Nombre" value="<%= u.getNombre()%>"
                                   readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido" value="<%= u.getApellido()%>" readonly="true"/></td>
                    </tr>
                    <tr>
                        <td>Edad</td>
                        <td><input type="number" name="edad" value="<%= u.getEdad()%>" readonly="true"/></td>
                    </tr>
                    <tr>
                        <td>Codigo</td>
                        <td><input type="number" name="codigo" value="<%= u.getCodigo()%>" readonly="true"/></td>
                    </tr>
                     <tr>
                        <td>Posicion</td>
                        <td><input type="text" name="posicion" value="<%= u.getPosicion()%>" readonly="true"/></td>
                    </tr>
                     <tr>
                        <td>Equipo</td>
                        <td><input type="text" name="cc" value="<%= u.getEquipo()%>" readonly="true"/></td>
                    </tr>
                     <tr>
                        <td>sueldo</td>
                        <td><input type="number" name="cc" value="<%= u.getCc()%>" readonly="true"/></td>
                    </tr>
                    <tr>
                    <% try{
                    Usuario usuario = new Usuario(); 
                    ArrayList<Usuario> usuarios = usuario.obtenerUsuarios(); 
                    %>
                    <td>Usuario</td>
                    <td>
                    <select name="usuario" readonly="true">
                        <% for(Usuario us:usuarios){%>
                        <option value="<%=us.getUsuario()%>" <% if(us.getUsuario().equals(v.getUsuario().getUsuario()))
                        {out.print("selected='selected'");}%>> 
                            <%= us.getNombre()+" "+us.getApellido() %>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                            </tr>
                    <tr>
                        <td><a href="principal.jsp">Volver</a></td>
                        <td><input type="submit" value="Eliminar"/></td>
                    </tr>
                    <input type="hidden" name="accion" value="3"/>
                </table> 
           <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
        </form></center>
    </body>
</html>
<% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
}%>
