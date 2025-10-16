package com.medconnect.medconnect.service;

import com.medconnect.medconnect.dao.daoImpl.UserDAO;
import com.medconnect.medconnect.model.Generalist;
import com.medconnect.medconnect.model.Nurse;
import com.medconnect.medconnect.model.Specialist;
import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.util.PasswordUtil;
import jakarta.servlet.http.HttpSession;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

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

    public User login(String email, String password) {
        // Check if user exists by email
        User user = userDAO.findByEmail(email);

        if (user == null) {
            return null; // User not found
        }

        // Check if password matches
        if (PasswordUtil.verifyPassword(password, user.getPassword())) {
            return user; // Login successful
        }

        return null; // Invalid password
    }

    public void logout(HttpSession session) {
        if (session != null) {
            session.invalidate(); //destroy session data
        }
    }
}
