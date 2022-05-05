/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.Station;
import com.hal.repository.StationRepository;
import java.util.List;
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
 * @author Asus
 */
@Repository
@Transactional
public class StationRepositoryImpl implements StationRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public List<Station> getStation(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Station> query = builder.createQuery(Station.class);
        Root root = query.from(Station.class);
        query = query.select(root);
        if(!kw.isEmpty() && kw != null){
            Predicate p = builder.like(root.get("name").as(String.class), "%" + kw.trim() + "%");
            query = query.where(p);
        }
        return session.createQuery(query).getResultList();
    }
    
}
