/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import java.util.Map;
import javax.ejb.Local;
import vn.group1.entity.Attribute;

/**
 *
 * @author junev
 */
@Local
public interface AttributeFacadeLocal {

    void create(Attribute attribute);

    void edit(Attribute attribute);

    void remove(Attribute attribute);

    Attribute find(Object id);

    List<Attribute> findAll();

    List<Attribute> findRange(int[] range);

    int count();

    List getKeyAndName();

}
