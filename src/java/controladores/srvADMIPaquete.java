/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.PaqueteDAO;
import modelo.dto.Paquete;

public class srvADMIPaquete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

         //crear el objeto paqDAO dentro de PaqueteDAO
        PaqueteDAO paqdao = new PaqueteDAO();
        List<Paquete> lista = new ArrayList<>();

        String accion = request.getParameter("accion");
        lista = paqdao.listar();
        if (accion != null) {
            if (accion.equals("Registrar")) {
                //Recibir parámetros del formulario
                String nombrePaquete = request.getParameter("nombrePaquete");
                String descripcionPaquete = request.getParameter("descripcionPaquete");
                String precioPaquete = request.getParameter("precioPaquete");
                String imagen = request.getParameter("imagen");
                String categoria = request.getParameter("categoria");
                String detallePaquete = request.getParameter("detallePaquete");

                //request.setAttribute("lista", lista);
                //crear el objeto Paquete y establecer sus atributos
                Paquete p = new Paquete();
                p.setNombrePaquete(nombrePaquete);
                p.setDescripcionPaquete(descripcionPaquete);
                p.setPrecioPaquete(Integer.parseInt(precioPaquete));
                p.setImagen(imagen);
                p.setCategoria(categoria);
                p.setDetallePaquete(detallePaquete);

                //Insertar la sugerencia en la BD por el modelo DAO
                String resp = new PaqueteDAO().insert(p);
                
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("./vista/ADMITours.jsp").forward(request, response);
            }
 
        } else {
            //En caso no haya ninguna acción se ejecutan estos comandos
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("./vista/ADMITours.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
