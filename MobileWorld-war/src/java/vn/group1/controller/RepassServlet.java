/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.group1.entity.Customer;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.CustomerFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "RepassServlet", urlPatterns = {"/repass"})
public class RepassServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());
        request.setAttribute("products", productFacade.findAll());
        String token = request.getParameter("token");

        Customer cus = customerFacade.findUserByToken(token);

        if (cus == null) {
            response.getWriter().write("Invalid Token");
        } else {
            request.setAttribute("token", token);
            request.getRequestDispatcher("confirm-pass.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pass = request.getParameter("pass");
        String token = (String) request.getParameter("token");

        Customer cus = customerFacade.findUserByToken(token);
        cus.setPassword(pass);
        cus.setRepassToken(null);
        customerFacade.edit(cus);
        response.sendRedirect("login.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
