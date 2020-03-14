package vn.group1.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.group1.entity.Admin;
import vn.group1.entity.Brand;
import vn.group1.entity.Category;
import vn.group1.entity.Image;
import vn.group1.entity.OrderDetail;
import vn.group1.entity.Rating;
import vn.group1.entity.Specification;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-03-14T12:20:30")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile CollectionAttribute<Product, Specification> specificationCollection;
    public static volatile CollectionAttribute<Product, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Product, String> thumb;
    public static volatile SingularAttribute<Product, Date> endDate;
    public static volatile SingularAttribute<Product, Integer> discount;
    public static volatile SingularAttribute<Product, Admin> admin;
    public static volatile SingularAttribute<Product, String> colors;
    public static volatile CollectionAttribute<Product, Rating> ratingCollection;
    public static volatile SingularAttribute<Product, Date> dateUpdated;
    public static volatile SingularAttribute<Product, Date> dateCreated;
    public static volatile SingularAttribute<Product, Integer> price;
    public static volatile CollectionAttribute<Product, Image> imageCollection;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, Integer> state;
    public static volatile SingularAttribute<Product, Category> category;
    public static volatile SingularAttribute<Product, Brand> brand;
    public static volatile SingularAttribute<Product, Date> startDate;

}