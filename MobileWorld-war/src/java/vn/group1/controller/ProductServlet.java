/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.cliententity.Color;
import vn.group1.entity.Product;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    private int currentPage = 1;
    private final int LIMIT = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sId = request.getParameter("id");

        HttpSession session = request.getSession();
        List<Integer> recentlyViewed = new ArrayList<>();
        if (session.getAttribute("recentlyViewed") != null) {
            recentlyViewed = (List<Integer>) session.getAttribute("recentlyViewed");
        }

        if (recentlyViewed.size() > 0) {
            request.setAttribute("recentlyProducts", productFacade.getProducts(recentlyViewed));
        }

        if (sId != null) {
            int id = Integer.parseInt(sId);
            Gson gson = new Gson();
            Product p = productFacade.find(id);
            
            if (!recentlyViewed.contains(id)) {
                recentlyViewed.add(id);
            }
            session.setAttribute("recentlyViewed", recentlyViewed);
            List<Color> colors = gson.fromJson(p.getColors(), new TypeToken<ArrayList<Color>>() {
            }.getType());

            request.setAttribute("product", p);
            request.setAttribute("colors", colors);
            request.setAttribute("relatedProducts", productFacade.getRelatedProducts(p, 10));
            request.setAttribute("categories", categoryFacade.findAll());
            request.setAttribute("brands", brandFacade.findAll());
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
            return;
        }

        sId = request.getParameter("cateId");
        if (sId != null) {
            int cateId = Integer.parseInt(sId);
            request.setAttribute("categories", categoryFacade.findAll());
            request.setAttribute("brands", brandFacade.findAll());
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
            return;
        }
        
        sId = request.getParameter("brandId");
        if (sId != null) {
            int brandId = Integer.parseInt(sId);
            request.setAttribute("categories", categoryFacade.findAll());
            request.setAttribute("brands", brandFacade.findAll());
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

        request.setAttribute("products", productFacade.findByPageNumber(currentPage, LIMIT));
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pages", pages);
        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());
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