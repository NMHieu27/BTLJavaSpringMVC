/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository.impl;

import com.hal.pojo.Coach;
import com.hal.pojo.Coaches;
import com.hal.pojo.Pricechange;
import com.hal.pojo.Route;
import com.hal.pojo.User;
import com.hal.repository.CoachesRepository;
import java.util.ArrayList;
import java.util.List;
import com.hal.pojo.Route;
import com.hal.pojo.Station;
import com.hal.repository.CoachesRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 * @author Linh
 */
@Repository
@Transactional
public class CoachesRepositoryImpl implements CoachesRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getCoaches(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootCoaches = query.from(Coaches.class);
        Root rootRoute = query.from(Route.class);
        Root rootUser = query.from(User.class);
        Root rootCoach = query.from(Coach.class);
        Root rootPrice = query.from(Pricechange.class);

        List<Predicate> predicates = new ArrayList<>();
        if (name != null) {
            predicates.add(builder.like(rootCoaches.get("name").as(String.class), name.trim()));
        }
        predicates.add(builder.equal(rootCoaches.get("routeId"), rootRoute.get("id")));
        predicates.add(builder.equal(rootCoaches.get("driverId"), rootUser.get("id")));
        predicates.add(builder.equal(rootCoaches.get("coachId"), rootCoach.get("id")));
        predicates.add(builder.equal(rootCoaches.get("pricechangeId"), rootPrice.get("id")));

        query.multiselect(rootCoaches.get("id"), rootCoaches.get("name"),
                rootCoaches.get("startTime"), rootCoaches.get("endTime"),
                rootCoaches.get("emptySeats"), rootCoaches.get("describe"),
                rootCoaches.get("unitprice"), rootCoaches.get("isStarted"),
                rootCoaches.get("isCanceled"), rootRoute.get("name"),
                rootUser.get("fullname"), rootCoach.get("name"), rootPrice.get("name"));
        query.where(predicates.toArray(new Predicate[]{}));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Coaches getCoachesById(int coachesId) {
        Coaches coaches;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        coaches = session.get(Coaches.class, coachesId);
        return coaches;
    }

    @Override
    public boolean deleteCoaches(Coaches coaches) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(coaches);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean addCoaches(Coaches coaches) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(coaches);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    @Override
    public List<Object[]> getCoachesForBooking(int start, int end, Date startDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootCoaches = query.from(Coaches.class);
        Root rootRoute = query.from(Route.class);
        Root rootSationStart = query.from(Station.class);
        Root rootStationEnd = query.from(Station.class);
        Root rootCoach = query.from(Coach.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootCoaches.get("routeId"), rootRoute.get("id")));
        predicates.add(builder.equal(rootCoaches.get("coachId"), rootCoach.get("id")));
        predicates.add(builder.equal(rootCoaches.get("isStarted"), 0));
        predicates.add(builder.equal(rootRoute.get("startingpointId"), rootSationStart.get("id")));
        predicates.add(builder.equal(rootSationStart.get("locationId"), start));
        predicates.add(builder.equal(rootRoute.get("destinationId"), rootStationEnd.get("id")));
        predicates.add(builder.equal(rootStationEnd.get("locationId"), end));
        predicates.add(builder.equal(builder.function("date", Date.class, rootCoaches.get("startTime")), startDate));

        query.multiselect(
                rootCoaches.get("name"),
                rootCoaches.get("startTime"),
                rootCoaches.get("endTime"),
                rootCoaches.get("emptySeats"),
                rootCoaches.get("priceChange"),
                rootRoute.get("name"),
                rootSationStart.get("name"),
                rootStationEnd.get("name"),
                rootCoach.get("name"),
                rootCoach.get("image"),
                rootCoach.get("id"),
                rootRoute.get("id"),
                rootCoaches.get("id")
                );
        
        query.where(predicates.toArray(new Predicate[] {}));
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    @Override
    public List<Object[]> getCoachesById(int coachesId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootCoaches = query.from(Coaches.class);
        Root rootRoute = query.from(Route.class);
        Root rootSationStart = query.from(Station.class);
        Root rootStationEnd = query.from(Station.class);
        Root rootCoach = query.from(Coach.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootCoaches.get("id"), coachesId));
        predicates.add(builder.equal(rootCoaches.get("routeId"), rootRoute.get("id")));
        predicates.add(builder.equal(rootCoaches.get("coachId"), rootCoach.get("id")));
        predicates.add(builder.equal(rootRoute.get("startingpointId"), rootSationStart.get("id")));
        predicates.add(builder.equal(rootRoute.get("destinationId"), rootStationEnd.get("id")));        

        query.multiselect(
                rootCoaches.get("name"),
                rootCoaches.get("startTime"),
                rootCoaches.get("endTime"),
                rootCoaches.get("emptySeats"),
                rootCoaches.get("priceChange"),
                rootRoute.get("name"),
                rootSationStart.get("name"),
                rootStationEnd.get("name"),
                rootCoach.get("name"),
                rootCoach.get("image")
                );
        
        query.where(predicates.toArray(new Predicate[] {}));
        Query q = session.createQuery(query);
        return q.getResultList();
    }
}
