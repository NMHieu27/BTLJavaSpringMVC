/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository.impl;

import com.hal.pojo.Comment;
import com.hal.pojo.Coaches;
import com.hal.pojo.Route;
import com.hal.pojo.Coach;
import com.hal.pojo.User;
import com.hal.repository.CommentRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
 * @author Linh
 */
@Repository
@Transactional
public class CommentRepositoryImpl implements CommentRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getComments(int coachId, int routeId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootCoaches = query.from(Coaches.class);
        Root rootRoute = query.from(Route.class);
        Root rootComment = query.from(Comment.class);
        Root rootCoach = query.from(Coach.class);
        Root rootUser = query.from(User.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootComment.get("coachesId"), rootCoaches.get("id")));
        predicates.add(builder.equal(rootCoaches.get("coachId"), rootCoach.get("id")));
        predicates.add(builder.equal(rootCoaches.get("routeId"), rootRoute.get("id")));
        predicates.add(builder.equal(rootComment.get("user"), rootUser.get("id")));
        predicates.add(builder.equal(rootCoach.get("id"), coachId));
        predicates.add(builder.equal(rootRoute.get("id"), routeId));

        query.multiselect(
                rootUser.get("fullname"),
                rootComment.get("createdDate"),
                rootComment.get("content")
        );

        query.where(predicates.toArray(new Predicate[]{}));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Comment addComment(Comment comment) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(comment);
            return comment;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
