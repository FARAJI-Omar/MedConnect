package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.Role;
import jakarta.persistence.Entity;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.Table;


@Entity
@Table(name = "general_docs")
public class Generalist extends User {

    // Default constructor
    public Generalist() {
        super();
    }

    public Generalist(String name, String email, String password) {

        super(name, email, password, Role.GENERALIST);
    }
}
