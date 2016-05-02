package com.usermanager.dao;

import com.usermanager.model.Pages;
import com.usermanager.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    private SessionFactory sessionFactory;
    private Pages pages = new Pages();
    private int countPage = 0;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User saved : " + user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User updated : " + user);
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user!=null) {
            session.delete(user);
        }
        logger.info("User removed : " + user);
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        logger.info("User loaded : " + user);
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getUserByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User WHERE name=" + name);
        return query.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        pages.setMaxSizePage(((Long) session.createQuery("select count(*) from User").uniqueResult()).intValue());
        Query query = session.createQuery("FROM User");
        query.setFirstResult(pages.getPage());
        query.setMaxResults(pages.getSizePage());
        return query.list();
    }

    public void nextPage() {
        Session session = this.sessionFactory.getCurrentSession();
        pages.setMaxSizePage(((Long) session.createQuery("select count(*) from User").uniqueResult()).intValue());
        if (!((pages.getPage() + pages.getSizePage()) >= pages.getMaxSizePage())) {
            pages.setPage(pages.getPage() + pages.getSizePage());
            countPage++;
        }
    }

    public void prevPage() {
        Session session = this.sessionFactory.getCurrentSession();
        pages.setMaxSizePage(((Long) session.createQuery("select count(*) from User").uniqueResult()).intValue());
        if (!((pages.getPage() - pages.getSizePage()) < 0)) {
            pages.setPage(pages.getPage() - pages.getSizePage());
            countPage--;
        }
    }

    public void firstPage() {
        pages.setPage(0);
        countPage = 0;
    }

    /*

    THIS IS A DEFAULT METHOD -------------------------------------
    return list objects

        @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for (User user : userList) {
            logger.info("User list : " + user);
        }
        return userList;
    }

    --------------------------------------------------------------

    THIS IS MY METHOD ============================================
    return part of list objects

        @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User");
        query.setFirstResult(0);
        query.setMaxResults(5);
        return query.list();
    }

    ===============================================================

    THIS IS MY METHOD #2 ++++++++++++++++++++++++++++++++++++++++++
    return part of list objects

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {

        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(User.class);
        criteria.setFirstResult(10);
        criteria.setMaxResults(20);
        List<User> firstPage = criteria.list();
        Criteria criteriaCount = session.createCriteria(User.class);
        criteriaCount.setProjection(Projections.rowCount());
        Long count = (Long) criteriaCount.uniqueResult();
        return firstPage;


    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.openSession();
        this.pages.setMaxSizePage(((Long) session.createQuery("select count(*) from User").uniqueResult()).intValue());
        Query query = session.createQuery("FROM User");
        query.setFirstResult(this.pages.getPage());
        query.setMaxResults(5);
        return query.list();
    }


     */
}
