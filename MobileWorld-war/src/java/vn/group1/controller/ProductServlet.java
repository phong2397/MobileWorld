/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Customer;
import vn.group1.entity.Product;
import vn.group1.entity.Rating;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    private int currentPage = 1;
    private final int LIMIT = 20;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Integer> recentlyViewed = new ArrayList<>();
        if (session.getAttribute("recentlyViewed") != null) {
            recentlyViewed = (List<Integer>) session.getAttribute("recentlyViewed");
        }

        if (recentlyViewed.size() > 0) {
            request.setAttribute("recentlyProducts", productFacade.getProducts(recentlyViewed));
        }

        String sId = request.getParameter("id");

        if (sId != null) {
            int id = Integer.parseInt(sId);
            Product p = productFacade.find(id);

            if (!recentlyViewed.contains(id)) {
                recentlyViewed.add(id);
            }

            Customer cus = (Customer) session.getAttribute("curAcc");

            boolean rated = false;
            if (cus != null) {
                for (Rating r : p.getRatingCollection()) {
                    if (r.getCustomer().getId() == cus.getId()) {
                        rated = true;
                    }
                }
            }

            session.setAttribute("recentlyViewed", recentlyViewed);
            request.setAttribute("product", p);
            request.setAttribute("rated", rated);
            request.setAttribute("relatedProducts", productFacade.getRelatedProducts(p, 10));
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
            return;
        }

        sId = request.getParameter("cateId");
        if (sId != null) {
            int cateId = Integer.parseInt(sId);
            request.setAttribute("products", productFacade.getProductsByCate(cateId));
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
            return;
        }

        sId = request.getParameter("brandId");
        if (sId != null) {
            int brandId = Integer.parseInt(sId);
            request.setAttribute("products", productFacade.getProductsByBrand(brandId));
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
            return;
        }

        currentPage = 1;
        String curPage = request.getParameter("page");
        if (curPage != null && !curPage.equals("0")) {
            currentPage = Integer.parseInt(curPage);
        }

        int products = productFacade.count();

        int pages = (int) Math.ceil((double) products / LIMIT);

        List<Product> productList = productFacade.findByPageNumber(currentPage, LIMIT);

        request.setAttribute("products", productList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pages", pages);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);

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
