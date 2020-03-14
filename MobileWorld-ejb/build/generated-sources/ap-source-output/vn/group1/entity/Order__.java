package vn.group1.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Admin;
import vn.group1.entity.Customer;
import vn.group1.entity.OrderDetail;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Order_.class)
public class Order__ { 

    public static volatile CollectionAttribute<Order_, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Order_, Admin> admin;
    public static volatile SingularAttribute<Order_, Integer> id;
    public static volatile SingularAttribute<Order_, Integer> state;
    public static volatile SingularAttribute<Order_, Date> orderDate;
    public static volatile SingularAttribute<Order_, Date> verificationDate;
    public static volatile SingularAttribute<Order_, Customer> customer;

}