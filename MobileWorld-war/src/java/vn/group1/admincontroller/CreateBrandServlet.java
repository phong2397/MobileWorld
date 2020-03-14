/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.entity.Admin;
import vn.group1.entity.Brand;
import vn.group1.entity.Customer;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.AttributeFacadeLocal;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author cuong
 */
@WebServlet(name = "CreateBrandServlet", urlPatterns = {"/admin/create-brand"})
public class CreateBrandServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("uid", 1);
        int uid = (int) session.getAttribute("uid");
        Admin user = adminFacade.find(uid);

        if (user == null) {
            response.sendRedirect("login.jsp");
        }

        request.setAttribute("user", user);
        request.setAttribute("mainMenu", "brand");
        request.setAttribute("subMenu", "create-brand");
        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());

        List atrributes = attributeFacade.getKeyAndName();

        Gson gson = new Gson();
        String json = gson.toJson(atrributes);

        request.setAttribute("attributes", json);

        request.getRequestDispatcher("create-brand.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        session.setAttribute("uid", 1);
        int uid = (int) session.getAttribute("uid");
        Admin user = adminFacade.find(uid);

        if (user == null) {
            response.sendRedirect("login.jsp");
        }
        request.setAttribute("categories", categoryFacade.findAll());


        String name = request.getParameter("name");
        String logo = request.getParameter("logo");
        String category = request.getParameter("category");
        
        Brand b = new Brand();
        b.setName(name);
        b.setLogo(logo);
        b.setCategories(category);

        brandFacade.create(b);
      
 request.getRequestDispatcher("brand-list").forward(request, response);
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

