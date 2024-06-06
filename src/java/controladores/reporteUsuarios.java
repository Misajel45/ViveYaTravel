/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.usuarioDAO;
import modelo.dto.usuario;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

public class reporteUsuarios extends HttpServlet {

    usuarioDAO usdao = new usuarioDAO();
    List<usuario> repUsuario = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        repUsuario = usdao.repUsuario();
        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "exportarReporteUsuarios":
                    this.exportarReporteUsuarios(request, response);
                    break;
            }

        } else {
            request.setAttribute("repUsuario", repUsuario);
            request.getRequestDispatcher("./vista/reporteUsuarios.jsp").forward(request, response);
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

    private void exportarReporteUsuarios(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        ServletOutputStream out = response.getOutputStream();
        try {
            InputStream logo = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("reporteJasper/img/logo.png"),
                    reporteUsuario = this.getServletConfig()
                            .getServletContext()
                            .getResourceAsStream("reporteJasper/ReporteUsuarios.jasper");
            if (logo != null && reporteUsuario != null) {
                String jsonUsuarios = request.getParameter("repUsuario"); //---
                //Gson gson = new Gson();
                List<usuario> repUsuario = new ArrayList<>();

                repUsuario.add(new usuario());

                JasperReport report = (JasperReport) JRLoader.loadObject(reporteUsuario);//plantilla diseñada
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(repUsuario.toArray());

                Map<String, Object> parameters = new HashMap();
                parameters.put("ds", ds);
                parameters.put("logo", logo);
                response.setContentType("application/pdf");
                response.addHeader("Content-disposition", "inline; filename=ReportesEmpleados.pdf");
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
                out.close();
            } else {
                response.setContentType("text/plain");
                out.println("no se pudo generar el reporte");
                out.println("esto puede debrse a que la lista de datos no fue recibida o el archivo plantilla del reporte no se ha encontrado");
                out.println("contacte a soporte");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("ocurrió un error al intentar generar el reporte:" + e.getMessage());
            e.printStackTrace();
        }
    }
}
