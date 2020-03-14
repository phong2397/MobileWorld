package vn.group1.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Brand.class)
public class Brand_ { 

    public static volatile CollectionAttribute<Brand, Product> productCollection;
    public static volatile SingularAttribute<Brand, String> name;
    public static volatile SingularAttribute<Brand, String> logo;
    public static volatile SingularAttribute<Brand, Integer> id;
    public static volatile SingularAttribute<Brand, String> categories;

}