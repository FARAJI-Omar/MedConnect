package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.UserService;
import com.medconnect.medconnect.util.PasswordUtil;
import com.medconnect.medconnect.util.ValidatorUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get data from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate input fields
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Name is required.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (!ValidatorUtil.isValidName(name.trim())) {
            request.setAttribute("error", "Invalid name format. Please use only letters, spaces, hyphens, apostrophes, and periods.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (!ValidatorUtil.isValidEmail(email.trim())) {
            request.setAttribute("error", "Invalid email format. Please enter a valid email address.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Password is required.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (!ValidatorUtil.isValidPassword(password)) {
            request.setAttribute("error", "Password must be at least 6 characters long.");
            forwardToRegisterPage(request, response);
            return;
        }

        if (role == null || role.trim().isEmpty()) {
            request.setAttribute("error", "Role is required.");
            forwardToRegisterPage(request, response);
            return;
        }

        try {
            Role userRole = Role.valueOf(role.toUpperCase());

            if (!ValidatorUtil.isValidRole(userRole.name())) {
                request.setAttribute("error", "Invalid role selected. Please choose from: Nurse, Generalist, or Specialist.");
                forwardToRegisterPage(request, response);
                return;
            }

            //hash password
            String hashedPassword = PasswordUtil.hashPassword(password);

            // Register user
            userService.register(name.trim(), email.trim(), hashedPassword, userRole);
            response.sendRedirect("login");

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid role selected. Please choose from: Nurse, Generalist, or Specialist.");
            forwardToRegisterPage(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            forwardToRegisterPage(request, response);
        }
    }

    private void forwardToRegisterPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }
}
