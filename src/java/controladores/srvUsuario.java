package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.dao.usuarioDAO;
import modelo.dto.usuario;

@WebServlet(name="srvUsuario", urlPatterns = {"/srvUsuario"}) 

public class srvUsuario extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if(accion != null){
                switch (accion){
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarSesion(request, response);
                        break;
                    default:
                        response.sendRedirect("/vista/iniciarSesion");
                }
            } else {
                response.sendRedirect("/vista/iniciarSesion");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/vista/mensaje.jsp").forward(request, response);
                
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession sesion;
        usuarioDAO dao;
        usuario usuario;
        usuario = this.obtenerUsuario(request);
        dao = new usuarioDAO();
        usuario = dao.identificar(usuario);
        if(usuario != null && usuario.getCargo().getNombreCargo().equals("administrador")){
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.setAttribute("mensaje", "Bienvenido");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vista/index.jsp").forward(request, response);  //Redireccion a la vista del admin
        } else if(usuario != null && usuario.getCargo().getNombreCargo().equals("cliente")){
            sesion = request.getSession();
            sesion.setAttribute("cliente", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vista/index.jsp").forward(request, response);
        } else{
            request.setAttribute("msjeCredenciales", "Credenciales incorrectas");
            request.getRequestDispatcher("./vista/iniciarSesion.jsp").forward(request, response);
        }
        
    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect("./vista/iniciarSesion.jsp");
    }

    private usuario obtenerUsuario(HttpServletRequest request) {
        usuario u = new usuario();
        u.setCorreoElectronico(request.getParameter("correo"));   //nombre que tiene en el input de la vista iniciarSesion
        u.setClave(request.getParameter("clave"));
        return u;
    }

}
