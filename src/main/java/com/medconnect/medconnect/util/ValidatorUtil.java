package com.medconnect.medconnect.util;

import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.model.enums.Sexe;

public class ValidatorUtil {
    // email validation regex
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return email != null && email.matches(emailRegex);
    }

    // password validation
    public static boolean isValidPassword(String password) {
        // Password must be at least 6 characters long
        return password != null && password.length() >= 6;
    }

    // name validation
    public static boolean isValidName(String name) {
        String nameRegex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
        return name != null && name.matches(nameRegex);
    }

    // validate role
    public static boolean isValidRole(String role) {
        for (Role r : Role.values()) {
            if (r.name().equals(role)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isValidSexe(String sexe) {
        for (Sexe s : Sexe.values()) {
            if (s.name().equals(sexe)) {
                return true;
            }
        }
        return false;
    }
}
