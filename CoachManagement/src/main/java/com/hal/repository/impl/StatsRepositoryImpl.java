/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.Coaches;
import com.hal.pojo.Route;
import com.hal.pojo.Ticket;
import com.hal.repository.StatsRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
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
public class StatsRepositoryImpl implements StatsRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Object[]> getRouteStat() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootR = query.from(Route.class);
        Root rootC = query.from(Coaches.class);
        
        query.where(builder.equal(rootR.get("id"), rootC.get("routeId")));
        query.multiselect(rootR.get("id"), rootR.get("name"), builder.count(rootC.get("id")));
        query.groupBy(rootR.get("id"));
        
        return session.createQuery(query).getResultList();
    }

    @Override
    public List<Object[]> getRevenueByMonth(int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Ticket.class);
        
        query.where(builder.equal(builder.function("YEAR", Integer.class, root.get("createdDate")), year));
        query.multiselect(builder.function("MONTH", Integer.class, root.get("createdDate")), builder.sum(root.get("price")));
        query.groupBy(builder.function("MONTH", Integer.class, root.get("createdDate")));
        
        return session.createQuery(query).getResultList();
    }

    @Override
    public List<Object[]> getRevenueByQuarter(int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Ticket.class);
        
        query.where(builder.equal(builder.function("YEAR", Integer.class, root.get("createdDate")), year));
        query.multiselect(builder.function("QUARTER", Integer.class, root.get("createdDate")), builder.sum(root.get("price")));
        query.groupBy(builder.function("QUARTER", Integer.class, root.get("createdDate")));
        query.orderBy(builder.asc(builder.function("QUARTER", Integer.class, root.get("createdDate"))));
       
        return session.createQuery(query).getResultList();
    }
    
}
