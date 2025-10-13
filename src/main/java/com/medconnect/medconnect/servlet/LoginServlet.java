package com.medconnect.medconnect.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get data from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        request.setAttribute("email", email);
        request.setAttribute("password", password);
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
}
