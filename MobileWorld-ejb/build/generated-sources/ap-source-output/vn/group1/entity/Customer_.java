package vn.group1.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Order_;
import vn.group1.entity.Rating;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, Date> dateCreated;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile CollectionAttribute<Customer, Order_> orderCollection;
    public static volatile SingularAttribute<Customer, Integer> id;
    public static volatile SingularAttribute<Customer, String> fullname;
    public static volatile SingularAttribute<Customer, String> avatar;
    public static volatile CollectionAttribute<Customer, Rating> ratingCollection;
    public static volatile SingularAttribute<Customer, String> username;

}