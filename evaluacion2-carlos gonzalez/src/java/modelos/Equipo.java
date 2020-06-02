package modelos;

import controladores.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Equipo {
    private String codigo;
    private String nombre;
    private String procedencia;
    private String jugadores;
    private String estadio;
    private String division;

    public Equipo() {
    }

    public Equipo(String codigo, String nombre, String procedencia, String jugadores, String estadio, String division) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.procedencia = procedencia;
        this.jugadores = jugadores;
        this.jugadores = jugadores;
        this.estadio = estadio;
        this.division = division;
    }   
}
