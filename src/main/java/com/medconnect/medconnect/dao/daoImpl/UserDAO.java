package com.medconnect.medconnect.dao.daoImpl;

import com.medconnect.medconnect.dao.GenericDao;
import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.util.DatabaseManager;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class UserDAO implements GenericDao<User> {

    @Override
    public void save(User user) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public User findByEmail(String email) {
        EntityManager em = DatabaseManager.getEntityManager();
        User user = null;

        try {
            TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            user = query.getSingleResult();
        } catch (Exception e) {
            // User not found or other exception
            user = null;
        } finally {
            em.close();
        }

        return user;
    }

    //to be implemented later
    @Override
    public void update(User user){}

    //to be implemented later
    @Override
    public void delete(User user){}

    //to be implemented later
    @Override
    public User findById(int id){
        return null;
    }

    //to be implemented later
    @Override
    public List<User> findAll(){
        return null;
    }
}
