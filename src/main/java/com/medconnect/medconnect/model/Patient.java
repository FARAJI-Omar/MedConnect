package com.medconnect.medconnect.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
public class Patient {
    @Id
    @Column(nullable = false, unique = true)
    private String cardId;

    private String name;
    private LocalDateTime birthDate;

    @Column(name = "security_number")
    private String secuNumber;

    private String address;
    private String phone;
    private String insurance;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<MedicalRecord> medicalRecords = new ArrayList<>();

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Consultation> consultations = new ArrayList<>();

    //default constructor
    public Patient() {}

    public  Patient(String cardId, String name, LocalDateTime birthDate, String secuNumber, String address, String phone, String insurance) {
        this.cardId = cardId;
        this.name = name;
        this.birthDate = birthDate;
        this.secuNumber = secuNumber;
        this.address = address;
        this.phone = phone;
        this.insurance = insurance;
    }

    //getters
    public String getCardId() {
        return cardId;
    }
    public String getName() {
        return name;
    }
    public  LocalDateTime getBirthDate() {
        return birthDate;
    }
    public String getSecuNumber() {
        return secuNumber;
    }
    public String getAddress() {
        return address;
    }
    public String getPhone() {
        return phone;
    }
    public String getInsurance() {
        return insurance;
    }

    public List<MedicalRecord> getMedicalRecords() {
        return medicalRecords;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    //setters
    public void setCardId(String cardId) {
        this.cardId = cardId;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setBirthDate(LocalDateTime birthDate) {
        this.birthDate = birthDate;
    }
    public void setSecuNumber(String secuNumber) {
        this.secuNumber = secuNumber;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }

    public void setMedicalRecords(List<MedicalRecord> medicalRecords) {
        this.medicalRecords = medicalRecords;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    // Convenience methods for managing the relationship
    public void addMedicalRecord(MedicalRecord medicalRecord) {
        medicalRecords.add(medicalRecord);
        medicalRecord.setPatient(this);
    }

    public void removeMedicalRecord(MedicalRecord medicalRecord) {
        medicalRecords.remove(medicalRecord);
        medicalRecord.setPatient(null);
    }

    // Convenience methods for managing consultations
    public void addConsultation(Consultation consultation) {
        consultations.add(consultation);
        consultation.setPatient(this);
    }

    public void removeConsultation(Consultation consultation) {
        consultations.remove(consultation);
        consultation.setPatient(null);
    }
}