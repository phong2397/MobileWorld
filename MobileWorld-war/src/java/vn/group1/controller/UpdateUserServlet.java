/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Customer;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.CustomerFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/UpdateUser"})
public class UpdateUserServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;

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
        HttpSession session = request.getSession();

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Customer cus = customerFacade.find(id);
        cus.setUsername(username);
        cus.setFullname(fullname);
        cus.setPhone(phone);
        cus.setAddress(address);
        cus.setDateCreated(cus.getDateCreated());

        customerFacade.edit(cus);

        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());
        request.setAttribute("message", "Update Successfully!");

        session.setAttribute("user", cus);
        request.getRequestDispatcher("myaccount.jsp").forward(request, response);
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
