/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.Product;

/**
 *
 * @author junev
 */
@Local
public interface ProductFacadeLocal {

    void create(Product product);

    boolean update(Product product);

    void remove(Product product);
    
    boolean delete(Product product);

    Product find(Object id);

    List<Product> findAll();

    List<Product> findRange(int[] range);

    int count();

    List<Product> filter(List<String> categories, List<String> brands, int minPrice, int maxPrice);

    List<Product> search(String txt, int cateId);
    
    List<Product> findByPageNumber(int pageNumber, int limit);
    
    List<Product> getPromotions(int limit);
    
    List<Product> getLastestProducts(int limit);
    
    List<Product> getPopularProducts(int limit); 
    
    List<Product> getRelatedProducts(Product product, int limit); 
    
    List<Product> getProducts(List<Integer> ids);
    
}