package com.medconnect.medconnect.servlet;

import com.medconnect.medconnect.dao.UserDAO;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get data from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Role userRole = Role.valueOf(role.toUpperCase());
            userService.register(name, email, password, userRole);
            response.sendRedirect("login");
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid role selected.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
