/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;

import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.cliententity.CartItem;
import vn.group1.entity.Customer;
import vn.group1.entity.Order_;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.CustomerFacadeLocal;
import vn.group1.sb.OrderDetailFacadeLocal;
import vn.group1.sb.Order_FacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "User", urlPatterns = {"/User"})
public class UserServlet extends HttpServlet {

    @EJB
    private OrderDetailFacadeLocal orderDetailFacade;

    @EJB
    private Order_FacadeLocal order_Facade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;

    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        request.setAttribute("products", productFacade.findAll());
        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());
        Customer cus;

        switch (action) {
            case "insert": {

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
                    request.getRequestDispatcher("home").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("message", "Username already existed!!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                break;
            }
            case "update": {

                if (session.getAttribute("curAcc") == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Customer c = customerFacade.find(id);

                    request.setAttribute("user", c);
                    session.setAttribute("curAcc", c);

                    request.getRequestDispatcher("myaccount.jsp").forward(request, response);
                }

                break;
            }
            case "login": {

                String username = request.getParameter("username").trim();
                String pass = request.getParameter("pass").trim();

                Customer curAcc = customerFacade.checklogin(username, pass);
                if (curAcc.getIsInactive() == false) {
                    request.setAttribute("error1", " Username is Blocking");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    if (curAcc != null) {

                        session.setAttribute("curAcc", curAcc);
                        response.sendRedirect("home");

                    } else {
                        request.setAttribute("error", " Username and Password Invalid");
                        request.getRequestDispatcher("login.jsp").forward(request, response);

                    }
                }
                break;
            }
            case "logout": {

                session.invalidate();
                response.sendRedirect("");
                break;
            }
            case "order-history": {

                if (session.getAttribute("curAcc") == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    int id = Integer.parseInt(request.getParameter("id"));
                    cus = customerFacade.find(id);

                    request.setAttribute("orderList", order_Facade.findAllOrderByCusId(cus.getId()));

                    request.getRequestDispatcher("order-history.jsp").forward(request, response);
                }
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
