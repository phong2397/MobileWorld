package vn.group1.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Order_;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Admin.class)
public class Admin_ { 

    public static volatile SingularAttribute<Admin, String> password;
    public static volatile SingularAttribute<Admin, Integer> role;
    public static volatile SingularAttribute<Admin, Date> dateCreated;
    public static volatile CollectionAttribute<Admin, Product> productCollection;
    public static volatile CollectionAttribute<Admin, Order_> orderCollection;
    public static volatile SingularAttribute<Admin, Integer> id;
    public static volatile SingularAttribute<Admin, String> fullname;
    public static volatile SingularAttribute<Admin, String> avatar;
    public static volatile SingularAttribute<Admin, String> username;

}