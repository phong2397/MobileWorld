/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.Specification;

/**
 *
 * @author junev
 */
@Local
public interface SpecificationFacadeLocal {

    void create(Specification specification);

    void edit(Specification specification);

    void remove(Specification specification);

    Specification find(Object id);

    List<Specification> findAll();

    List<Specification> findRange(int[] range);

    int count();
}
