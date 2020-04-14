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
import vn.group1.entity.Customer;
import vn.group1.entity.Product;
import vn.group1.sb.CustomerFacadeLocal;

/**
 *
 * @author lehun
 */
@WebServlet(name = "UserChangeStatus", urlPatterns = {"/admin/user-change-state"})
public class UserChangeStatus extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("id"));
        boolean value = Boolean.parseBoolean(req.getParameter("value"));

        Customer c = customerFacade.find(id);
        c.setIsInactive(value);
       

        customerFacade.edit(c);

        resp.getWriter().print(value ? "Active" : "InActive");

    }

}
