/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Admin;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

                    session.setAttribute("curAdmin", curAcc);
                    response.sendRedirect("product-list");

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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
