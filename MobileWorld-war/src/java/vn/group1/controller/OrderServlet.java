/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.group1.cliententity.CartItem;
import vn.group1.entity.Customer;
import vn.group1.entity.OrderDetail;
import vn.group1.entity.Order_;
import vn.group1.sb.CustomerFacadeLocal;
import vn.group1.sb.OrderDetailFacadeLocal;
import vn.group1.sb.Order_FacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/payment"})
public class OrderServlet extends HttpServlet {

    @EJB
    private OrderDetailFacadeLocal orderDetailFacade;

    @EJB
    private Order_FacadeLocal order_Facade;

    @EJB
    private CustomerFacadeLocal customerFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("payment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        HttpSession session = req.getSession();

        Customer cus;

        Date now = new Date();

        if (session.getAttribute("curAcc") != null) {
            cus = (Customer) session.getAttribute("curAcc");
        } else {
            try {
                cus = customerFacade.findByPhone(phone);
            } catch (Exception e) {
                cus = new Customer();
                cus.setUsername(phone);
                cus.setPhone(phone);
                cus.setAddress(address);
                cus.setFullname(fullname);
                cus.setPassword(phone);
                cus.setDateCreated(now);
                customerFacade.create(cus);
            }

        }

        Order_ order = new Order_();
        order.setCustomer(cus);
        order.setState(1);
        order.setOrderDate(now);

        order_Facade.create(order);

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        List<OrderDetail> orderDetails = new ArrayList<>();
        for (CartItem item : cart) {
            OrderDetail od = new OrderDetail();
            od.setOrder(order);
            od.setPrice(item.getFinalPrice());
            od.setQuantity(item.getQuantity());
            od.setProduct(item.getProduct());
            orderDetailFacade.create(od);
            orderDetails.add(od);
        }

        order.setOrderDetailCollection(orderDetails);
        session.removeAttribute("cart");
        req.setAttribute("order", order);
        req.getRequestDispatcher("confirmation.jsp").forward(req, resp);
    }

}
