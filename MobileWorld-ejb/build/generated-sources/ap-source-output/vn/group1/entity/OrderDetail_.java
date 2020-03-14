package vn.group1.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Order_;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Product> product;
    public static volatile SingularAttribute<OrderDetail, Integer> quantity;
    public static volatile SingularAttribute<OrderDetail, String> color;
    public static volatile SingularAttribute<OrderDetail, Integer> price;
    public static volatile SingularAttribute<OrderDetail, Integer> id;
    public static volatile SingularAttribute<OrderDetail, Order_> order;

}