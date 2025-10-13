package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.ConsultationStatus;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "consultations")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_card_id", referencedColumnName = "cardId")
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "generalist_id", referencedColumnName = "id")
    private Generalist generalist;
    private LocalDateTime consultationDate;
    private String motif;
    private String observations;

    @Enumerated(EnumType.STRING)
    private ConsultationStatus status;

    private String diagnosis;
    private String traitement;
    private double cost;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expertise_request_id")
    private ExpertiseRequest expertiseRequest;

    // Default constructor
    public Consultation() {}

    public Consultation(Patient patient, Generalist generalist, LocalDateTime consultationDate, String motif, String observations, ConsultationStatus status, String diagnosis, String traitement, double cost, ExpertiseRequest expertiseRequest) {
        this.patient = patient;
        this.generalist = generalist;
        this.consultationDate = consultationDate;
        this.motif = motif;
        this.observations = observations;
        this.status = status;
        this.diagnosis = diagnosis;
        this.traitement = traitement;
        this.cost = cost;
        this.expertiseRequest = expertiseRequest;
    }

    // Getters
    public int getId() { return id; }
    public Patient getPatient() { return patient; }
    public Generalist getGeneralist() { return generalist; }
    public LocalDateTime getConsultationDate() { return consultationDate; }
    public String getMotif() { return motif; }
    public String getObservations() { return observations; }
    public ConsultationStatus getStatus() { return status; }
    public String getDiagnosis() { return diagnosis; }
    public String getTraitement() { return traitement; }
    public double getCost() { return cost; }
    public ExpertiseRequest getExpertiseRequest() { return expertiseRequest; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setPatient(Patient patient) { this.patient = patient; }
    public void setGeneralist(Generalist generalist) { this.generalist = generalist; }
    public void setConsultationDate(LocalDateTime consultationDate) { this.consultationDate = consultationDate; }
    public void setMotif(String motif) { this.motif = motif; }
    public void setObservations(String observations) { this.observations = observations; }
    public void setStatus(ConsultationStatus status) { this.status = status; }
    public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }
    public void setTraitement(String traitement) { this.traitement = traitement; }
    public void setCost(double cost) { this.cost = cost; }
    public void setExpertiseRequest(ExpertiseRequest expertiseRequest) { this.expertiseRequest = expertiseRequest; }
}
