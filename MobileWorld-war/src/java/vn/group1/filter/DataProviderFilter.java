/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.filter;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import vn.group1.cliententity.CartItem;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;

/**
 *
 * @author junev
 */
@WebFilter(filterName = "DataProviderFilter", urlPatterns = {"/home", "/product", "/filter", "/cart", "/payment", "/login", "/User", "/UpdateUser", "/changepass"})
public class DataProviderFilter implements Filter {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private BrandFacadeLocal brandFacade;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("do DataProviderFilter");
        HttpServletRequest req = (HttpServletRequest) request;
        req.setAttribute("categories", categoryFacade.findAll());
        req.setAttribute("brands", brandFacade.findAll());
        HttpSession session = req.getSession();
        int items = 0;
        int total = 0;
        
        req.setAttribute("cus", session.getAttribute("curAcc"));

        if (session.getAttribute("cart") != null) {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            for (CartItem item : cart) {
                total += item.getFinalPrice() * item.getQuantity();
                items += item.getQuantity();
            }

        }

        req.setAttribute("cartItems", items);
        req.setAttribute("cartTotal", total);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
