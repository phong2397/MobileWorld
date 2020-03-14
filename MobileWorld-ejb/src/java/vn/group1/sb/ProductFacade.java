/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import vn.group1.entity.Product;

/**
 *
 * @author junev
 */
@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class ProductFacade extends AbstractFacade<Product> implements ProductFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Resource
    UserTransaction utx;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

    @Override
    public void create(Product entity) {
        try {
            utx.begin();
            super.create(entity);
            utx.commit();
            refresh();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                utx.rollback();
            } catch (IllegalStateException | SecurityException | SystemException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public boolean update(Product product) {
        boolean flag = false;
        try {
            utx.begin();
            em.createQuery("DELETE FROM Specification s WHERE s.product.id = :id").setParameter("id", product.getId()).executeUpdate();
            em.createQuery("DELETE FROM Image i WHERE i.product.id = :id").setParameter("id", product.getId()).executeUpdate();
            em.merge(product);
            utx.commit();
            flag = true;
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception ex1) {
                ex1.printStackTrace();
            }
        }
        return flag;
    }

    @Override
    public void remove(Product entity) {
        try {
            utx.begin();
            super.remove(entity);
            utx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                utx.rollback();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
    }
    
    public boolean delete(Product entity) {
        try {
            utx.begin();
            super.remove(entity);
            utx.commit();
            refresh();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                utx.rollback();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public List<Product> filter(List<String> categories, List<String> brands, int minPrice, int maxPrice) {
        List<Product> result = null;
        if (maxPrice > 0) {
            if (categories.size() > 0 && brands.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.category.id IN :categories "
                        + "AND p.brand.id IN :brands "
                        + "AND p.price BETWEEN :minPrice AND :maxPrice", Product.class);
                result = q.setParameter("categories", categories)
                        .setParameter("brands", brands)
                        .setParameter("minPrice", minPrice)
                        .setParameter("maxPrice", maxPrice)
                        .getResultList();
            } else if (categories.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.category.id IN :categories "
                        + "AND p.price BETWEEN :minPrice AND :maxPrice", Product.class);
                result = q.setParameter("categories", categories)
                        .setParameter("minPrice", minPrice)
                        .setParameter("maxPrice", maxPrice)
                        .getResultList();
            } else if (brands.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.brand.id IN :brands "
                        + "AND p.price BETWEEN :minPrice AND :maxPrice", Product.class);
                result = q.setParameter("brands", brands)
                        .setParameter("minPrice", minPrice)
                        .setParameter("maxPrice", maxPrice)
                        .getResultList();
            } else {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p WHERE p.price BETWEEN :minPrice AND :maxPrice", Product.class);
                result = q.setParameter("minPrice", minPrice)
                        .setParameter("maxPrice", maxPrice)
                        .getResultList();
            }
        } else {
            if (categories.size() > 0 && brands.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.category.id IN :categories "
                        + "AND p.brand.id IN :brands "
                        + "AND p.price >= :minPrice", Product.class);
                result = q.setParameter("categories", categories)
                        .setParameter("brands", brands)
                        .setParameter("minPrice", minPrice)
                        .getResultList();
            } else if (categories.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.category.id IN :categories "
                        + "AND p.price >= :minPrice", Product.class);
                result = q.setParameter("categories", categories)
                        .setParameter("minPrice", minPrice)
                        .getResultList();
            } else if (brands.size() > 0) {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                        + "WHERE p.brand.id IN :brands "
                        + "AND p.price >= :minPrice", Product.class);
                result = q.setParameter("brands", brands)
                        .setParameter("minPrice", minPrice)
                        .getResultList();
            } else {
                TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p WHERE p.price >= :minPrice", Product.class);
                result = q.setParameter("minPrice", minPrice).getResultList();
            }
        }

        return result;
    }

    @Override
    public List<Product> search(String txt, int cateId) {
        if (cateId != 0) {
            TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                    + "WHERE p.category.id = :cateID "
                    + "AND p.name LIKE :txt", Product.class);
            return q.setParameter("cateID", cateId)
                    .setParameter("txt", "%" + txt + "%")
                    .getResultList();
        } else {
            TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p WHERE p.name LIKE :txt", Product.class);
            return q.setParameter("txt", "%" + txt + "%").getResultList();
        }

    }

    @Override
    public List<Product> findByPageNumber(int pageNumber, int limit) {
        int start = (pageNumber - 1) * limit;

        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p", Product.class);
        return q.setFirstResult(start)
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public List<Product> getPromotions(int limit) {
        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p WHERE p.discount != NULL AND p.endDate >= :today ", Product.class);
        return q.setParameter("today", new Date(System.currentTimeMillis()))
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public List<Product> getLastestProducts(int limit) {
        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p ORDER BY p.dateCreated DESC", Product.class);
        return q.setMaxResults(limit).getResultList();
    }

    
    @Override
    public List<Product> getPopularProducts(int limit) {
        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p INNER JOIN OrderDetail o ON p.id = o.product.id GROUP BY p ORDER BY SUM(o.quantity) DESC", Product.class);
        return q.setMaxResults(limit).getResultList();
    }

    @Override
    public List<Product> getRelatedProducts(Product product, int limit) {
        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p "
                + "WHERE p.price = :price AND p.category.id = :cate "
                + "OR (p.brand.id = :brand "
                + "AND p.category.id = :cate)", Product.class);
        return q.setParameter("brand", product.getBrand().getId())
                .setParameter("cate", product.getCategory().getId())
                .setParameter("price", product.getPrice())
                .setMaxResults(limit).getResultList();
    }

    @Override
    public List<Product> getProducts(List<Integer> ids) {
        TypedQuery<Product> q = em.createQuery("SELECT p FROM Product p WHERE p.id IN :ids", Product.class);
        return q.setParameter("ids", ids).getResultList();
    }
    
    
}