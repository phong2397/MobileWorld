/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.group1.entity.Admin;

/**
 *
 * @author junev
 */
@Stateless
public class AdminFacade extends AbstractFacade<Admin> implements AdminFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }
  @Override
    public Admin checklogin(String username, String pass) {
        try {
            return em.createQuery("select c from Admin c where c.username = :username and c.password = :pass", Admin.class).setParameter("username", username).setParameter("pass", pass).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }  
}
