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
import vn.group1.entity.Product;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "ProductChangeStateServlet", urlPatterns = {"/admin/change-state"})
public class ProductChangeStateServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id = Integer.parseInt(req.getParameter("id"));
       int state = Integer.parseInt(req.getParameter("state"));
       
        Product p = productFacade.find(id);
        p.setState(state);
        productFacade.edit(p);
        PrintWriter writer = resp.getWriter();
        writer.write(state);
        writer.flush();
        writer.close();
    }

  

}
