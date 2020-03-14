/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Admin;
import vn.group1.entity.Customer;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.CustomerFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/admin/login"})
public class LoginServlet extends HttpServlet {

    @EJB
    private AdminFacadeLocal adminFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

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

        request.setAttribute("categories", categoryFacade.findAll());
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        session.setAttribute("uid", 1);
        String uid = session.getAttribute("uid").toString();
        Admin user = adminFacade.find(Integer.parseInt(uid));

        switch (action) {
            case "login":
                String username = request.getParameter("username").trim();
                String pass = request.getParameter("pass").trim();

                Admin curAcc = adminFacade.checklogin(username, pass);
                if (curAcc != null) {

                    session.setAttribute("curAcc", curAcc);
                    request.getRequestDispatcher("dashboard").forward(request, response);

                } else {
                    request.setAttribute("error", " Username and Password Invalid");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                }
                break;
            case "logout":

                session.invalidate();

                request.getRequestDispatcher("login.jsp").forward(request, response);
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
