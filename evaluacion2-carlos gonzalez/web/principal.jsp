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
                <td><input type="text" name="Nombre" value="" /></td>
                <% try{
                    Posicion pos = new Posicion(); 
                    ArrayList<Posicion> posiciones = pos.obtenerJugadores(); 
                    %>
                <td>
                    <select name="posicion">
                        <% for(Posicion p: posiciones){%>
                        <option value="<%= p.getClass()%>"> 
                            <%= p.getNombre() %>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                <% try{
                    Modelo mo = new Modelo(); 
                    ArrayList<Modelo> modelos = mo.obtenerModelos(); 
                    %>
                <td>
                    <select name="modelo">
                        <% for(Modelo m: modelos){%>
                        <option value="<%= m.getId()%>"> 
                            <%= m.getNombre() %>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                <td><input type="number" name="hp" value="" /></td>
                <td><input type="number" name="cc" value="" /></td>
                <% try{
                    Usuario usuario = new Usuario(); 
                    ArrayList<Usuario> usuarios = usuario.obtenerUsuarios(); 
                    %>
                <td>
                    <select name="usuario">
                        <% for(Usuario us:usuarios){%>
                        <option value="<%=us.getUsuario()%>"> 
                            <%= us.getNombre()+" "+us.getApellido() %>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                <td>XXXXXXX</td>
                <td>
                    <input type="submit" value="Agregar" />
                </td>
                <td>
                    <a href="Salir">
                        <input type="button" value="Cerrar Sesion"/>
                    </a>
                </td>
            </tr>
                
                
            
            <% ArrayList<Vehiculo> vehiculos= new Vehiculo().obtenerVehiculos();
               
            for(Vehiculo v:vehiculos){
            %>
            <tr>
                <td><%= v.getPatente()%></td>
                <td><%= v.getModelo().getMarca().getNombre() %></td>
                <td><%= v.getModelo().getNombre() %></td>
                <td><%= v.getHp()%></td>
                <td><%= v.getCc()%></td>
                <td><%= v.getUsuario().getNombre()+" "+v.getUsuario().getApellido()  %></td>
                <td><%= v.getRendimiento()+"km/Lt"%></td>
                <td><a href="modificarV.jsp?patente=<%=v.getPatente()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarV.jsp?patente=<%=v.getPatente()%>">
                        <input type="button" value="Eliminar" />
                    </a>
                </td>
            </tr>
            <% } %>
        </table>
        <input type="hidden" name="accion" value="1"/>
        </form>
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
