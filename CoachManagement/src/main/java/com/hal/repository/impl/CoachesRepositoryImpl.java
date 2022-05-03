/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository.impl;

import com.hal.pojo.Coach;
import com.hal.pojo.Coaches;
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
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Linh
 */
@Repository
@Transactional
public class CoachesRepositoryImpl implements CoachesRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getCoaches(int start, int end, Date startDate) {
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
