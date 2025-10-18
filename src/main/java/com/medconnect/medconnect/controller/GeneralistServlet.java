package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.MedicalRecord;
import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.MedicalRecordService;
import com.medconnect.medconnect.service.PatientService;
import com.medconnect.medconnect.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/generalist")
public class GeneralistServlet extends HttpServlet {
    private PatientService patientService;
    private MedicalRecordService medicalRecordService;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize services in init method
        this.patientService = new PatientService();
        this.medicalRecordService = new MedicalRecordService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //session check
        if (!SessionUtil.isAuthorized(request, Role.GENERALIST)) {
            response.sendRedirect("home");
            return;
        }

        // Fetch all patients using service
        List<Patient> patients = patientService.getAllPatients();

        // Fetch medical records for each patient using service
        Map<String, MedicalRecord> patientMedicalRecords = null;
        if (patients != null && !patients.isEmpty()) {
            List<String> patientCardIds = patients.stream()
                    .map(Patient::getCardId)
                    .collect(Collectors.toList());

            patientMedicalRecords = medicalRecordService.getMedicalRecordsMapByCardIds(patientCardIds);
        }

        // Set attributes for JSP
        request.setAttribute("patients", patients);
        request.setAttribute("patientMedicalRecords", patientMedicalRecords);

        request.getRequestDispatcher("generalistDashboard.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
        // Clean up resources if needed
        this.patientService = null;
        this.medicalRecordService = null;
    }
}
