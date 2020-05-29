
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jugadores.Usuario;


@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        String accion = request.getParameter("accion");
        
        switch(accion){
            case "1": ingresar(request,response);
            break;
            case "2": modificar(request,response);
            break;
            case "3": eliminar(request,response);
            break;
        }
        
        
        }
        catch(Exception e){
            response.sendRedirect("registro.jsp?mensaje=Complete todos los campos");
        }
    }
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String usuario = request.getParameter("usuario").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String password = request.getParameter("password").trim();
        Usuario u = new Usuario(usuario,nombre,apellido,password);
        ArrayList<Usuario> usuarios;
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("usuarios")!=null){
            usuarios = (ArrayList) sesion.getAttribute("usuarios");
        }else{
            usuarios = new ArrayList();
        }
        Usuario validado = validar2(u,usuarios);
        int flag = 0;
        if(validado.getPassword().equals(u.getPassword())){
            flag=1;
        }
        if(validado!=null){
            validado.setNombre(u.getNombre());
            validado.setApellido(u.getApellido());
            validado.setPassword(u.getPassword());
            sesion.setAttribute("usuarios", usuarios);
            if(flag==1){
            response.sendRedirect("principal.jsp?mensaje=Usuario modificado");
            }else{
                response.sendRedirect("Salir");
            }
        }else{
            response.sendRedirect("principal.jsp?mensaje=Usuario no existe");
        }
    }
    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String usuario = request.getParameter("usuario").trim();
        Usuario u = new Usuario();
        u.setUsuario(usuario);
        ArrayList<Usuario> usuarios;
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("usuarios")!=null){
            usuarios = (ArrayList) sesion.getAttribute("usuarios");
        }else{
            usuarios = new ArrayList();
        }
       u = validar2(u,usuarios);
        if(u!=null){
            usuarios.remove(u);
            sesion.setAttribute("usuarios", usuarios);
            response.sendRedirect("principal.jsp?mensaje=Usuario eliminado");
        }else{
            response.sendRedirect("principal.jsp?mensaje=Usuario no existe");
        }
    
    }
    private void ingresar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String usuario = request.getParameter("usuario").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String password = request.getParameter("password").trim();
        if(usuario.isEmpty()||nombre.isEmpty()||apellido.isEmpty()||password.isEmpty()){
            response.sendRedirect("registro.jsp?mensaje=Complete todos los campos");
        }else{
        Usuario u = new Usuario(usuario,nombre,apellido,password);
        ArrayList<Usuario> usuarios;
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("usuarios")!=null){
            usuarios = (ArrayList) sesion.getAttribute("usuarios");
        }else{
            usuarios = new ArrayList();
        }
        if(validarUsuario(u,usuarios)){
            usuarios.add(u);
            sesion.setAttribute("usuarios", usuarios);
            response.sendRedirect("index.jsp?mensaje=Usuario registrado");
        }else{
            response.sendRedirect("registro.jsp?mensaje=Nombre de usuario ya esta en uso");
        }
        }
    }
    
    private boolean validarUsuario(Usuario u,ArrayList<Usuario> usuarios){
        Usuario temporal = null;
        for(Usuario usuario:usuarios){
            if(usuario.getUsuario().equalsIgnoreCase(u.getUsuario())){
                temporal = usuario;
                u = usuario;
            }
        }
        return (temporal == null);
    }
    private Usuario validar2(Usuario u,ArrayList<Usuario> usuarios){
        Usuario temporal = null;
        for(Usuario usuario:usuarios){
            if(usuario.getUsuario().equalsIgnoreCase(u.getUsuario())){
                temporal = usuario;
            }
        }
        return temporal;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
