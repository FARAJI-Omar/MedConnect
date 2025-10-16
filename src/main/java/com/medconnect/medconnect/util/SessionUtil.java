package com.medconnect.medconnect.util;

import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.model.enums.Role;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.List;

public class SessionUtil {
    public static boolean isAuthorized(HttpServletRequest request, Role... allowedRoles) {
        HttpSession session = request.getSession(false);
        if (session == null) return false;

        User user = (User) session.getAttribute("user");
        if (user == null) return false;

        // Convert varargs to list for easy contains()
        List<Role> roles = Arrays.asList(allowedRoles);
        return roles.contains(user.getRole());
    }
}
