/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.cliententity.CartItem;
import vn.group1.entity.Product;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

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
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";

        HttpSession session = request.getSession();
        List<CartItem> cart;
        if (session.getAttribute("cart") != null) {
            cart = (List<CartItem>) session.getAttribute("cart");
        } else {
            cart = new ArrayList<>();
        }

        switch (action) {
            case "add": {
                int id = Integer.parseInt(request.getParameter("id"));

                boolean found = false;
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == id) {
                        found = true;
                        int q = item.getQuantity() + 1;
                        item.setQuantity(q);
                        break;
                    }

                }
                if (!found) {
                    Product p = productFacade.find(id);
                    Date today = new Date();
                    int finalPrice;
                    if (p.getDiscount() != null && today.compareTo(p.getStartDate()) >= 0 && today.compareTo(p.getEndDate()) <= 0) {
                        finalPrice = p.getPrice() - p.getDiscount();
                    } else {
                        finalPrice = p.getPrice();
                    }
                    cart.add(new CartItem(p, 1, finalPrice));
                }

                session.setAttribute("cart", cart);

                try (PrintWriter writer = response.getWriter()) {
                    int items = 0;
                    int total = 0;

                    for (CartItem item : cart) {
                        total += item.getFinalPrice() * item.getQuantity();
                        items += item.getQuantity();
                    }
                    Map<String, Object> data = new HashMap<>();
                    data.put("items", items);
                    data.put("total", total);
                    Gson gson = new Gson();
                    String json = gson.toJson(data);
                    writer.write(json);
                    writer.flush();
                }
                break;
            }

            case "remove": {
                int id = Integer.parseInt(request.getParameter("id"));
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == id) {
                        cart.remove(item);
                        break;
                    }
                }

                session.setAttribute("cart", cart);

                try (PrintWriter writer = response.getWriter()) {
                    int items = 0;
                    int total = 0;

                    for (CartItem item : cart) {
                        total += item.getFinalPrice() * item.getQuantity();
                        items += item.getQuantity();

                    }
                    Map<String, Object> data = new HashMap<>();
                    data.put("items", items);
                    data.put("total", total);
                    Gson gson = new Gson();
                    String json = gson.toJson(data);
                    writer.write(json);
                    writer.flush();
                }

                break;
            }

            case "update": {
                int id = Integer.parseInt(request.getParameter("id"));
                int newQ = Integer.parseInt(request.getParameter("quantity"));
                int subTotal = 0;
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == id) {
                        item.setQuantity(newQ);
                        subTotal = newQ * item.getFinalPrice();
                        break;
                    }
                }

                session.setAttribute("cart", cart);

                try (PrintWriter writer = response.getWriter()) {
                    int items = 0;
                    int total = 0;

                    for (CartItem item : cart) {
                        total += item.getFinalPrice() * item.getQuantity();
                        items += item.getQuantity();

                    }
                    Map<String, Object> data = new HashMap<>();
                    data.put("items", items);
                    data.put("total", total);
                    data.put("subTotal", subTotal);
                    Gson gson = new Gson();
                    String json = gson.toJson(data);
                    writer.write(json);
                    writer.flush();
                }

                break;
            }

            default: {
                request.setAttribute("cart", cart);
                request.setAttribute("user", session.getAttribute("curAcc"));
                request.getRequestDispatcher("cart.jsp").forward(request, response);
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
