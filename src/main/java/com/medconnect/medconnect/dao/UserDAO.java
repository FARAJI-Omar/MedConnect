package com.medconnect.medconnect.dao;

import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.util.DatabaseManager;
import jakarta.persistence.EntityManager;

public class UserDAO {

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
}
