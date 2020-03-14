/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.Customer;

/**
 *
 * @author junev
 */
@Local
public interface CustomerFacadeLocal {

    void create(Customer customer);

    void edit(Customer customer);

    void remove(Customer customer);

    Customer find(Object id);

  Customer checklogin(String username, String pass);

    void changePass(int userID, String newpass);

    List<Customer> findAll();

    List<Customer> findRange(int[] range);

    Customer findUserByUsername(String username);

    int count();
      

    
}
