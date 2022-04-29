/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "pricechange")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pricechange.findAll", query = "SELECT p FROM Pricechange p"),
    @NamedQuery(name = "Pricechange.findById", query = "SELECT p FROM Pricechange p WHERE p.id = :id"),
    @NamedQuery(name = "Pricechange.findByName", query = "SELECT p FROM Pricechange p WHERE p.name = :name"),
    @NamedQuery(name = "Pricechange.findByValue", query = "SELECT p FROM Pricechange p WHERE p.value = :value")})
public class Pricechange implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "value")
    private BigDecimal value;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pricachangeId")
    private Collection<Coaches> coachesCollection;

    public Pricechange() {
    }

    public Pricechange(Integer id) {
        this.id = id;
    }

    public Pricechange(Integer id, String name, BigDecimal value) {
        this.id = id;
        this.name = name;
        this.value = value;
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

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    @XmlTransient
    public Collection<Coaches> getCoachesCollection() {
        return coachesCollection;
    }

    public void setCoachesCollection(Collection<Coaches> coachesCollection) {
        this.coachesCollection = coachesCollection;
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
        if (!(object instanceof Pricechange)) {
            return false;
        }
        Pricechange other = (Pricechange) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hal.pojo.Pricechange[ id=" + id + " ]";
    }
    
}
