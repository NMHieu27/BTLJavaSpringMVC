/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.Coach;
import com.hal.repository.CoachRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
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
public class CoachRepositoryImpl implements CoachRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Coach> getCoach(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Coach> query = builder.createQuery(Coach.class);
        Root root = query.from(Coach.class);
        query = query.select(root);
        if(name != null){
            Predicate p = builder.like(root.get("name").as(String.class), name.trim());
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addCoach(Coach coach) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(coach);
            return true;
        }catch(HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public Coach getCoachById(int coachId) {
        Coach coach;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        coach = session.get(Coach.class, coachId);
        return coach;
    }

    @Override
    public boolean deleteCoach(Coach coach) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(coach);
            return true;
        }
        catch(HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateCoachByAdmin(Coach coach, int coachId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaUpdate <Coach> cu = builder.createCriteriaUpdate(Coach.class);
        Root root = cu.from(Coach.class);
        cu.set("name", coach.getName());
        cu.set("licenseplates", coach.getLicenseplates());
        cu.set("price", coach.getPrice());
        cu.set("describe", coach.getDescribe());
        cu.set("active", coach.getActive());
        cu.set("categoryId", coach.getCategoryId());
        cu = cu.where(builder.equal(root.get("id").as(Integer.class), coachId));
        return session.createQuery(cu).executeUpdate() > 0;
    }
    
}
