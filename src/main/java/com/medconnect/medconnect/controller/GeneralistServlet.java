package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.Consultation;
import com.medconnect.medconnect.model.MedicalRecord;
import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.service.ConsultationService;
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

@WebServlet("/generalist")
public class GeneralistServlet extends HttpServlet {
    private PatientService patientService;
    private MedicalRecordService medicalRecordService;
    private ConsultationService consultationService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.patientService = new PatientService();
        this.medicalRecordService = new MedicalRecordService();
        this.consultationService = new ConsultationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
        if (!SessionUtil.isAuthorized(request, Role.GENERALIST)) {
            response.sendRedirect("home");
            return;
        }

        // Fetch all patients
        List<Patient> patients = patientService.getAllPatients();
        request.setAttribute("patients", patients);

        // Check if a specific patient is selected
        String selectedPatientId = request.getParameter("patientId");
        if (selectedPatientId != null && !selectedPatientId.isEmpty()) {
            // Load selected patient data
            Patient selectedPatient = patientService.getPatientByCardId(selectedPatientId);
            if (selectedPatient != null) {
                request.setAttribute("selectedPatient", selectedPatient);

                // Load medical record for selected patient
                MedicalRecord medicalRecord = medicalRecordService.getMedicalRecordByPatientCardId(selectedPatientId);
                request.setAttribute("medicalRecord", medicalRecord);
            }
        }

        // fetch consultations
        List<Consultation> consultations = consultationService.getAllConsultations();
        request.setAttribute("consultations", consultations);

        request.getRequestDispatcher("generalistDashboard.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
        this.patientService = null;
        this.medicalRecordService = null;
    }
}
