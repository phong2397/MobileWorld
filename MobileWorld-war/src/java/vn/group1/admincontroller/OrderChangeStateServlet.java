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
import vn.group1.entity.Order_;
import vn.group1.entity.Product;
import vn.group1.sb.Order_FacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "OrderChangeStateServlet", urlPatterns = {"/admin/order-change-state"})
public class OrderChangeStateServlet extends HttpServlet {

    @EJB
    private Order_FacadeLocal order_Facade;

    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id = Integer.parseInt(req.getParameter("id"));
       int state = Integer.parseInt(req.getParameter("state"));
       
        Order_ o = order_Facade.find(id);
        o.setState(state);
        order_Facade.edit(o);
        PrintWriter writer = resp.getWriter();
        writer.write(state);
        writer.flush();
        writer.close();
    }

}
