package vn.group1.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Attribute;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Specification.class)
public class Specification_ { 

    public static volatile SingularAttribute<Specification, Product> product;
    public static volatile SingularAttribute<Specification, Integer> id;
    public static volatile SingularAttribute<Specification, Attribute> attribute;
    public static volatile SingularAttribute<Specification, String> value;

}