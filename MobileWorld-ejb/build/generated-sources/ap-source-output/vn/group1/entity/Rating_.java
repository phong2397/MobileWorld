package vn.group1.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Customer;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Rating.class)
public class Rating_ { 

    public static volatile SingularAttribute<Rating, Date> ratingDate;
    public static volatile SingularAttribute<Rating, Product> product;
    public static volatile SingularAttribute<Rating, String> comment;
    public static volatile SingularAttribute<Rating, Integer> id;
    public static volatile SingularAttribute<Rating, Integer> stars;
    public static volatile SingularAttribute<Rating, Customer> customer;

}