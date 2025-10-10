package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.model.enums.Speciality;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.util.List;

@Entity
@Table(name = "specialist_docs")
public class Specialist extends User {
    private Speciality speciality;
    private double tariff;
    private double duration;
//    private List<TimeSlot> availableTimeSlots;
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

    //setters
    public void setSpeciality(Speciality speciality) {
        this.speciality = speciality;
    }
    public void setTariff(double tariff) {
        this.tariff = tariff;
    }
}
