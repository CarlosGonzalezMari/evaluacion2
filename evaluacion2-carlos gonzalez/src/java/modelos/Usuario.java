
package modelos;

import controladores.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Usuario {
    private String usuario;
    private String nombre;
    private String apellido;
    private String password;
    private Conexion conexion;

    public Usuario() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Usuario(String usuario, String nombre, String apellido, String password) throws ClassNotFoundException, SQLException {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        conexion = new Conexion();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public String registrar() throws SQLException{
        if(validarUsuario()){
            return "El usuario ya existe";
        }else{
        String sentencia = "insert into usuario values('"+usuario+"','"+nombre+"',"
                + "'"+apellido+"','"+password+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Usuario registrado";
        }else{
            return "No se pudo registrar el usuario";
        }
        }
    }
    public boolean validarUsuario() throws SQLException{
        String sentencia = "select * from usuario where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    public boolean iniciarSesion() throws SQLException{
        String sentencia = "select * from usuario where usuario ='"+usuario+"' "
                + " and password = '"+password+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        boolean respuesta = false;
        if(rs.next()){
            respuesta = true;
            setNombre(rs.getString("nombre"));
            setApellido(rs.getString("apellido"));
        }
        return respuesta;
    }
    public ArrayList<Usuario> obtenerUsuarios() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from usuario order by nombre,apellido";
        ArrayList<Usuario> usuarios = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            usuarios.add(new Usuario(rs.getString("usuario"),rs.getString("nombre"),
                    rs.getString("apellido"),rs.getString("password")));
        }
        return usuarios;
    }
    public Usuario obtenerUsuario(String usuario) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from usuario where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Usuario u = new Usuario();
        if(rs.next()){
            u.setUsuario(rs.getString("usuario"));
            u.setNombre(rs.getString("nombre"));
            u.setApellido(rs.getString("apellido"));
            u.setPassword(rs.getString("password"));
        }
        return u;
    }
}
