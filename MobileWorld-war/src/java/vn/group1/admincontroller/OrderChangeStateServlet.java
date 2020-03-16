/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.group1.entity.Admin;
import vn.group1.entity.Order_;
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
        int id = Integer.parseInt(req.getParameter("orderId"));

        Order_ o = order_Facade.find(id);
        o.setState(2);
        o.setVerificationDate(new Date());
        Admin ad = (Admin) req.getSession().getAttribute("cur");
        o.setAdmin(ad);
        order_Facade.edit(o);
        resp.sendRedirect(req.getHeader("referer"));
    }

}
