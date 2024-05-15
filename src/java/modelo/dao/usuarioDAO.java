package modelo.dao;

import servicios.conexiones.ConectarBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import modelo.dto.cargo;
import modelo.dto.usuario;

public class usuarioDAO {
    
    private Connection cn;
    
    public usuarioDAO(){
        cn = new ConectarBD().getConexion();
    }
    
    public usuario identificar(usuario user) throws SQLException{
        usuario usu = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cadSQL = "SELECT u.idUsuario, c.nombreCargo FROM usuario u\n" +
                        "inner join cargo c on u.idCargo = c.idCargo\n" +
                        "where u.correoElectronico = '" + user.getCorreoElectronico() + "' "
                        + "AND u.clave = '" + user.getClave() + "'";
        try {
            ps = cn.prepareStatement(cadSQL);
            rs = ps.executeQuery();
            if(rs.next() == true){
                usu = new usuario();
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setCorreoElectronico(user.getCorreoElectronico());
                usu.setCargo(new cargo());
                usu.getCargo().setNombreCargo(rs.getString("nombreCargo"));
                               
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        } finally{
            if(rs != null && rs.isClosed() == false){
                rs.close();
            }
            rs=null;
            if(ps != null && ps.isClosed() == false){
                ps.close();
            }
            ps=null;
            if(cn != null && cn.isClosed() == false){
                cn.close();
            }
            cn=null;
        }
        return usu;
    }
    
}
