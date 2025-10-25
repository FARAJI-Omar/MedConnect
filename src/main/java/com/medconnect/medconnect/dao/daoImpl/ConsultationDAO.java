package com.medconnect.medconnect.dao.daoImpl;

import com.medconnect.medconnect.dao.GenericDao;
import com.medconnect.medconnect.model.Consultation;
import com.medconnect.medconnect.util.DatabaseManager;
import jakarta.persistence.EntityManager;

import java.util.List;

public class ConsultationDAO implements GenericDao<Consultation> {
    
    @Override
    public List<Consultation> findAll() {
        EntityManager em = DatabaseManager.getEntityManager();
        List<Consultation> consultations = null;

        try {
            // Use JOIN FETCH to eagerly load patient data to avoid LazyInitializationException
            consultations = em.createQuery(
                    "SELECT DISTINCT c FROM Consultation c " +
                    "LEFT JOIN FETCH c.patient " +
                    "LEFT JOIN FETCH c.generalist " +
                    "ORDER BY c.consultationDate DESC", Consultation.class)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            consultations = null;
        } finally {
            em.close();
        }

        return consultations;
    }

    @Override
    public void save(Consultation consultation) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(consultation);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Consultation consultation) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(consultation);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Consultation consultation) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            Consultation managed = em.merge(consultation);
            em.remove(managed);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Consultation findById(int id) {
        EntityManager em = DatabaseManager.getEntityManager();
        Consultation consultation = null;

        try {
            consultation = em.find(Consultation.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return consultation;
    }
}

