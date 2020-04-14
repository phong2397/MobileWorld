/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Admin;
import vn.group1.entity.Category;
import vn.group1.entity.Customer;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.AttributeFacadeLocal;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.CustomerFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "CreateUserServlet", urlPatterns = {"/admin/create-user"})
public class CreateUserServlet extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private AttributeFacadeLocal attributeFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private AdminFacadeLocal adminFacade;

    @EJB
    private BrandFacadeLocal brandFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

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

        request.setAttribute("mainMenu", "user-list");
        request.setAttribute("subMenu", "create-user");

        request.getRequestDispatcher("create-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("uid", 1);
        int uid = (int) session.getAttribute("uid");
        Admin user = adminFacade.find(uid);

        if (user == null) {
            response.sendRedirect("login.jsp");
        }
        Customer newcus = new Customer();
        newcus.setUsername(request.getParameter("username"));
        newcus.setPassword(request.getParameter("pass"));
        newcus.setFullname(request.getParameter("fullname"));
        newcus.setPhone(request.getParameter("phone"));
        newcus.setAddress(request.getParameter("address"));
        newcus.setDateCreated(new Date());

        String avatar = request.getParameter("avatar");

        if (avatar != null) {
            newcus.setAvatar(avatar);
        }

        try {
            customerFacade.create(newcus);
            session.setAttribute("curAcc", newcus);
            request.getRequestDispatcher("user-list").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Username already existed!!");
            request.getRequestDispatcher("create-user").forward(request, response);
        }

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
