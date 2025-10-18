package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Sexe;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.time.LocalTime;
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

    @Enumerated(EnumType.STRING)
    private Sexe sexe;

    private String address;
    private String phone;
    private String insurance;
    private LocalTime queueTime;

    @OneToOne(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private MedicalRecord medicalRecord;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Consultation> consultations = new ArrayList<>();

    @OneToOne(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private VitalSigns vitalSigns;

    //default constructor
    public Patient() {}

    public  Patient(String cardId, String name, LocalDateTime birthDate, String secuNumber, String address, String phone, String insurance, Sexe sexe) {
        this.cardId = cardId;
        this.name = name;
        this.birthDate = birthDate;
        this.secuNumber = secuNumber;
        this.address = address;
        this.phone = phone;
        this.insurance = insurance;
        this.sexe = sexe;
    }

    //getters
    public String getCardId() {
        return cardId;
    }
    public String getName() {
        return name;
    }
    public LocalDateTime getBirthDate() {
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
    public String getInsurance() { return insurance;}
    public Sexe getSexe() { return sexe; }
    public LocalTime getQueueTime() { return queueTime; }

    public MedicalRecord getMedicalRecord() {
        return medicalRecord;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public VitalSigns getVitalSigns() {
        return vitalSigns;
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
    public void setSexe(Sexe sexe) { this.sexe = sexe;}
    public void setQueueTime(LocalTime queueTime) { this.queueTime = queueTime; }

    public void setMedicalRecords(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public void setVitalSigns(VitalSigns vitalSigns) {
        this.vitalSigns = vitalSigns;
    }

    // Convenience methods for managing the relationship
    public void addMedicalRecord(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
        if (medicalRecord != null) {
            medicalRecord.setPatient(this);
        }
    }

    public void removeMedicalRecord() {
        if (this.medicalRecord != null) {
            this.medicalRecord.setPatient(null);
            this.medicalRecord = null;
        }
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
