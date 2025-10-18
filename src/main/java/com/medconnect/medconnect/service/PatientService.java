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

    // get all patients
    public List<Patient> getAllPatients(){
        return patientDAO.findAll();
    }

    // get patient by card ID
    public Patient getPatientByCardId(String cardId) {
        return patientDAO.findById(cardId);
    }

    // add a new patient
    public void addPatient(Patient patient) {
        patientDAO.save(patient);
    }

    // add patient to queue
    public void addPatientToQueue(String cardId, LocalTime time) {
        patientDAO.updateQueueTime(cardId, time);
    }

    // edit patient queue time
    public void editQueueTime(String cardId, LocalTime time) {
        patientDAO.updateQueueTime(cardId, time);
    }

    // remove patient from queue
    public void removePatientFromQueue(String cardId) {
        patientDAO.clearQueueTime(cardId);
    }
}
