package com.medconnect.medconnect.service;

import com.medconnect.medconnect.dao.daoImpl.ConsultationDAO;
import com.medconnect.medconnect.model.Consultation;

import java.util.List;

public class ConsultationService {
    private final ConsultationDAO consultationDAO;

    public ConsultationService() {
        this.consultationDAO = new ConsultationDAO();
    }

    // Get all consultations
    public List<Consultation> getAllConsultations() {
        return consultationDAO.findAll();
    }

    // Get consultation by ID
    public Consultation getConsultationById(int id) {
        return consultationDAO.findById(id);
    }

    // Add a new consultation
    public void addConsultation(Consultation consultation) {
        consultationDAO.save(consultation);
    }

    // Update an existing consultation
    public void updateConsultation(Consultation consultation) {
        consultationDAO.update(consultation);
    }

    // Delete a consultation
    public void deleteConsultation(Consultation consultation) {
        consultationDAO.delete(consultation);
    }
}

