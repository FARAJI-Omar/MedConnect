package com.medconnect.medconnect.service;

import com.medconnect.medconnect.dao.UserDAO;
import com.medconnect.medconnect.model.Generalist;
import com.medconnect.medconnect.model.Nurse;
import com.medconnect.medconnect.model.Specialist;
import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.model.enums.Role;

public class UserService {
    private final UserDAO userDAO = new UserDAO();

    public void register(String name, String email, String password, Role role) {
        User user;
        switch (role) {
            case NURSE -> user = new Nurse(name, email, password);
            case GENERALIST -> user = new Generalist(name, email, password);
            case SPECIALIST -> user = new Specialist(name, email, password);
            default -> throw new IllegalArgumentException("Unknown role: " + role);
        }

        userDAO.save(user); // Hibernate handles saving data into both tables (parent: User, child: Nurse/Generalist/Specialist)
    }
}
