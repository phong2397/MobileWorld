/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.admincontroller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import vn.group1.cliententity.Spec;
import vn.group1.entity.Admin;
import vn.group1.entity.Attribute;
import vn.group1.entity.Brand;
import vn.group1.entity.Category;
import vn.group1.entity.Image;
import vn.group1.entity.Product;
import vn.group1.entity.Specification;
import vn.group1.sb.AdminFacadeLocal;
import vn.group1.sb.AttributeFacadeLocal;
import vn.group1.sb.BrandFacadeLocal;
import vn.group1.sb.CategoryFacadeLocal;
import vn.group1.sb.ProductFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/admin/update-product"})
public class UpdateProductServlet extends HttpServlet {

    @EJB
    private AdminFacadeLocal adminFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private AttributeFacadeLocal attributeFacade;

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

        String sId = request.getParameter("id");
        if (sId == null) {
            response.sendError(404);
            return;
        }

        request.setAttribute("user", user);
        request.setAttribute("mainMenu", "product");
//        request.setAttribute("subMenu", "create-product");
        request.setAttribute("categories", categoryFacade.findAll());
        request.setAttribute("brands", brandFacade.findAll());

        List atrributes = attributeFacade.getKeyAndName();

        Gson gson = new Gson();
        String json = gson.toJson(atrributes);

        request.setAttribute("attributes", json);
        Product p = productFacade.find(Integer.parseInt(sId));
        request.setAttribute("product", p);
        if (p.getStartDate() != null && p.getEndDate() != null) {
            SimpleDateFormat dfmt = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            request.setAttribute("startDate", dfmt.format(p.getStartDate()));
            request.setAttribute("endDate", dfmt.format(p.getEndDate()));
        }
        request.getRequestDispatcher("update-product.jsp").forward(request, response);

    }

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

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int cateId = Integer.parseInt(request.getParameter("category"));
        int brandId = Integer.parseInt(request.getParameter("brand"));
        int price = Integer.parseInt(request.getParameter("price"));
        String thumb = request.getParameter("thumb");
        String specs = request.getParameter("specs");
        String images = request.getParameter("images");
        String sDiscount = request.getParameter("discount");
        String sStartDate = request.getParameter("startDate");
        String sEndDate = request.getParameter("endDate");

        Gson gson = new Gson();

        List<Spec> specList = gson.fromJson(specs, new TypeToken<List<Spec>>() {
        }.getType());
        List<String> imgs = gson.fromJson(images, new TypeToken<List<String>>() {
        }.getType());

        Product p = productFacade.find(id);
        p.setName(name);
        p.setPrice(price);
        p.setAdmin(user);
        p.setBrand(new Brand(brandId));
        p.setCategory(new Category(cateId));
        p.setThumb(thumb);
        p.setDateUpdated(new Date(System.currentTimeMillis()));

        List<Specification> specifications = new ArrayList<>();
        for (Spec spec : specList) {
            Specification s = new Specification();
            s.setAttribute(new Attribute(spec.getAttributeId()));
            s.setProduct(p);
            s.setValue(spec.getValue());
            specifications.add(s);
        }
        p.setSpecificationCollection(specifications);

        List<Image> imgList = new ArrayList<>();
        for (String img : imgs) {
            Image i = new Image();
            i.setSource(img);
            i.setProduct(p);
            imgList.add(i);
        }
        p.setImageCollection(imgList);

        if (!sDiscount.equals("")) {
            p.setDiscount(Integer.parseInt(sDiscount));
            SimpleDateFormat dfmt = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            try {
                Date startDate = dfmt.parse(sStartDate);
                Date endDate = dfmt.parse(sEndDate);
                p.setStartDate(startDate);
                p.setEndDate(endDate);
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
        }

        if (productFacade.update(p)) {
            PrintWriter writer = response.getWriter();
            writer.print("successed");
            writer.flush();
            writer.close();
        }

    }

}
