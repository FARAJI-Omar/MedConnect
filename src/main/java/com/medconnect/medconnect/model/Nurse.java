package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Role;
import jakarta.persistence.Entity;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.Table;


@Entity
@Table(name = "nurses")
public class Nurse extends User {

    // Default constructor
    public Nurse() {
        super();
    }

    public Nurse(String name, String email, String password) {

        super(name, email, password, Role.NURSE);
    }
}
