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
import vn.group1.entity.Category;
import vn.group1.entity.Product;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/admin/delete-product"})
public class DeleteProductServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private AdminFacadeLocal adminFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id != null) {
            Product p = productFacade.find(Integer.parseInt(id));
            PrintWriter writer = response.getWriter();
            if (productFacade.delete(p)) {
                Category c = p.getCategory();
                c.getProductCollection().remove(p);
                categoryFacade.edit(c);
                writer.write("successed");
            } else {
                writer.print("conflict");
            }
            writer.flush();
            writer.close();
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
