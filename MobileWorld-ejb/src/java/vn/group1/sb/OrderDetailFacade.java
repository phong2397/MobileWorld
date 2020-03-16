/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import vn.group1.entity.OrderDetail;

/**
 *
 * @author junev
 */
@Stateless
public class OrderDetailFacade extends AbstractFacade<OrderDetail> implements OrderDetailFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderDetailFacade() {
        super(OrderDetail.class);
    }
    
    @Override
    public List<OrderDetail> getAllOrderDetailByOrderID(int id) {
        try {
            Query q = getEntityManager().createQuery("SELECT od FROM OrderDetail od WHERE od.order.id = :id", OrderDetail.class);
            q.setParameter("id", id);
            return q.getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
