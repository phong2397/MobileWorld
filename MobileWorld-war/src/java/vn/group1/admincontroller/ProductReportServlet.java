/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.group1.entity.Category;
import vn.group1.entity.Product;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "ProductReportServlet", urlPatterns = {"/admin/product-report"})
public class ProductReportServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryFacade.findAll();
        List<String> labels = new ArrayList<>();
        List<Integer> data = new ArrayList<>();
        for (Category c : categories) {
            labels.add(c.getName());
            data.add(c.getProductCollection().size());
        }
        
        Gson gson = new Gson();
        
        req.setAttribute("labels", gson.toJson(labels));
        req.setAttribute("data", gson.toJson(data));
        List<Product> products = productFacade.findAll();
        req.setAttribute("products", products);
        req.getRequestDispatcher("product-report.jsp").forward(req, resp);
    }

}
