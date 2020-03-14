package vn.group1.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Attribute;
import vn.group1.entity.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile CollectionAttribute<Category, Product> productCollection;
    public static volatile CollectionAttribute<Category, Attribute> attributeCollection;
    public static volatile SingularAttribute<Category, String> name;
    public static volatile SingularAttribute<Category, Integer> id;

}