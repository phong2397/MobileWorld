/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import vn.group1.entity.Customer;

/**
 *
 * @author junev
 */
@Stateless
public class CustomerFacade extends AbstractFacade<Customer> implements CustomerFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerFacade() {
        super(Customer.class);
    }

    @Override
    public Customer findByPhone(String phone) {
        TypedQuery<Customer> q = em.createQuery("SELECT c FROM Customer c WHERE c.phone = :phone", Customer.class);
        return q.setParameter("phone", phone)
                .getSingleResult();
    }
    
}
