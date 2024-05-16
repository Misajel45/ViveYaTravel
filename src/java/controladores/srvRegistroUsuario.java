package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.usuarioDAO;
import modelo.dto.usuario;

@WebServlet(name = "srvRegistroUsuario", urlPatterns = {"/srvRegistroUsuario"})

public class srvRegistroUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("registrar");
        
        if (accion != null) {
            if (accion.equals("Registrarte")) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String nroCelularStr = request.getParameter("nroCelular");
                String nroDniStr = request.getParameter("nroDni");
                String correoElectronico = request.getParameter("correoElectronico");
                String clave = request.getParameter("clave");

                int nroCelular = 0;
                if (nroCelularStr != null && !nroCelularStr.isEmpty()) {
                    nroCelular = Integer.parseInt(nroCelularStr);
                }

                int nroDni = 0;
                if (nroDniStr != null && !nroDniStr.isEmpty()) {
                    nroDni = Integer.parseInt(nroDniStr);
                }

                
                usuario usuario = new usuario();
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setNroCelular(nroCelular);
                usuario.setNroDni(nroDni);
                usuario.setCorreoElectronico(correoElectronico);
                usuario.setClave(clave);

                //inserción en la base de datos
                usuarioDAO usuarioDAO = new usuarioDAO();

                try {
                    // Registra el usuario en la base de datos
                    usuarioDAO.registrar(usuario);
                    // Redireccionar a una página de éxito
                    response.sendRedirect("./vista/iniciarSesion.jsp");
                } catch (Exception ex) {
                    // En caso de error
                    response.sendRedirect("error.jsp");
                }
            }
        }
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
