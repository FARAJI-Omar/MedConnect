package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.Consultation;
import com.medconnect.medconnect.model.Generalist;
import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.model.User;
import com.medconnect.medconnect.model.enums.ConsultationStatus;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.ConsultationService;
import com.medconnect.medconnect.service.PatientService;
import com.medconnect.medconnect.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/consultation")
public class ConsultationServlet extends HttpServlet {
    private ConsultationService consultationService;
    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.consultationService = new ConsultationService();
        this.patientService = new PatientService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
        if (!SessionUtil.isAuthorized(request, Role.GENERALIST)) {
            response.sendRedirect("home");
            return;
        }

        try {
            // Get generalist from session
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");
            
            if (user == null || !(user instanceof Generalist)) {
                response.sendRedirect("login");
                return;
            }
            
            Generalist generalist = (Generalist) user;

            // Get form parameters
            String patientCardId = request.getParameter("patientCardId");
            String costStr = request.getParameter("cost");
            String diagnosis = request.getParameter("diagnosis");
            String motif = request.getParameter("motif");
            String observations = request.getParameter("observations");
            String statusStr = request.getParameter("status");
            String traitement = request.getParameter("treatment");

            // Validate required fields
            if (patientCardId == null || patientCardId.trim().isEmpty()) {
                request.setAttribute("error", "Patient must be selected");
                request.getRequestDispatcher("generalist").forward(request, response);
                return;
            }

            if (diagnosis == null || diagnosis.trim().isEmpty()) {
                request.setAttribute("error", "Diagnosis is required");
                request.getRequestDispatcher("generalist").forward(request, response);
                return;
            }

            if (statusStr == null || statusStr.trim().isEmpty()) {
                request.setAttribute("error", "Status is required");
                request.getRequestDispatcher("generalist").forward(request, response);
                return;
            }

            // Get patient
            Patient patient = patientService.getPatientByCardId(patientCardId);
            if (patient == null) {
                request.setAttribute("error", "Patient not found");
                request.getRequestDispatcher("generalist").forward(request, response);
                return;
            }

            // Parse cost (default to 0.0 if empty or invalid)
            double cost = 0.0;
            if (costStr != null && !costStr.trim().isEmpty()) {
                try {
                    cost = Double.parseDouble(costStr);
                } catch (NumberFormatException e) {
                    cost = 0.0;
                }
            }

            // Parse status
            ConsultationStatus status;
            try {
                status = ConsultationStatus.valueOf(statusStr.toUpperCase());
            } catch (IllegalArgumentException e) {
                request.setAttribute("error", "Invalid consultation status");
                request.getRequestDispatcher("generalist").forward(request, response);
                return;
            }

            // Create consultation object
            Consultation consultation = new Consultation();
            consultation.setPatient(patient);
            consultation.setGeneralist(generalist);
            consultation.setConsultationDate(LocalDateTime.now());
            consultation.setCost(cost);
            consultation.setDiagnosis(diagnosis);
            consultation.setMotif(motif != null ? motif : "");
            consultation.setObservations(observations != null ? observations : "");
            consultation.setStatus(status);
            consultation.setTraitement(traitement != null ? traitement : "");

            // Save consultation
            consultationService.addConsultation(consultation);

            // Redirect back to generalist dashboard with success message
            response.sendRedirect(request.getContextPath() + "/generalist?patientId=" + patientCardId + "&success=consultation_saved");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while saving the consultation: " + e.getMessage());
            request.getRequestDispatcher("generalist").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        this.consultationService = null;
        this.patientService = null;
    }
}

