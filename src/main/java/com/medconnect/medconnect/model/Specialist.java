package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.model.enums.Speciality;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "specialist_docs")
public class Specialist extends User {

    @Enumerated(EnumType.STRING)
    private Speciality speciality;

    private double tariff;
    private double duration;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expertise_request_id")
    private ExpertiseRequest expertiseRequest;

    @OneToMany(mappedBy = "specialist", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<TimeSlot> availableTimeSlots;
    // Default constructor
    public Specialist() {
        super();
    }

    public Specialist(String name, String email, String password) {
        super(name, email, password, Role.SPECIALIST);
        this.duration = 30.0;
    }

    //getters
    public Speciality getSpeciality() {
        return speciality;
    }
    public double getTariff() {
        return tariff;
    }
    public double getDuration() {
        return duration;
    }
    public List<TimeSlot> getAvailableTimeSlots() {
        return availableTimeSlots;
    }

    //setters
    public void setSpeciality(Speciality speciality) {
        this.speciality = speciality;
    }
    public void setTariff(double tariff) {
        this.tariff = tariff;
    }

    public void setAvailableTimeSlots(List<TimeSlot> availableTimeSlots) {
        this.availableTimeSlots = availableTimeSlots;
    }
}
