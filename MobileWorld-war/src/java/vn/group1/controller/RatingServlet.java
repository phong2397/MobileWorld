/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.controller;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.group1.entity.Customer;
import vn.group1.entity.Rating;
import vn.group1.sb.ProductFacadeLocal;
import vn.group1.sb.RatingFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "RatingServlet", urlPatterns = {"/rating"})
public class RatingServlet extends HttpServlet {

    @EJB
    private RatingFacadeLocal ratingFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int prodId = Integer.parseInt(req.getParameter("prodId"));
        int stars = Integer.parseInt(req.getParameter("rating"));
        String cmt = req.getParameter("cmt");

        Customer cus = (Customer) req.getSession().getAttribute("curAcc");

        Rating r = new Rating();
        r.setProduct(productFacade.find(prodId));
        r.setCustomer(cus);
        r.setStars(stars);
        r.setComment(cmt);
        r.setRatingDate(new Date());

        ratingFacade.create(r);
        String url = req.getHeader("referer");
        resp.setStatus(200);
        resp.sendRedirect(url);
    }

}
