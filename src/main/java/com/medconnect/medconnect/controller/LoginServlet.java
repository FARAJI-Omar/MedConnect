package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService();

        // Log initialization for debugging
        getServletContext().log("LoginServlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to login JSP page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.login(email, password);

        if (user != null) {
            // Login successful - store user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userRole", user.getRole());
            session.setAttribute("userName", user.getName());

            // Redirect based on user role
            if (user.getRole() == Role.NURSE) {
                response.sendRedirect(request.getContextPath() + "/nurse");
            } else if (user.getRole() == Role.GENERALIST) {
                response.sendRedirect(request.getContextPath() + "/generalist");
            } else if (user.getRole() == Role.SPECIALIST) {
                response.sendRedirect(request.getContextPath() + "/specialist");
            } else {
                // Default redirect
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } else {
            // Login failed - redirect back to login with error message
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
