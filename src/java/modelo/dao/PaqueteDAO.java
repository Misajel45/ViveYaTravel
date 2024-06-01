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

    public PaqueteDAO() {
        cnx = new ConectarBD().getConexion();
    }

    public List listar() {
        List<Paquete> lista = new ArrayList<>();
        String SQL = "SELECT * FROM paquete WHERE categoria='T'";

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
                p.setCategoria(rs.getString(6));
                p.setDetallePaquete(rs.getString(7));
                lista.add(p);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    public List list() {
        List<Paquete> promociones = new ArrayList<>();
        String SQL = "SELECT * FROM paquete WHERE categoria='P'";

        try {
            cnx = cn.getConexion();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();

            while (rs.next()) {
                Paquete o = new Paquete();
                o.setIdPaquete(rs.getInt(1));
                o.setNombrePaquete(rs.getString(2));
                o.setDescripcionPaquete(rs.getString(3));
                o.setPrecioPaquete(rs.getDouble(4));
                o.setImagen(rs.getString(5));
                o.setCategoria(rs.getString(6));
                o.setDetallePaquete(rs.getString(7));
                promociones.add(o);
            }
        } catch (Exception e) {
        }
        return promociones;
    }

    public String insert(Paquete p) {
        String resp = "";
        String cadSQL = "INSERT INTO paquete (nombrePaquete, descripcionPaquete, precioPaquete, imagen, categoria, detallePaquete) VALUES(?,?,?,?,?,?)";
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setString(1, p.getNombrePaquete());
            ps.setString(2, p.getDescripcionPaquete());
            ps.setDouble(3, p.getPrecioPaquete());
            ps.setString(4, p.getImagen());
            ps.setString(5, p.getDetallePaquete());
            ps.setString(6, p.getDetallePaquete());

            int ctos = ps.executeUpdate();
            if (ctos > 0) {
                resp = "Registrado";
            } else {
                resp = "No se ha registrado";
            }
        } catch (SQLException ex) {
            resp = "Error en la inserción: " + ex.getMessage();
        }
        return resp;
    }
}
