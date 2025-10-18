package com.medconnect.medconnect.service;

import com.medconnect.medconnect.dao.daoImpl.MedicalRecordDAO;
import com.medconnect.medconnect.model.MedicalRecord;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MedicalRecordService {
    private final MedicalRecordDAO medicalRecordDAO;

    public MedicalRecordService() {
        this.medicalRecordDAO = new MedicalRecordDAO();
    }

    // get all medical records
    public List<MedicalRecord> getAllMedicalRecords() {
        return medicalRecordDAO.findAll();
    }

    // get medical record by patient card ID
    public MedicalRecord getMedicalRecordByPatientCardId(String cardId) {
        return medicalRecordDAO.findByPatientCardId(cardId);
    }

    // add a new medical record
    public void addMedicalRecord(MedicalRecord medicalRecord) {
        medicalRecordDAO.save(medicalRecord);
    }

    // update an existing medical record
    public void updateMedicalRecord(MedicalRecord medicalRecord) {
        medicalRecordDAO.update(medicalRecord);
    }

    // delete a medical record
    public void deleteMedicalRecord(MedicalRecord medicalRecord) {
        medicalRecordDAO.delete(medicalRecord);
    }

    // get medical record by its ID
    public MedicalRecord getMedicalRecordById(int id) {
        return medicalRecordDAO.findById(id);
    }

    // get a map of medical records by a list of patient card IDs
    public Map<String, MedicalRecord> getMedicalRecordsMapByCardIds(List<String> patientCardIds) {
        Map<String, MedicalRecord> medicalRecordsMap = new HashMap<>();

        if (patientCardIds != null) {
            for (String cardId : patientCardIds) {
                MedicalRecord medicalRecord = getMedicalRecordByPatientCardId(cardId);
                if (medicalRecord != null) {
                    medicalRecordsMap.put(cardId, medicalRecord);
                }
            }
        }

        return medicalRecordsMap;
    }
}

