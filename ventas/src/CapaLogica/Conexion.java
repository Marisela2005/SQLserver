/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CapaLogica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Dell i7
 */
public class Conexion {
    public static Connection getConexion() {
        String conexionUrl = "jdbc:sqlserver://localhost:1433;" +
        "databaseName=db_ventas;" +
        "user=sa;" +
        "password=1234;" +
        "loginTimeout=30;" +
        "encrypt=true;" +
        "trustServerCertificate=true;";
        try {
            Connection con = DriverManager.getConnection(conexionUrl);
            return con;
        } catch (SQLException ex) {
            System.out.println("Error en la conexión: " + ex.toString());
            return null;
        }
    }
    
    public static void main(String[] args) {
        Connection con = Conexion.getConexion();
        if (con != null) {
            System.out.println("Conexión exitosa");
            try {
                con.close(); // Cerrar conexión después de probar
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.toString());
            }
        } else {
            System.out.println("No se pudo establecer la conexión");
        }
    }
}


