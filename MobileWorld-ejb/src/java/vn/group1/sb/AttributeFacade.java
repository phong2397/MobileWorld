/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import vn.group1.entity.Attribute;

/**
 *
 * @author junev
 */
@Stateless
public class AttributeFacade extends AbstractFacade<Attribute> implements AttributeFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AttributeFacade() {
        super(Attribute.class);
    }

    @Override
    public List getKeyAndName() {
        Query q = em.createQuery("SELECT a.id, a.name, a.category.id FROM Attribute a");
        List list = q.getResultList();
        return list;
    }
    
}
