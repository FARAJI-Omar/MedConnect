package com.medconnect.medconnect.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "vital_signs")
public class VitalSigns {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private LocalDateTime entryDate;
    private double temperature;
    private double heartRate;
    private double respiratoryRate;
    private double height;
    private double weight;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id", referencedColumnName = "cardId")
    private Patient patient;

    // Default constructor
    public VitalSigns() {}

    public VitalSigns(int id, LocalDateTime entryDate, double temperature, double heartRate, double respiratoryRate, double height, double weight, Patient patient) {
        this.id = id;
        this.entryDate = entryDate;
        this.temperature = temperature;
        this.heartRate = heartRate;
        this.respiratoryRate = respiratoryRate;
        this.height = height;
        this.weight = weight;
        this.patient = patient;
    }

    // Getters
    public int getId() { return id; }
    public LocalDateTime getEntryDate() { return entryDate; }
    public double getTemperature() { return temperature; }
    public double getHeartRate() { return heartRate; }
    public double getRespiratoryRate() { return respiratoryRate; }
    public double getHeight() { return height; }
    public double getWeight() { return weight; }
    public Patient getPatient() { return patient;}

    // Setters
    public void setEntryDate(LocalDateTime entryDate) { this.entryDate = entryDate; }
    public void setTemperature(double temperature) { this.temperature = temperature; }
    public void setHeartRate(double heartRate) { this.heartRate = heartRate; }
    public void setRespiratoryRate(double respiratoryRate) { this.respiratoryRate = respiratoryRate; }
    public void setHeight(double height) { this.height = height; }
    public void setWeight(double weight) { this.weight = weight; }
    public void setPatient(Patient patient) { this.patient = patient; }
}
