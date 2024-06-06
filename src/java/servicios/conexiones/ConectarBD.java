package servicios.conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import modelo.dao.correo;

public class ConectarBD {
    public Connection getConexion() {
        Connection cnx = null;
        
          String url = "jdbc:mysql://localhost:3306/bdAgenciaDeViajes?useTimeZone=true&"
                + "serverTimezone=UTC&autoReconnect=true";

        String user = "root";
        String clave = "";

        String Driver = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(Driver);
            cnx = DriverManager.getConnection(url, user, clave);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConectarBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConectarBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  cnx;
    }
    
    public static void main(String[] args) throws SQLException {
        ConectarBD cdb = new ConectarBD();
        Connection cnx = cdb.getConexion();
        System.out.println(""+cnx.getCatalog());
        
        String toEmail = "misajsebas19@gmail.com"; // Reemplaza con un correo de prueba
        String nombre = "Usuario de Prueba";
        correo.enviarCorreoBienvenida(toEmail, nombre);
    }
    
}
