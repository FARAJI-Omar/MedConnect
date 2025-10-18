package com.medconnect.medconnect.dao.daoImpl;

import com.medconnect.medconnect.dao.GenericDao;
import com.medconnect.medconnect.model.MedicalRecord;
import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.util.DatabaseManager;
import jakarta.persistence.EntityManager;

import java.util.List;

public class MedicalRecordDAO implements GenericDao<MedicalRecord> {
    @Override
    public List<MedicalRecord> findAll() {
        EntityManager em = DatabaseManager.getEntityManager();
        List<MedicalRecord> medicalRecords = null;

        try {
            medicalRecords = em.createQuery(
                    "SELECT mr FROM MedicalRecord mr", MedicalRecord.class)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            medicalRecords = null;
        } finally {
            em.close();
        }

        return medicalRecords;
    }

    @Override
    public void save(MedicalRecord medicalRecord) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(medicalRecord);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void update(MedicalRecord medicalRecord) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(medicalRecord);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(MedicalRecord medicalRecord) {
        EntityManager em = DatabaseManager.getEntityManager();

        try {
            em.getTransaction().begin();
            MedicalRecord managed = em.merge(medicalRecord);
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
    public MedicalRecord findById(int id) {
        EntityManager em = DatabaseManager.getEntityManager();
        MedicalRecord medicalRecord = null;

        try {
            medicalRecord = em.find(MedicalRecord.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return medicalRecord;
    }

    // Find MedicalRecord by Patient's card ID
    public MedicalRecord findByPatientCardId(String cardId) {
        EntityManager em = DatabaseManager.getEntityManager();
        MedicalRecord medicalRecord = null;

        try {
            // Find patient first, then get their medical record through the relationship
            Patient patient = em.find(Patient.class, cardId);
            if (patient != null) {
                medicalRecord = patient.getMedicalRecord();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return medicalRecord;
    }
}
