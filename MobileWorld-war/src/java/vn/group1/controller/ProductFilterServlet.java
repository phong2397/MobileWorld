package vn.group1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.group1.entity.Product;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "FilterProductServlet", urlPatterns = {"/filter"})
public class ProductFilterServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = null;
        String txt = request.getParameter("txt");

        if (txt != null) {
            String sCateId = request.getParameter("category");
            int cateId = sCateId != null ? Integer.parseInt(sCateId) : 0;
            products = productFacade.search(txt, cateId);
            request.setAttribute("category", cateId);
        } else {
            List<String> categories = new ArrayList<>();
            if (request.getParameterValues("categories") != null) {
                categories = Arrays.asList(request.getParameterValues("categories"));
            }

            List<String> brands = new ArrayList<>();
            if (request.getParameterValues("brands") != null) {
                brands = Arrays.asList(request.getParameterValues("brands"));
            }

            String sMinPrice = request.getParameter("minPrice");
            String sMaxPrice = request.getParameter("maxPrice");

            int minPrice = 0;
            int maxPrice = 0;

            if (sMinPrice != null) {
                minPrice = Integer.parseInt(sMinPrice);
            }

            if (sMaxPrice != null) {
                maxPrice = Integer.parseInt(sMaxPrice);
            }

            products = productFacade.filter(categories, brands, minPrice, maxPrice);

            request.setAttribute("filterCates", categories);
            request.setAttribute("filterBrands", brands);
        }

        request.setAttribute("products", products);

        request.getRequestDispatcher("filter.jsp").forward(request, response);
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
