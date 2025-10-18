<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>HealthConnect - Generalist Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
    <style>
        .material-symbols-outlined {
            font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f6f7f8;
            color: #1f2937;
            line-height: 1.6;
        }

        /* Layout */
        .main-layout {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 256px;
            background-color: #f6f7f8;
            border-right: 1px solid #e5e7eb;
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            padding: 24px;
        }

        .brand-title {
            font-size: 24px;
            font-weight: 700;
            color: #1193d4;
        }

        .user-role {
            font-size: 14px;
            color: #6b7280;
            margin-top: 4px;
        }

        .nav-menu {
            flex: 1;
            padding: 0 16px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            color: #374151;
            transition: all 0.2s;
            font-weight: 500;
        }

        .nav-item:hover {
            background-color: #f3f4f6;
        }

        .nav-item.active {
            background-color: rgba(17, 147, 212, 0.1);
            color: #1193d4;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 32px;
        }

        .content-container {
            max-width: 1024px;
            margin: 0 auto;
        }

        .page-title {
            font-size: 30px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 24px;
        }

        /* Tabs */
        .tabs-container {
            border-bottom: 1px solid #e5e7eb;
            margin-bottom: 32px;
        }

        .tabs-nav {
            display: flex;
            gap: 32px;
            margin-bottom: -1px;
        }

        .tab-link {
            padding: 16px 4px;
            border-bottom: 2px solid transparent;
            color: #6b7280;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }

        .tab-link:hover {
            color: #374151;
            border-bottom-color: #d1d5db;
        }

        .tab-link.active {
            color: #1193d4;
            border-bottom-color: #1193d4;
        }

        /* Cards */
        .card {
            background-color: #f6f7f8;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 24px;
            margin-bottom: 32px;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
        }

        /* Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-secondary {
            background-color: #e5e7eb;
            color: #374151;
        }

        .btn-secondary:hover {
            background-color: #d1d5db;
        }

        .btn-primary {
            background-color: #1193d4;
            color: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Form */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 4px;
        }

        .form-input,
        .form-textarea,
        .form-select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            background-color: #f3f4f6;
            color: #111827;
            font-family: 'Inter', sans-serif;
            font-size: 14px;
            transition: all 0.2s;
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
            outline: none;
            border-color: #1193d4;
            box-shadow: 0 0 0 3px rgba(17, 147, 212, 0.1);
        }

        .form-input:read-only {
            background-color: #f3f4f6;
            cursor: not-allowed;
        }

        .form-input.editable,
        .form-textarea.editable,
        .form-select.editable {
            background-color: white;
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            padding-top: 16px;
        }

        /* Material Icons Size */
        .material-symbols-outlined {
            font-size: 20px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .sidebar {
                display: none;
            }
        }

        /* Tab Content - Hidden by default */
        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        /* Time Slots Grid */
        .time-slots-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }

        @media (max-width: 640px) {
            .time-slots-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .time-slot-btn {
            padding: 12px 16px;
            font-size: 14px;
            font-weight: 500;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            background-color: white;
            color: #374151;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
        }

        .time-slot-btn:hover {
            background-color: rgba(17, 147, 212, 0.1);
            color: #1193d4;
        }

        .time-slot-btn.selected {
            background-color: rgba(17, 147, 212, 0.1);
            color: #1193d4;
            border-color: #1193d4;
            box-shadow: 0 0 0 2px #1193d4;
        }

        .time-slot-date {
            font-weight: 600;
            display: block;
        }

        .time-slot-time {
            font-size: 12px;
            display: block;
            margin-top: 4px;
        }

        /* Input Group */
        .input-group {
            display: flex;
        }

        .input-group select {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            border-right: none;
        }

        .input-group-append {
            display: inline-flex;
            align-items: center;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
            background-color: #f3f4f6;
            color: #6b7280;
        }

        /* Button Group */
        .btn-group {
            display: flex;
            gap: 16px;
            justify-content: flex-end;
            padding-top: 16px;
        }

        .btn-cancel {
            background-color: #e5e7eb;
            color: #374151;
        }

        .btn-cancel:hover {
            background-color: #d1d5db;
        }

        /* Patient Selector */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .patient-selector-container {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .patient-selector-label {
            font-size: 14px;
            font-weight: 500;
            color: #6b7280;
            white-space: nowrap;
        }

        .patient-selector {
            position: relative;
            min-width: 280px;
        }

        .patient-selector select {
            background-color: white;
            padding-right: 40px;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%236b7280' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            background-size: 20px;
        }

        .patient-selector select:focus {
            background-color: white;
        }

        .always-readonly {
            background-color: #f3f4f6;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="main-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h1 class="brand-title">HealthConnect</h1>
                <p class="user-role">Dr. ${sessionScope.user.name != null ? sessionScope.user.name : ""}</p>
            </div>
            <nav class="nav-menu">
                <a class="nav-item active" href="#">
                    <span class="material-symbols-outlined">dashboard</span>
                    <span>Dashboard</span>
                </a>
                <a class="nav-item" href="#">
                    <span class="material-symbols-outlined">group</span>
                    <span>Patients</span>
                </a>
                <a class="nav-item" href="#">
                    <span class="material-symbols-outlined">work</span>
                    <span>Consultations</span>
                </a>
                <a class="nav-item" href="#">
                    <span class="material-symbols-outlined">groups</span>
                    <span>Specialists</span>
                </a>
                <a class="nav-item" href="#">
                    <span class="material-symbols-outlined">settings</span>
                    <span>Settings</span>
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <div class="content-container">
                <!-- Page Header with Patient Selector -->
                <div class="page-header">
                    <h1 class="page-title">Patient Consultations</h1>

                    <!-- Patient Selector -->
                    <div class="patient-selector-container">
                        <label class="patient-selector-label" for="patient-select">Select Patient:</label>
                        <div class="patient-selector">
                            <select id="patient-select" class="form-select">
                                <option value="">Select a patient...</option>
                                <c:forEach var="patient" items="${patients}">
                                    <option value="${patient.cardId}">
                                        ${patient.name} (${patient.cardId})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Tabs -->
                <div class="tabs-container">
                    <nav class="tabs-nav">
                        <a class="tab-link active" href="#" onclick="switchTab('direct-care'); return false;">Direct Care</a>
                        <a class="tab-link" href="#" onclick="switchTab('tele-expertise'); return false;">Tele-Expertise</a>
                    </nav>
                </div>

                <!-- Direct Care Tab Content -->
                <div id="direct-care" class="tab-content active">
                    <!-- Patient Medical Record Card -->
                    <div class="card">
                        <div class="card-header">
                            <h2 class="card-title">Patient Medical Record</h2>
                            <button class="btn btn-secondary" onclick="toggleEdit()">
                                <span class="material-symbols-outlined">edit</span>
                                <span>Edit</span>
                            </button>
                        </div>

                        <form id="patientForm" action="${pageContext.request.contextPath}/medicalrecord" method="post">
                            <input type="hidden" id="form-card-id" name="cardId" value=""/>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label class="form-label" for="patient-name">Patient Name</label>
                                    <input class="form-input always-readonly" id="patient-name" type="text" value="" readonly/>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="card-id">Card ID</label>
                                    <input class="form-input always-readonly" id="card-id" type="text" value="" readonly/>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="dob">Date of Birth</label>
                                    <input class="form-input always-readonly" id="dob" type="text" value="" readonly/>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="gender">Gender</label>
                                    <input class="form-input always-readonly" id="gender" type="text" value="" readonly/>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="allergies">Allergies</label>
                                    <input class="form-input" id="allergies" name="allergies" type="text" value="" placeholder="No allergies recorded" readonly/>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="medical-history">Medical History</label>
                                    <textarea class="form-textarea" id="medical-history" name="medicalHistory" rows="4" placeholder="No medical history recorded" readonly></textarea>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="ongoing-treatments">Ongoing Treatments</label>
                                    <textarea class="form-textarea" id="ongoing-treatments" name="ongoingTreatments" rows="4" placeholder="No ongoing treatments" readonly></textarea>
                                </div>
                            </div>

                            <div class="form-actions" id="patientFormActions" style="display: none;">
                                <button class="btn btn-primary" type="submit">
                                    <span class="material-symbols-outlined">save</span>
                                    <span>Save Changes</span>
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Consultation Details Card -->
                    <div class="card">
                        <h2 class="card-title">Consultation Details</h2>

                        <form id="consultationForm">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label class="form-label" for="cost">Cost (DH)</label>
                                    <input class="form-input editable" id="cost" type="number" step="0.01" placeholder="0.00"/>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="diagnosis">Diagnosis</label>
                                    <textarea class="form-textarea editable" id="diagnosis" rows="4" placeholder="Enter diagnosis"></textarea>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="motif">Motif</label>
                                    <input class="form-input editable" id="motif" type="text" placeholder="Enter reason for visit"/>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="observations">Observations</label>
                                    <textarea class="form-textarea editable" id="observations" rows="4" placeholder="Enter your observations"></textarea>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="status">Status</label>
                                    <select class="form-select editable" id="status">
                                        <option value="">Select Status</option>
                                        <option value="COMPLETED">COMPLETED</option>
                                        <option value="DONE">DONE</option>
                                        <option value="WAITING">WAITING</option>
                                    </select>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="treatment">Treatment</label>
                                    <textarea class="form-textarea editable" id="treatment" rows="4" placeholder="e.g., Paracetamol 1g, 3 times/day"></textarea>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button class="btn btn-primary" type="button" onclick="saveConsultation()">
                                    Save Consultation
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Tele-Expertise Tab Content -->
                <div id="tele-expertise" class="tab-content">
                    <!-- Patient Medical Record Card (Read-only) -->
                    <div class="card">
                        <h2 class="card-title">Patient Medical Record</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label class="form-label" for="te-patient-name">Patient Name</label>
                                <input class="form-input" id="te-patient-name" type="text" value="John Doe" readonly/>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="te-dob">Date of Birth</label>
                                <input class="form-input" id="te-dob" type="date" value="1985-05-23" readonly/>
                            </div>
                        </div>
                    </div>

                    <!-- Request Specialist Opinion Card -->
                    <div class="card">
                        <h2 class="card-title">Request Specialist Opinion</h2>

                        <form id="teleExpertiseForm">
                            <div class="form-grid">
                                <div class="form-group full-width">
                                    <label class="form-label" for="consultation-link">Link to Consultation</label>
                                    <div class="input-group">
                                        <select class="form-select editable" id="consultation-link">
                                            <option value="">Select a consultation...</option>
                                            <c:forEach var="consultation" items="${consultations}">
                                                <option value="${consultation.id}">
                                                    ${consultation.consultationDate} - ${consultation.patient.name} (${consultation.patient.cardId})
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <span class="input-group-append">
                                            <span class="material-symbols-outlined">sort</span>
                                        </span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="specialty">Specialty</label>
                                    <select class="form-select editable" id="specialty">
                                        <option value="">Select Specialty</option>
                                        <option value="Cardiology">Cardiology</option>
                                        <option value="Dermatology">Dermatology</option>
                                        <option value="Endocrinology">Endocrinology</option>
                                        <option value="Neurology">Neurology</option>
                                        <option value="Orthopedics">Orthopedics</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="specialist">Specialist</label>
                                    <select class="form-select editable" id="specialist">
                                        <option value="">Select Specialist</option>
                                        <option value="1">Dr. Alan Smith - €80</option>
                                        <option value="2">Dr. Maria Garcia - €95</option>
                                        <option value="3">Dr. James Wilson - €75</option>
                                    </select>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label">Available Time Slots</label>
                                    <div class="time-slots-grid">
                                        <button type="button" class="time-slot-btn" onclick="selectTimeSlot(this)">
                                            <span class="time-slot-date">Mon, Oct 23</span>
                                            <span class="time-slot-time">09:00 AM</span>
                                        </button>
                                        <button type="button" class="time-slot-btn selected" onclick="selectTimeSlot(this)">
                                            <span class="time-slot-date">Mon, Oct 23</span>
                                            <span class="time-slot-time">11:30 AM</span>
                                        </button>
                                        <button type="button" class="time-slot-btn" onclick="selectTimeSlot(this)">
                                            <span class="time-slot-date">Tue, Oct 24</span>
                                            <span class="time-slot-time">02:00 PM</span>
                                        </button>
                                        <button type="button" class="time-slot-btn" onclick="selectTimeSlot(this)">
                                            <span class="time-slot-date">Wed, Oct 25</span>
                                            <span class="time-slot-time">10:00 AM</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="form-group full-width">
                                    <label class="form-label" for="medical-question">Medical Question</label>
                                    <textarea class="form-textarea editable" id="medical-question" rows="4" placeholder="Enter your medical question for the specialist..."></textarea>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="priority">Priority Level</label>
                                    <select class="form-select editable" id="priority">
                                        <option value="">Select Priority</option>
                                        <option value="URGENT">URGENT</option>
                                        <option value="NORMAL">NORMAL</option>
                                        <option value="LOW">LOW</option>
                                    </select>
                                </div>
                            </div>

                            <div class="btn-group">
                                <button class="btn btn-cancel" type="button" onclick="cancelRequest()">
                                    Cancel
                                </button>
                                <button class="btn btn-primary" type="button" onclick="sendRequest()">
                                    <span class="material-symbols-outlined">send</span>
                                    <span>Send Request</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Tab Switching
        function switchTab(tabName) {
            // Hide all tab contents
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => {
                content.classList.remove('active');
            });

            // Remove active class from all tab links
            const tabLinks = document.querySelectorAll('.tab-link');
            tabLinks.forEach(link => {
                link.classList.remove('active');
            });

            // Show the selected tab content
            const selectedTab = document.getElementById(tabName);
            if (selectedTab) {
                selectedTab.classList.add('active');
            }

            // Find and activate the correct tab link
            const activeLink = document.querySelector(`a[onclick*="${tabName}"]`);
            if (activeLink) {
                activeLink.classList.add('active');
            }
        }

        // Time Slot Selection
        function selectTimeSlot(button) {
            // Remove selected class from all time slots
            const timeSlots = document.querySelectorAll('.time-slot-btn');
            timeSlots.forEach(slot => {
                slot.classList.remove('selected');
            });

            // Add selected class to clicked button
            button.classList.add('selected');
        }

        // Toggle Edit for Direct Care
        function toggleEdit() {
            const form = document.getElementById('patientForm');
            const editButton = document.querySelector('button[onclick="toggleEdit()"]');
            const editButtonText = editButton.querySelector('span:not(.material-symbols-outlined)');

            // Only select inputs that are NOT always-readonly
            const inputs = form.querySelectorAll('.form-input:not(.always-readonly), .form-textarea');
            const submitButton = document.getElementById('patientFormActions');

            // Check current state - if any input is readonly, we're in view mode
            const isViewMode = inputs[0] && inputs[0].hasAttribute('readonly');

            inputs.forEach(input => {
                if (isViewMode) {
                    // Switch to edit mode
                    input.removeAttribute('readonly');
                    input.classList.add('editable');
                } else {
                    // Switch to view mode
                    input.setAttribute('readonly', 'readonly');
                    input.classList.remove('editable');
                }
            });

            // Toggle submit button visibility
            if (submitButton) {
                if (isViewMode) {
                    submitButton.style.display = 'flex';
                    editButtonText.textContent = 'Cancel';
                } else {
                    submitButton.style.display = 'none';
                    editButtonText.textContent = 'Edit';
                }
            }
        }

        // Save Consultation (Direct Care)
        function saveConsultation() {
            const consultationData = {
                cost: document.getElementById('cost').value,
                diagnosis: document.getElementById('diagnosis').value,
                motif: document.getElementById('motif').value,
                observations: document.getElementById('observations').value,
                status: document.getElementById('status').value,
                treatment: document.getElementById('treatment').value
            };

            // Validate required fields
            if (!consultationData.diagnosis || !consultationData.status) {
                alert('Please fill in all required fields (Diagnosis, Status)');
                return;
            }

            console.log('Consultation Data:', consultationData);
            alert('Consultation saved successfully!');

            // Here you would typically send the data to the server
            // fetch('/medconnect/saveConsultation', {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/json' },
            //     body: JSON.stringify(consultationData)
            // }).then(response => response.json())
            //   .then(data => console.log(data));
        }

        // Send Request (Tele-Expertise)
        function sendRequest() {
            const requestData = {
                consultationId: document.getElementById('consultation-link').value,
                specialty: document.getElementById('specialty').value,
                specialistId: document.getElementById('specialist').value,
                medicalQuestion: document.getElementById('medical-question').value,
                priority: document.getElementById('priority').value
            };

            // Get selected time slot
            const selectedSlot = document.querySelector('.time-slot-btn.selected');
            if (selectedSlot) {
                const date = selectedSlot.querySelector('.time-slot-date').textContent;
                const time = selectedSlot.querySelector('.time-slot-time').textContent;
                requestData.timeSlot = `${date} ${time}`;
            }

            // Validate required fields
            if (!requestData.consultationId || !requestData.specialty || !requestData.specialistId ||
                !requestData.medicalQuestion || !requestData.priority) {
                alert('Please fill in all required fields');
                return;
            }

            console.log('Tele-Expertise Request:', requestData);
            alert('Request sent successfully!');

            // Here you would typically send the data to the server
            // fetch('/medconnect/sendTeleExpertiseRequest', {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/json' },
            //     body: JSON.stringify(requestData)
            // }).then(response => response.json())
            //   .then(data => console.log(data));
        }

        // Cancel Request
        function cancelRequest() {
            if (confirm('Are you sure you want to cancel? All unsaved data will be lost.')) {
                document.getElementById('teleExpertiseForm').reset();
                // Remove selected class from time slots
                const timeSlots = document.querySelectorAll('.time-slot-btn');
                timeSlots.forEach(slot => {
                    slot.classList.remove('selected');
                });
            }
        }

        // Patient data storage (this would typically come from the server)
        const patientData = {
            <c:forEach var="patient" items="${patients}" varStatus="status">
            <c:set var="medRecord" value="${patientMedicalRecords[patient.cardId]}" />
            "${patient.cardId}": {
                name: "${patient.name}",
                cardId: "${patient.cardId}",
                birthDate: "<fmt:formatDate value='${patient.birthDate}' pattern='dd/MM/yyyy' />",
                birthDateISO: "<fmt:formatDate value='${patient.birthDate}' pattern='yyyy-MM-dd' />",
                gender: "${not empty patient.sexe ? patient.sexe : ''}",
                allergies: "${not empty medRecord.allergies ? medRecord.allergies : ''}",
                medicalHistory: "${not empty medRecord.medicalHistory ? medRecord.medicalHistory : ''}",
                ongoingTreatments: "${not empty medRecord.ongoingTreatments ? medRecord.ongoingTreatments : ''}"
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        };

        // Patient Selection Handler
        document.addEventListener('DOMContentLoaded', function() {
            const patientSelect = document.getElementById('patient-select');

            if (patientSelect) {
                patientSelect.addEventListener('change', function() {
                    const patientId = this.value;

                    if (patientId && patientData[patientId]) {
                        updatePatientRecord(patientData[patientId]);
                    } else {
                        clearPatientRecord();
                    }
                });
            }
        });

        // Update Patient Medical Record
        function updatePatientRecord(patient) {
            // Update Direct Care tab fields
            document.getElementById('patient-name').value = patient.name || '';
            document.getElementById('card-id').value = patient.cardId || '';
            document.getElementById('dob').value = patient.birthDate || '';
            document.getElementById('gender').value = patient.gender || '';
            document.getElementById('allergies').value = patient.allergies || '';
            document.getElementById('medical-history').value = patient.medicalHistory || '';
            document.getElementById('ongoing-treatments').value = patient.ongoingTreatments || '';

            // Update hidden field for form submission
            document.getElementById('form-card-id').value = patient.cardId || '';

            // Update Tele-Expertise tab fields
            document.getElementById('te-patient-name').value = patient.name || '';
            document.getElementById('te-dob').value = patient.birthDate || '';
        }

        // Clear Patient Medical Record
        function clearPatientRecord() {
            // Clear Direct Care tab fields
            document.getElementById('patient-name').value = '';
            document.getElementById('form-card-id').value = ''; // Clear hidden field
            document.getElementById('card-id').value = '';
            document.getElementById('dob').value = '';
            document.getElementById('gender').value = '';
            document.getElementById('allergies').value = '';
            document.getElementById('medical-history').value = '';
            document.getElementById('ongoing-treatments').value = '';

            // Clear Tele-Expertise tab fields
            document.getElementById('te-patient-name').value = '';
            document.getElementById('te-dob').value = '';
        }
    </script>
</body>
</html>
