package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.PatientService;
import com.medconnect.medconnect.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalTime;

@WebServlet("/queue")
public class NurseQueueServlet extends HttpServlet {
    private PatientService patientService;

    @Override
    public void init() {
        this.patientService = new PatientService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //session check
        if (!SessionUtil.isAuthorized(request, Role.NURSE)) {
            response.sendRedirect("home");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/nurse");
            return;
        }

        try {
            String patientId = request.getParameter("patientId");
            switch (action) {
                case "add":
                    String timeStr = request.getParameter("queueTime");
                    if (timeStr != null && !timeStr.isEmpty()) {
                        LocalTime queueTime = LocalTime.parse(timeStr);
                        patientService.addPatientToQueue(patientId, queueTime);
                    }
                    break;
                case "edit":
                    String editTimeStr = request.getParameter("queueTime");
                    if (editTimeStr != null && !editTimeStr.isEmpty()) {
                        LocalTime newQueueTime = LocalTime.parse(editTimeStr);
                        patientService.editQueueTime(patientId, newQueueTime);
                    }
                    break;
                case "remove":
                    patientService.removePatientFromQueue(patientId);
                    break;
            }
        } catch (NumberFormatException e) {
            // Handle error - patientId might not be a valid number
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/nurse");
    }
}