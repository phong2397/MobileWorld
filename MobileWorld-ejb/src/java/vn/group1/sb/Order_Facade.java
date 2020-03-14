/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.group1.entity.Order_;

/**
 *
 * @author junev
 */
@Stateless
public class Order_Facade extends AbstractFacade<Order_> implements Order_FacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Order_Facade() {
        super(Order_.class);
    }
    
}
