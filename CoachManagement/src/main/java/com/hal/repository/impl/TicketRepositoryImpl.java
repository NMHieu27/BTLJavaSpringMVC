/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository.impl;

import com.hal.pojo.Coaches;
import com.hal.pojo.Ticket;
import com.hal.repository.TicketRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class TicketRepositoryImpl implements TicketRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public Ticket addTicket(Ticket ticket) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(ticket);
            return ticket;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    
    @Override
    public List<Ticket> getTicketsByChoachesId(int coachesId){
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Ticket> query = builder.createQuery(Ticket.class);

        Root rootTicket = query.from(Ticket.class);
        
        query.select(rootTicket);
        System.out.println(rootTicket.get("coachesId").get("id"));
        query.where(builder.equal(rootTicket.get("coachesId"), coachesId));

        
        return session.createQuery(query).getResultList();
    }

}
