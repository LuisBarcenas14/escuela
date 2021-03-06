package org.me.romantic.client;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import org.me.Persona;
import org.me.RomanticWebService_Service;

/**
 *
 * @author barcenas
 */
//@WebServlet(urlPatterns = {"/ListaServlet"})
@WebServlet(name = "ListaServlet", urlPatterns = {"/ListaServlet"})
public class ListaServlet extends HttpServlet {
    
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/RomanticServices/RomanticWebService.wsdl")
    private RomanticWebService_Service service;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
                      
            out.println("<head> <style> table, th, td {border: 1px solid black;}</style>");
            out.println("<title>Servlet ListaServlet</title>");       
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>These are the people in our Date Base:</h1>");

            ArrayList<Persona> lista = (ArrayList<Persona>) regresaLista();
            out.println("<table>");
            out.println("<tr><th>Name</th><th>Age</th><th>Sex</th><th>Zodiac  Sign</th><th>Phone</th></tr>");
            for (Persona persona:lista) {
                out.println("<tr><td>"+persona.getNombre()+"</td>");
                out.println("<td>"+persona.getEdad()+"</td>");
                out.println("<td>"+persona.getSexo()+"</td>");
                out.println("<td>"+persona.getSigno()+"</td>");
                out.println("<td>"+persona.getTelefono()+"</td></tr>"); 
            }
            out.println("</table>");
            
            
            out.println("</body>");
            out.println("</html>");
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

    private java.util.List<org.me.Persona> regresaLista() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        org.me.RomanticWebService port = service.getRomanticWebServicePort();
        return port.regresaLista();
    }

}
