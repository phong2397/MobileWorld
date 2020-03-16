/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
    
    @Override
    public Customer findUserByUsername(String username) {
        Query q = getEntityManager().createQuery("SELECT C FROM Customer c WHERE c.username = :username", Customer.class);
        q.setParameter("username", username);
        try {
            return (Customer) q.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Customer checklogin(String username, String pass) {
        try {
            return em.createQuery("select c from Customer c where c.username = :username and c.password = :pass", Customer.class).setParameter("username", username).setParameter("pass", pass).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void changePass(int id, String newpass) {
        Customer findID = find(id);
        findID.setPassword(newpass);
        getEntityManager().merge(findID);
    }

}
