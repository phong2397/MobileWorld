/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lehun
 */
@Entity
@Table(name = "Ratings")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r")
    , @NamedQuery(name = "Rating.findById", query = "SELECT r FROM Rating r WHERE r.id = :id")
    , @NamedQuery(name = "Rating.findByStars", query = "SELECT r FROM Rating r WHERE r.stars = :stars")
    , @NamedQuery(name = "Rating.findByComment", query = "SELECT r FROM Rating r WHERE r.comment = :comment")
    , @NamedQuery(name = "Rating.findByRatingDate", query = "SELECT r FROM Rating r WHERE r.ratingDate = :ratingDate")})
public class Rating implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Stars")
    private int stars;
    @Size(max = 500)
    @Column(name = "Comment")
    private String comment;
    @Basic(optional = false)
    @NotNull
    @Column(name = "RatingDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ratingDate;
    @JoinColumn(name = "Customer", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Customer customer;
    @JoinColumn(name = "Product", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Product product;

    public Rating() {
    }

    public Rating(Integer id) {
        this.id = id;
    }

    public Rating(Integer id, int stars, Date ratingDate) {
        this.id = id;
        this.stars = stars;
        this.ratingDate = ratingDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getRatingDate() {
        return ratingDate;
    }

    public void setRatingDate(Date ratingDate) {
        this.ratingDate = ratingDate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.group1.entity.Rating[ id=" + id + " ]";
    }
    
}
