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
import vn.group1.entity.Category;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.AttributeFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "UpdateCateServlet", urlPatterns = {"/admin/update-cate"})
public class UpdateCateServlet extends HttpServlet {
  @EJB
    private AdminFacadeLocal adminFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private AttributeFacadeLocal attributeFacade;

  
    @EJB
    private CategoryFacadeLocal categoryFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      HttpSession session = request.getSession();
        session.setAttribute("uid", 1);
        int uid = (int) session.getAttribute("uid");
        Admin user = adminFacade.find(uid);

        if (user == null) {
            response.sendRedirect("login.jsp");
        }

        request.setAttribute("user", user);
        request.setAttribute("categories", categoryFacade.findAll());
String action = request.getParameter("action");

        int id = Integer.parseInt(request.getParameter("id"));
        switch (action) {
            case "find":

                Category c = categoryFacade.find(id);

                request.setAttribute("cate", c);

                request.getRequestDispatcher("update-cate.jsp").forward(request, response);
                break;
            case "update-cate":

                String name = request.getParameter("name");
                String logo = request.getParameter("logo");
                String category = request.getParameter("category");

               Category cate = categoryFacade.find(id);
                cate.setName(name);
              
                categoryFacade.edit(cate);
request.getRequestDispatcher("cate-list").forward(request, response);
                break;
                  case "delete-brand":

                Category c1 = categoryFacade.find(id);
categoryFacade.remove(c1);
                request.setAttribute("category", c1);

                request.getRequestDispatcher("cate-list").forward(request, response);
                break;
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
