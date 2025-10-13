package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Role;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "general_docs")
public class Generalist extends User {

    @OneToMany(mappedBy = "generalist", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Consultation> consultations = new ArrayList<>();

    // Default constructor
    public Generalist() {
        super();
    }

    public Generalist(String name, String email, String password) {

        super(name, email, password, Role.GENERALIST);
    }

    // Getters
    public List<Consultation> getConsultations() {
        return consultations;
    }

    // Setters
    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    // Convenience methods for managing consultations
    public void addConsultation(Consultation consultation) {
        consultations.add(consultation);
        consultation.setGeneralist(this);
    }

    public void removeConsultation(Consultation consultation) {
        consultations.remove(consultation);
        consultation.setGeneralist(null);
    }
}
