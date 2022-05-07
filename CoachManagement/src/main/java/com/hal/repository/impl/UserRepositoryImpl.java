/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.repository.impl;

import com.hal.pojo.User;
import com.hal.repository.UserRepository;
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
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<User> getUsers(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (name != null && !name.isEmpty()) {
            Predicate p = builder.like(root.get("fullname").as(String.class), "%" + name.trim() + "%");
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public User getUserById(int userId) {
        User user;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        user = session.get(User.class, userId);
        return user;

    }

    @Override
    public boolean deleteUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(user);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<User> getUserByRole(String role) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!role.isEmpty()) {
            Predicate p = builder.equal(root.get("userRole").as(String.class), role);
            query = query.where(p);
        } 
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean updateUserByAdmin(User user, int userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaUpdate<User> cu = builder.createCriteriaUpdate(User.class);
        Root root = cu.from(User.class);
        cu.set("fullname", user.getFullname());
        cu.set("phone", user.getPhone());
        cu.set("gender", user.getGender());
        cu.set("address", user.getAddress());
        cu.set("userRole", user.getUserRole());
        cu.set("active", user.getActive());
        cu = cu.where(builder.equal(root.get("id").as(Integer.class), userId));
        return session.createQuery(cu).executeUpdate() > 0;
    }

    @Override
    public List<User> getUsersByUserName(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }
        return session.createQuery(query).getResultList();
    }

    @Override
    public boolean checkUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        query.where(builder.equal(builder.upper(root.get("username").as(String.class)), username.toUpperCase()));
        return session.createQuery(query).getSingleResult() == null;
    }

    @Override
    public boolean checkPhone(String phone) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        query.where(builder.equal(root.get("phone").as(String.class), phone));
        return session.createQuery(query).getSingleResult() == null;
    }
}
