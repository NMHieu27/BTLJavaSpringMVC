/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository.impl;

import com.hal.pojo.Location;
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
import com.hal.repository.LocationRepository;

/**
 *
 * @author Linh
 */
@Repository
@Transactional
public class LocationRepositoryImpl implements LocationRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Location> getLocals(String locationName) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Location> query = builder.createQuery(Location.class);
        Root root = query.from(Location.class);
        query = query.select(root);

        if(locationName != null) {
            Predicate p = builder.equal(root.get("name").as(String.class), locationName.trim());
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }
}
