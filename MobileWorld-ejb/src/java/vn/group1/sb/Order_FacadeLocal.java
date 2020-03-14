/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.Order_;

/**
 *
 * @author junev
 */
@Local
public interface Order_FacadeLocal {

    void create(Order_ order_);

    void edit(Order_ order_);

    void remove(Order_ order_);

    Order_ find(Object id);

    List<Order_> findAll();

    List<Order_> findRange(int[] range);

    int count();
    
}
