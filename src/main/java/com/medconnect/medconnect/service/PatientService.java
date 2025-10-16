package com.medconnect.medconnect.service;

import com.medconnect.medconnect.dao.daoImpl.PatientDAO;
import com.medconnect.medconnect.model.Patient;

import java.time.LocalTime;
import java.util.List;

public class PatientService {
    private final PatientDAO patientDAO;

    public PatientService() {
        this.patientDAO = new PatientDAO();
    }

    public List<Patient> getAllPatients(){
        return patientDAO.findAll();
    }

    public void addPatient(Patient patient) {
        patientDAO.save(patient);
    }

    public void addPatientToQueue(String cardId, LocalTime time) {
        patientDAO.updateQueueTime(cardId, time);
    }

    public void editQueueTime(String cardId, LocalTime time) {
        patientDAO.updateQueueTime(cardId, time);
    }

    public void removePatientFromQueue(String cardId) {
        patientDAO.clearQueueTime(cardId);
    }
}
