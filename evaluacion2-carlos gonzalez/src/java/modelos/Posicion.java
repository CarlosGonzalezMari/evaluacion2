package modelos;


public class Posicion {
    private String nombre;
    private String equipo;
    private int id;
    

    public Posicion() {
    }

    public Posicion(String nombre, String equipo, int id) {
        this.nombre = nombre;
        this.equipo = equipo;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }
    
}