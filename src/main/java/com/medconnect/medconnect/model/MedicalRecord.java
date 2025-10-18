package com.medconnect.medconnect.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "medical_records")
public class MedicalRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne (fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_card_id", referencedColumnName = "cardId")
    private Patient patient;

    private String medicalHistory;
    private String allergies;
    private String ongoingTreatments;

    // Default constructor
    public MedicalRecord() {}

    public MedicalRecord(int id, String medicalHistory, String allergies, String ongoingTreatments) {
        this.id = id;
        this.medicalHistory = medicalHistory;
        this.allergies = allergies;
        this.ongoingTreatments = ongoingTreatments;
    }

    // Getters
    public int getCardNumber() {
        return id;
    }

    public Patient getPatient() {
        return patient;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public String getAllergies() {
        return allergies;
    }

    public String getOngoingTreatments() {
        return ongoingTreatments;
    }

    // Setters
    public void setCardNumber(int id) {
        this.id = id;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public void setOngoingTreatments(String ongoingTreatments) {
        this.ongoingTreatments = ongoingTreatments;
    }
}