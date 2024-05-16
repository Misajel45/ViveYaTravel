package modelo.dao;

import modelo.dto.Paquete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import servicios.conexiones.ConectarBD;

public class PaqueteDAO {
    Connection cnx;
    ConectarBD cn = new ConectarBD();
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        List<Paquete> lista = new ArrayList<>();
        String SQL = "SELECT * FROM paquete";

        try {
            cnx = cn.getConexion();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paquete p = new Paquete();
                p.setIdPaquete(rs.getInt(1));
                p.setNombrePaquete(rs.getString(2));
                p.setDescripcionPaquete(rs.getString(3));
                p.setPrecioPaquete(rs.getDouble(4));
                p.setImagen(rs.getString(5));
                lista.add(p);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
    
    
}
