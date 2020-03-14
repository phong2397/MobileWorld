/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.sb;

import java.util.List;
import javax.ejb.Local;
import vn.group1.entity.Rating;

/**
 *
 * @author junev
 */
@Local
public interface RatingFacadeLocal {

    void create(Rating rating);

    void edit(Rating rating);

    void remove(Rating rating);

    Rating find(Object id);

    List<Rating> findAll();

    List<Rating> findRange(int[] range);

    int count();
    
}
