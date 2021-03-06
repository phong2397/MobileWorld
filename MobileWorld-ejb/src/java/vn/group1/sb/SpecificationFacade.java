/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.group1.entity.Specification;

/**
 *
 * @author junev
 */
@Stateless
public class SpecificationFacade extends AbstractFacade<Specification> implements SpecificationFacadeLocal {

    @PersistenceContext(unitName = "MobileWorld-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SpecificationFacade() {
        super(Specification.class);
    }

}
