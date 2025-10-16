package com.medconnect.medconnect.dao.daoImpl;

import com.medconnect.medconnect.dao.GenericDao;
import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.util.DatabaseManager;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalTime;
import java.util.List;

public class PatientDAO implements GenericDao<Patient> {
    @Override
    public List<Patient> findAll() {        // Return patients ordered by queueTime ascending
        EntityManager em = DatabaseManager.getEntityManager();
        List<Patient> patients = null;

        try {
            TypedQuery<Patient> query = em.createQuery(
                    "SELECT p FROM Patient p ORDER BY p.queueTime ASC, p.name ASC", Patient.class);
            patients = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            patients = null;
        } finally {
            em.close();
        }

        return patients;
    }

    @Override
    public void save(Patient patient) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(patient);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    //to be implemented later
    @Override
    public void update(Patient patient){}

    //to be implemented later
    @Override
    public void delete(Patient patient){}

    @Override
    public Patient findById(int id){
        return null; // Not implemented for Patient, as ID is String
    }

    public Patient findById(String cardId){
        EntityManager em = DatabaseManager.getEntityManager();
        Patient patient = null;

        try {
            patient = em.find(Patient.class, cardId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return patient;
    }

    public void updateQueueTime(String cardId, LocalTime queueTime) {
        EntityManager entityManager = DatabaseManager.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            Patient patient = entityManager.find(Patient.class, cardId);
            if (patient != null) {
                patient.setQueueTime(queueTime);
                entityManager.merge(patient);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }

    public void clearQueueTime(String cardId) {
        updateQueueTime(cardId, null);
    }
}
