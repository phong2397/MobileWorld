/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.OrderDetail;

/**
 *
 * @author junev
 */
@Local
public interface OrderDetailFacadeLocal {

    void create(OrderDetail orderDetail);

    void edit(OrderDetail orderDetail);

    void remove(OrderDetail orderDetail);

    OrderDetail find(Object id);

    List<OrderDetail> findAll();

    List<OrderDetail> findRange(int[] range);

    int count();
    
    List<OrderDetail> getAllOrderDetailByOrderID(int id);
}
