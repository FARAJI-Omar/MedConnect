package com.medconnect.medconnect.controller;

import com.medconnect.medconnect.model.Patient;
import com.medconnect.medconnect.model.VitalSigns;
import com.medconnect.medconnect.model.enums.Role;
import com.medconnect.medconnect.model.enums.Sexe;
import com.medconnect.medconnect.service.PatientService;
import com.medconnect.medconnect.util.SessionUtil;
import com.medconnect.medconnect.util.ValidatorUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/nurse")
public class NurseServlet extends HttpServlet {
    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.patientService = new PatientService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //session check
        if (!SessionUtil.isAuthorized(request, Role.NURSE)) {
            response.sendRedirect("home");
            return;
        }

        try {
            List<Patient> patients = patientService.getAllPatients();
            // debugging output
            System.out.println("Patients count: " + patients.size());
            for (Patient p : patients) {
                System.out.println(p.getName() + " | QueueTime: " + p.getQueueTime());
            }
            // end debugging output


            if (patients != null && !patients.isEmpty()) {
                // set patient attributes
                request.setAttribute("patients", patients);
            } else {
                request.setAttribute("patients", new ArrayList<>());
            }
        } catch (Exception e) {
            getServletContext().log("Error retrieving patients", e);
            request.setAttribute("patients", new ArrayList<>());
            request.setAttribute("error", "Unable to load patient data");
        }

        request.getRequestDispatcher("nurseDashboard.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get data from form
        String cardId = request.getParameter("cardId").trim();
        String name = request.getParameter("name").trim();
        String sex = request.getParameter("sex").trim();
        String birthdate = request.getParameter("birthdate").trim();
        String address = request.getParameter("address").trim();
        String phone = request.getParameter("phone").trim();
        String securityNumber = request.getParameter("securityNumber").trim();
        String insurance = request.getParameter("insurance").trim();
        String temperatureStr = request.getParameter("temperature").trim();
        String heartRateStr = request.getParameter("heartRate").trim();
        String respiratoryRateStr = request.getParameter("respiratoryRate").trim();
        String heightStr = request.getParameter("height").trim();
        String weightStr = request.getParameter("weight").trim();

        try {
            Sexe sexeEnum = Sexe.valueOf(sex.toUpperCase());
            if (!ValidatorUtil.isValidSexe(sexeEnum.name())) {
                request.setAttribute("error", "Invalid sex selected.");
                forwardToNursePage(request, response);
                return;
            }

            // Parse birthdate to LocalDateTime
            LocalDateTime birthDateObj = null;
            if (!birthdate.isEmpty()) {
                birthDateObj = LocalDate.parse(birthdate).atStartOfDay();
            }

            // Parse vital signs
            double temperature = temperatureStr.isEmpty() ? 0.0 : Double.parseDouble(temperatureStr);
            double heartRate = heartRateStr.isEmpty() ? 0.0 : Double.parseDouble(heartRateStr);
            double respiratoryRate = respiratoryRateStr.isEmpty() ? 0.0 : Double.parseDouble(respiratoryRateStr);
            double height = heightStr.isEmpty() ? 0.0 : Double.parseDouble(heightStr);
            double weight = weightStr.isEmpty() ? 0.0 : Double.parseDouble(weightStr);

            // Create Patient
            Patient patient = new Patient(cardId, name, birthDateObj, securityNumber, address, phone, insurance, sexeEnum);

            // Create VitalSigns and associate with Patient
            VitalSigns vitalSigns = new VitalSigns();
            vitalSigns.setEntryDate(LocalDateTime.now());
            vitalSigns.setTemperature(temperature);
            vitalSigns.setHeartRate(heartRate);
            vitalSigns.setRespiratoryRate(respiratoryRate);
            vitalSigns.setHeight(height);
            vitalSigns.setWeight(weight);
            vitalSigns.setPatient(patient);

            // Link VitalSigns to Patient
            patient.setVitalSigns(vitalSigns);

            // Register patient
            patientService.addPatient(patient);
            response.sendRedirect(request.getContextPath() + "/nurse");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format in vital signs. Please ensure all numeric fields are correctly filled.");
            forwardToNursePage(request, response);

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid sex selected. Please choose from: Male or Female.");
            forwardToNursePage(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Patient creation failed: " + e.getMessage());
            forwardToNursePage(request, response);
        }
    }

    private void forwardToNursePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("nurseDashboard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
        this.patientService = null;
    }
}
