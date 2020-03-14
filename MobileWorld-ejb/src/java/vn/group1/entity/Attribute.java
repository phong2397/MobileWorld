/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author junev
 */
@Entity
@Table(name = "Attributes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Attribute.findAll", query = "SELECT a FROM Attribute a")
    , @NamedQuery(name = "Attribute.findById", query = "SELECT a FROM Attribute a WHERE a.id = :id")
    , @NamedQuery(name = "Attribute.findByName", query = "SELECT a FROM Attribute a WHERE a.name = :name")
    , @NamedQuery(name = "Attribute.findByShow", query = "SELECT a FROM Attribute a WHERE a.show = :show")})
public class Attribute implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "Name")
    private String name;
    @Column(name = "Show")
    private Boolean show;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "attribute")
    private Collection<Specification> specificationCollection;
    @JoinColumn(name = "Category", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Category category;

    public Attribute() {
    }

    public Attribute(Integer id) {
        this.id = id;
    }

    public Attribute(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getShow() {
        return show;
    }

    public void setShow(Boolean show) {
        this.show = show;
    }

    @XmlTransient
    public Collection<Specification> getSpecificationCollection() {
        return specificationCollection;
    }

    public void setSpecificationCollection(Collection<Specification> specificationCollection) {
        this.specificationCollection = specificationCollection;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
        if (!(object instanceof Attribute)) {
            return false;
        }
        Attribute other = (Attribute) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.group1.entity.Attribute[ id=" + id + " ]";
    }
    
}
