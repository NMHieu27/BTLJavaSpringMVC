/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.pojo;

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
 * @author Asus
 */
@Entity
@Table(name = "coach")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Coach.findAll", query = "SELECT c FROM Coach c"),
    @NamedQuery(name = "Coach.findById", query = "SELECT c FROM Coach c WHERE c.id = :id"),
    @NamedQuery(name = "Coach.findByName", query = "SELECT c FROM Coach c WHERE c.name = :name"),
    @NamedQuery(name = "Coach.findByLicenseplates", query = "SELECT c FROM Coach c WHERE c.licenseplates = :licenseplates"),
    @NamedQuery(name = "Coach.findByPrice", query = "SELECT c FROM Coach c WHERE c.price = :price"),
    @NamedQuery(name = "Coach.findByDescribe", query = "SELECT c FROM Coach c WHERE c.describe = :describe"),
    @NamedQuery(name = "Coach.findByImage", query = "SELECT c FROM Coach c WHERE c.image = :image"),
    @NamedQuery(name = "Coach.findByActive", query = "SELECT c FROM Coach c WHERE c.active = :active")})
public class Coach implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "licenseplates")
    private String licenseplates;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private long price;
    @Size(max = 500)
    @Column(name = "describe")
    private String describe;
    @Size(max = 100)
    @Column(name = "image")
    private String image;
    @Column(name = "active")
    private Boolean active;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "coachId")
    private Collection<Coaches> coachesCollection;
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Category categoryId;

    public Coach() {
    }

    public Coach(Integer id) {
        this.id = id;
    }

    public Coach(Integer id, String name, String licenseplates, long price) {
        this.id = id;
        this.name = name;
        this.licenseplates = licenseplates;
        this.price = price;
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

    public String getLicenseplates() {
        return licenseplates;
    }

    public void setLicenseplates(String licenseplates) {
        this.licenseplates = licenseplates;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @XmlTransient
    public Collection<Coaches> getCoachesCollection() {
        return coachesCollection;
    }

    public void setCoachesCollection(Collection<Coaches> coachesCollection) {
        this.coachesCollection = coachesCollection;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
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
        if (!(object instanceof Coach)) {
            return false;
        }
        Coach other = (Coach) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hal.pojo.Coach[ id=" + id + " ]";
    }
    
}
