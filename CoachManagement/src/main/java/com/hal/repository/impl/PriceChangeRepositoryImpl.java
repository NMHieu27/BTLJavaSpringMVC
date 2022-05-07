/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.Pricechange;
import com.hal.repository.PriceChangeRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class PriceChangeRepositoryImpl implements PriceChangeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Pricechange> getPriceChange(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Pricechange> query = builder.createQuery(Pricechange.class);
        Root root = query.from(Pricechange.class);
        query = query.select(root);
        if (name != null && !name.isEmpty()) {
            Predicate p = builder.like(root.get("name").as(String.class), "%" + name.trim() + "%");
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addPrice(Pricechange pricechange) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(pricechange);
            return true;
        }catch(HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public Pricechange getPriceById(int i) {
        Pricechange pricechange;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        pricechange = session.get(Pricechange.class, i);
        return pricechange;
    }

    @Override
    public boolean deletePrice(Pricechange prchng) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(prchng);
            return true;
        }
        catch(HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updatePrice(Pricechange pricechange, int priceId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaUpdate<Pricechange> cu = builder.createCriteriaUpdate(Pricechange.class);
        Root root = cu.from(Pricechange.class);
        cu.set("name", pricechange.getName());
        cu.set("value", pricechange.getValue());
        cu.where(builder.equal(root.get("id").as(Integer.class), priceId));
        
        return session.createQuery(cu).executeUpdate() > 0;
    }

    @Override
    public boolean checkPriceChangeName(String pricechange) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Pricechange> cr = builder.createQuery(Pricechange.class);
        Root root = cr.from(Pricechange.class);
        CriteriaQuery query = cr.select(root);
        query.where(builder.equal(builder.upper(root.get("name").as(String.class)), pricechange.toUpperCase()));
        return session.createQuery(query).getSingleResult() == null;
    }

}
