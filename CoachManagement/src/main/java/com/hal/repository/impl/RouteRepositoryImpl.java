/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.Route;
import com.hal.pojo.Station;
import com.hal.repository.RouteRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 */
@Repository
@Transactional
public class RouteRepositoryImpl implements RouteRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getRouteDetail(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootR = query.from(Route.class);
        Root rootStar = query.from(Station.class);
        Root rootDes = query.from(Station.class);

        List<Predicate> predicates = new ArrayList<>();
        if (name != null) {
            predicates.add(builder.like(rootR.get("name").as(String.class), name.trim()));
        }
        predicates.add(builder.equal(rootR.get("startingpointId"), rootStar.get("id")));
        predicates.add(builder.equal(rootR.get("destinationId"), rootDes.get("id")));

        query.multiselect(rootR.get("id"), rootR.get("name"), rootR.get("price"), rootStar.get("name"), rootDes.get("name"));

        query.where(predicates.toArray(new Predicate[]{}));
        Query q = session.createQuery(query);
        return q.getResultList();

    }

    @Override
    public boolean addRoute(Route route) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(route);
            return true;
        }catch(HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public Route getRouteById(int i) {
        Route route;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        route = session.get(Route.class, i);
        return route;
    }

    @Override
    public boolean deleteRoute(Route route) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(route);
            return true;
        }
        catch(HibernateException ex){
            System.out.println(ex);
        }
        return false;
    }

    @Override
    public List<Route> getRoutes(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Route> query = builder.createQuery(Route.class);
        Root root  =query.from(Route.class);
        
        if(kw != null){
            Predicate p = builder.like(root.get("name").as(String.class), kw.trim());
            query = query.where(p);
        }
        return session.createQuery(query).getResultList();
    }

}
