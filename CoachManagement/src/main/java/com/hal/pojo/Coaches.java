/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.pojo;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "coaches")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Coaches.findAll", query = "SELECT c FROM Coaches c"),
    @NamedQuery(name = "Coaches.findById", query = "SELECT c FROM Coaches c WHERE c.id = :id"),
    @NamedQuery(name = "Coaches.findByName", query = "SELECT c FROM Coaches c WHERE c.name = :name"),
    @NamedQuery(name = "Coaches.findByStartTime", query = "SELECT c FROM Coaches c WHERE c.startTime = :startTime"),
    @NamedQuery(name = "Coaches.findByEndTime", query = "SELECT c FROM Coaches c WHERE c.endTime = :endTime"),
    @NamedQuery(name = "Coaches.findByEmptySeats", query = "SELECT c FROM Coaches c WHERE c.emptySeats = :emptySeats"),
    @NamedQuery(name = "Coaches.findByDescribe", query = "SELECT c FROM Coaches c WHERE c.describe = :describe"),
    @NamedQuery(name = "Coaches.findByUnitprice", query = "SELECT c FROM Coaches c WHERE c.unitprice = :unitprice"),
    @NamedQuery(name = "Coaches.findByPricechange", query = "SELECT c FROM Coaches c WHERE c.pricechange = :pricechange"),
    @NamedQuery(name = "Coaches.findByIsStarted", query = "SELECT c FROM Coaches c WHERE c.isStarted = :isStarted"),
    @NamedQuery(name = "Coaches.findByIsCanceled", query = "SELECT c FROM Coaches c WHERE c.isCanceled = :isCanceled")})
public class Coaches implements Serializable {

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
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "empty_seats")
    private int emptySeats;
    @Size(max = 500)
    @Column(name = "describe")
    private String describe;
    @Column(name = "unitprice")
    private Long unitprice;
    @Column(name = "pricechange")
    private Long pricechange;
    @Column(name = "is_started")
    private Boolean isStarted;
    @Column(name = "is_canceled")
    private Boolean isCanceled;
    @JoinColumn(name = "coach_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Coach coachId;
    @JoinColumn(name = "pricechange_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pricechange pricechangeId;
    @JoinColumn(name = "route_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Route routeId;
    @JoinColumn(name = "driver_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User driverId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "coachesId")
    private Collection<Ticket> ticketCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "coachesId")
    private Collection<Comment> commentCollection;

    public Coaches() {
    }

    public Coaches(Integer id) {
        this.id = id;
    }

    public Coaches(Integer id, String name, Date startTime, Date endTime, int emptySeats) {
        this.id = id;
        this.name = name;
        this.startTime = startTime;
        this.endTime = endTime;
        this.emptySeats = emptySeats;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getEmptySeats() {
        return emptySeats;
    }

    public void setEmptySeats(int emptySeats) {
        this.emptySeats = emptySeats;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Long getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Long unitprice) {
        this.unitprice = unitprice;
    }

    public Long getPricechange() {
        return pricechange;
    }

    public void setPricechange(Long pricechange) {
        this.pricechange = pricechange;
    }

    public Boolean getIsStarted() {
        return isStarted;
    }

    public void setIsStarted(Boolean isStarted) {
        this.isStarted = isStarted;
    }

    public Boolean getIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(Boolean isCanceled) {
        this.isCanceled = isCanceled;
    }

    public Coach getCoachId() {
        return coachId;
    }

    public void setCoachId(Coach coachId) {
        this.coachId = coachId;
    }

    public Pricechange getPricechangeId() {
        return pricechangeId;
    }

    public void setPricechangeId(Pricechange pricechangeId) {
        this.pricechangeId = pricechangeId;
    }

    public Route getRouteId() {
        return routeId;
    }

    public void setRouteId(Route routeId) {
        this.routeId = routeId;
    }

    public User getDriverId() {
        return driverId;
    }

    public void setDriverId(User driverId) {
        this.driverId = driverId;
    }

    @XmlTransient
    public Collection<Ticket> getTicketCollection() {
        return ticketCollection;
    }

    public void setTicketCollection(Collection<Ticket> ticketCollection) {
        this.ticketCollection = ticketCollection;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
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
        if (!(object instanceof Coaches)) {
            return false;
        }
        Coaches other = (Coaches) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hal.pojo.Coaches[ id=" + id + " ]";
    }
    
}
