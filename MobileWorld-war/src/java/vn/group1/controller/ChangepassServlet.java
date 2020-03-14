/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author lehun
 */
@WebServlet(name = "changepass", urlPatterns = {"/changepass"})
public class ChangepassServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());
        
        int id = Integer.parseInt(request.getParameter("id"));
        switch (action) {
            case "findid":
                request.setAttribute("id", id);
                request.getRequestDispatcher("change-pass.jsp").forward(request, response);
                break;
            case "change-pass":

                Customer cus = customerFacade.find(id);
                String oldPasswordFromDB = cus.getPassword();
                String oldPasswordFromForm = request.getParameter("oldpass");

                String newPasswordFromForm = request.getParameter("pass");
                String newPasswordToCheckFromForm = request.getParameter("repass");

                if (oldPasswordFromDB.toLowerCase().equals(oldPasswordFromForm.toLowerCase()) && newPasswordFromForm.toLowerCase().equals(newPasswordToCheckFromForm.toLowerCase())) {

                    cus.setPassword(newPasswordFromForm);
                    customerFacade.edit(cus);
                    request.setAttribute("id", id);
                    request.setAttribute("message", "Update Password Successfully!");
                    request.getRequestDispatcher("change-pass.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Wrong Current Password!");
                    request.getRequestDispatcher("change-pass.jsp").forward(request, response);
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
