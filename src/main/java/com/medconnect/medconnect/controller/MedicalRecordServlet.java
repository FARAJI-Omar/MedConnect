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

@WebServlet("/medicalrecord")
public class MedicalRecordServlet extends HttpServlet {
    private MedicalRecordService medicalRecordService;
    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.medicalRecordService = new MedicalRecordService();
        this.patientService = new PatientService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check - only generalist can update medical records
        if (!SessionUtil.isAuthorized(request, Role.GENERALIST)) {
            response.sendRedirect("home");
            return;
        }

        try {
            // Get form parameters
            String cardId = request.getParameter("cardId");
            String allergies = request.getParameter("allergies");
            String medicalHistory = request.getParameter("medicalHistory");
            String ongoingTreatments = request.getParameter("ongoingTreatments");

            // Validate card ID
            if (cardId == null || cardId.trim().isEmpty()) {
                request.setAttribute("error", "Patient Card ID is required");
                response.sendRedirect("generalist?error=invalid_card_id");
                return;
            }

            // Get patient by card ID
            Patient patient = patientService.getPatientByCardId(cardId);
            if (patient == null) {
                response.sendRedirect("generalist?error=patient_not_found");
                return;
            }

            // Get or create medical record for this patient
            MedicalRecord medicalRecord = medicalRecordService.getMedicalRecordByPatientCardId(cardId);

            if (medicalRecord == null) {
                // Create new medical record if it doesn't exist
                medicalRecord = new MedicalRecord();
                medicalRecord.setPatient(patient);
                medicalRecord.setAllergies(allergies);
                medicalRecord.setMedicalHistory(medicalHistory);
                medicalRecord.setOngoingTreatments(ongoingTreatments);

                medicalRecordService.addMedicalRecord(medicalRecord);
            } else {
                // Update existing medical record
                medicalRecord.setAllergies(allergies);
                medicalRecord.setMedicalHistory(medicalHistory);
                medicalRecord.setOngoingTreatments(ongoingTreatments);

                medicalRecordService.updateMedicalRecord(medicalRecord);
            }

            // Redirect back to generalist dashboard with success message
            response.sendRedirect("generalist?success=medical_record_updated");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("generalist?error=update_failed");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        this.medicalRecordService = null;
        this.patientService = null;
    }
}

