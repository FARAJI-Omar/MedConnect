<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link crossorigin="" href="https://fonts.gstatic.com/" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
    <title>MedConnect - Nurse Dashboard</title>
    <link href="data:image/x-icon;base64," rel="icon" type="image/x-icon"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f6f7f8;
            color: #374151;
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
            padding: 24px;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 40px;
        }

        .logo {
            width: 32px;
            height: 32px;
            background-color: #1193d4;
            border-radius: 50%;
        }

        .brand-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
        }

        .user-role {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 24px;
        }

        .nav-menu {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: #374151;
            transition: background-color 0.2s;
        }

        .nav-item:hover {
            background-color: rgba(17, 147, 212, 0.1);
        }

        .nav-item.active {
            background-color: #1193d4;
            color: white;
        }

        .nav-icon {
            width: 24px;
            height: 24px;
        }

        .nav-text {
            font-weight: 500;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 32px;
        }

        .main-content.blur {
            filter: blur(2px);
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 30px;
            font-weight: 700;
            color: #111827;
        }

        .btn-primary {
            background-color: #1193d4;
            color: white;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 8px;
            border: none;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-primary:hover {
            background-color: rgba(17, 147, 212, 0.9);
        }

        /* Search Bar */
        .search-container {
            position: relative;
            margin-bottom: 24px;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            color: #9ca3af;
            pointer-events: none;
        }

        .search-input {
            width: 100%;
            padding: 8px 16px 8px 40px;
            border-radius: 8px;
            background-color: #f6f7f8;
            border: 1px solid #d1d5db;
            outline: none;
            transition: all 0.2s;
        }

        .search-input:focus {
            border-color: #1193d4;
            box-shadow: 0 0 0 2px #1193d4;
        }

        /* Cards */
        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card-header {
            padding: 24px;
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 16px;
        }

        /* Tables */
        .table-container {
            overflow-x: auto;
            max-height: 300px;
            overflow-y: auto;
        }

        .table {
            width: 100%;
            font-size: 14px;
            text-align: left;
            color: #6b7280;
        }

        .table thead {
            font-size: 12px;
            color: #374151;
            text-transform: uppercase;
            background-color: #f9fafb;
        }

        .table th,
        .table td {
            padding: 12px 24px;
        }

        .table tbody tr {
            background-color: white;
            border-bottom: 1px solid #e5e7eb;
        }

        .table tbody tr:last-child {
            border-bottom: none;
        }

        .table tbody th {
            font-weight: 500;
            color: #111827;
            white-space: nowrap;
        }

        /* Grid Layout */
        .grid {
            display: grid;
            gap: 32px;
        }

        .grid-cols-3 {
            grid-template-columns: repeat(3, 1fr);
        }

        .col-span-2 {
            grid-column: span 2;
        }

        .mt-8 {
            margin-top: 32px;
        }

        /* Calendar */
        .calendar-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
        }

        .calendar-nav-btn {
            padding: 4px;
            border-radius: 50%;
            border: none;
            background: none;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .calendar-nav-btn:hover {
            background-color: #f3f4f6;
        }

        .calendar-title {
            font-weight: 700;
            color: #111827;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            text-align: center;
            font-size: 14px;
        }

        .calendar-day-header {
            font-weight: 500;
            color: #6b7280;
        }

        .calendar-day {
            padding: 8px 0;
        }

        .calendar-day-today {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #1193d4;
            color: white;
            border: none;
            cursor: pointer;
        }

        /* Modal */
        .modal {
            position: fixed;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(4px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 16px;
            z-index: 50;
        }

        .modal.hidden {
            display: none;
        }

        .modal-content {
            background-color: #f6f7f8;
            border-radius: 12px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 672px;
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 24px;
            border-bottom: 1px solid rgba(17, 147, 212, 0.2);
        }

        .modal-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
        }

        .modal-close-btn {
            color: #6b7280;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 24px;
            transition: color 0.2s;
        }

        .modal-close-btn:hover {
            color: #1f2937;
        }

        .modal-body {
            padding: 24px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 16px;
            padding: 24px;
            background-color: rgba(17, 147, 212, 0.05);
            border-radius: 0 0 12px 12px;
        }

        /* Form */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
        }

        .form-grid-3col {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            align-items: start;
        }

        .form-column {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* First Column - 6 fields */
        .form-group:nth-child(1),  /* ID Card Number */
        .form-group:nth-child(2),  /* Full Name */
        .form-group:nth-child(3),  /* Sex */
        .form-group:nth-child(4),  /* Date of Birth */
        .form-group:nth-child(5),  /* Address */
        .form-group:nth-child(6) { /* Phone Number */
            grid-column: 1;
        }

        /* Second Column - 2 fields */
        .form-group:nth-child(7),  /* Insurance Provider */
        .form-group:nth-child(8) { /* Security Number */
            grid-column: 2;
        }

        /* Third Column - 5 fields */
        .form-group:nth-child(9),   /* Temperature */
        .form-group:nth-child(10),  /* Heart Rate */
        .form-group:nth-child(11),  /* Respiratory Rate */
        .form-group:nth-child(12),  /* Height */
        .form-group:nth-child(13) { /* Weight */
            grid-column: 3;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-group-span2 {
            grid-column: span 2;
        }

        .form-group-span3 {
            grid-column: span 3;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 4px;
        }

        .form-input,
        .form-select {
            width: 100%;
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid rgba(17, 147, 212, 0.3);
            background-color: white;
            color: #111827;
            outline: none;
            transition: all 0.2s;
        }

        .form-input:focus,
        .form-select:focus {
            border-color: #1193d4;
            box-shadow: 0 0 0 2px #1193d4;
        }

        .form-select {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%231193d4' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 8px center;
            background-repeat: no-repeat;
            background-size: 24px 24px;
            padding-right: 40px;
            appearance: none;
        }

        /* Buttons */
        .btn {
            padding: 8px 24px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.2s;
            cursor: pointer;
            border: none;
        }

        .btn-secondary {
            color: #374151;
            background-color: transparent;
        }

        .btn-secondary:hover {
            background-color: rgba(17, 147, 212, 0.1);
        }

        .btn-primary {
            background-color: #1193d4;
            color: white;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn-primary:hover {
            background-color: rgba(17, 147, 212, 0.9);
        }

        /* Action Buttons */
        .btn-edit {
            background-color: #3b82f6;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-size: 12px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: all 0.2s;
        }

        .btn-edit:hover {
            background-color: #2563eb;
            transform: translateY(-1px);
        }

        .btn-remove {
            background-color: #ef4444;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-size: 12px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: all 0.2s;
        }

        .btn-remove:hover {
            background-color: #dc2626;
            transform: translateY(-1px);
        }

        .btn-icon {
            width: 14px;
            height: 14px;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .grid-cols-3 {
                grid-template-columns: 1fr;
            }

            .col-span-2 {
                grid-column: span 1;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                position: fixed;
                top: 0;
                left: -100%;
                z-index: 40;
                transition: left 0.3s;
            }

            .main-content {
                margin-left: 0;
                padding: 16px;
            }
        }
    </style>
</head>
<body>
<div class="main-layout" id="main-content">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="logo"></div>
            <h1 class="brand-title">MedConnect</h1>
        </div>
        <p class="user-role">Nurse: <c:out value="${sessionScope.userName}" default="" /></p>
        <nav class="nav-menu">
            <a class="nav-item" href="#">
                <svg class="nav-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                    <path d="M218.83,103.77l-80-75.48a1.14,1.14,0,0,1-.11-.11,16,16,0,0,0-21.53,0l-.11.11L37.17,103.77A16,16,0,0,0,32,115.55V208a16,16,0,0,0,16,16H96a16,16,0,0,0,16-16V160h32v48a16,16,0,0,0,16,16h48a16,16,0,0,0,16-16V115.55A16,16,0,0,0,218.83,103.77ZM208,208H160V160a16,16,0,0,0-16-16H112a16,16,0,0,0-16,16v48H48V115.55l.11-.1L128,40l79.9,75.43.11.1Z"></path>
                </svg>
                <span class="nav-text">Dashboard</span>
            </a>
            <a class="nav-item active" href="#">
                <svg class="nav-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                    <path d="M164.47,195.63a8,8,0,0,1-6.7,12.37H10.23a8,8,0,0,1-6.7-12.37,95.83,95.83,0,0,1,47.22-37.71,60,60,0,1,1,66.5,0A95.83,95.83,0,0,1,164.47,195.63Zm87.91-.15a95.87,95.87,0,0,0-47.13-37.56A60,60,0,0,0,144.7,54.59a4,4,0,0,0-1.33,6A75.83,75.83,0,0,1,147,150.53a4,4,0,0,0,1.07,5.53,112.32,112.32,0,0,1,29.85,30.83,23.92,23.92,0,0,1,3.65,16.47,4,4,0,0,0,3.95,4.64h60.3a8,8,0,0,0,7.73-5.93A8.22,8.22,0,0,0,252.38,195.48Z"></path>
                </svg>
                <span class="nav-text">Patients</span>
            </a>
            <a class="nav-item" href="#">
                <svg class="nav-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                    <path d="M208,32H184V24a8,8,0,0,0-16,0v8H88V24a8,8,0,0,0-16,0v8H48A16,16,0,0,0,32,48V208a16,16,0,0,0,16,16H208a16,16,0,0,0,16-16V48A16,16,0,0,0,208,32ZM72,48v8a8,8,0,0,0,16,0V48h80v8a8,8,0,0,0,16,0V48h24V80H48V48ZM208,208H48V96H208V208Zm-96-88v64a8,8,0,0,1-16,0V132.94l-4.42,2.22a8,8,0,0,1-7.16-14.32l16-8A8,8,0,0,1,112,120Zm59.16,30.45L152,176h16a8,8,0,0,1,0,16H136a8,8,0,0,1-6.4-12.8l28.78-38.37A8,8,0,1,0,145.07,132a8,8,0,1,1-13.85-8A24,24,0,0,1,176,136A23.76,23.76,0,0,1,171.16,150.45Z"></path>
                </svg>
                <span class="nav-text">Appointments</span>
            </a>
            <a class="nav-item" href="#">
                <svg class="nav-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                    <path d="M140,128a12,12,0,1,1-12-12A12,12,0,0,1,140,128ZM84,116a12,12,0,1,0,12,12A12,12,0,0,0,84,116Zm88,0a12,12,0,1,0,12,12A12,12,0,0,0,172,116Zm60,12A104,104,0,0,1,79.12,219.82L45.07,231.17a16,16,0,0,1-20.24-20.24l11.35-34.05A104,104,0,1,1,232,128Zm-16,0A88,88,0,1,0,51.81,172.06a8,8,0,0,1,.66,6.54L40,216,77.4,203.53a7.85,7.85,0,0,1,2.53-.42,8,8,0,0,1,4,1.08A88,88,0,0,0,216,128Z"></path>
                </svg>
                <span class="nav-text">Messages</span>
            </a>
            <a class="nav-item" href="${pageContext.request.contextPath}/logout">
                <?xml version="1.0"?><svg fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17 16L21 12M21 12L17 8M21 12L7 12M13 16V17C13 18.6569 11.6569 20 10 20H6C4.34315 20 3 18.6569 3 17V7C3 5.34315 4.34315 4 6 4H10C11.6569 4 13 5.34315 13 7V8" stroke="#374151" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                </svg>
                <span class="nav-text">Logout</span>
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="page-header">
            <h2 class="page-title">Patients</h2>
            <button onclick="showModal()" class="btn-primary">
                <svg width="20" height="20" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                    <path d="M224,128a8,8,0,0,1-8,8H136v80a8,8,0,0,1-16,0V136H40a8,8,0,0,1,0-16h80V40a8,8,0,0,1,16,0v80h80A8,8,0,0,1,224,128Z"></path>
                </svg>
                Add New Patient
            </button>
        </div>

        <!-- Search Bar -->
        <div class="search-container">
            <svg class="search-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                <path d="M229.66,218.34l-50.07-50.06a88.11,88.11,0,1,0-11.31,11.31l50.06,50.07a8,8,0,0,0,11.32-11.32ZM40,112a72,72,0,1,1,72,72A72.08,72.08,0,0,1,40,112Z"></path>
            </svg>
            <input class="search-input" placeholder="Search by name" type="text"/>
        </div>

        <!-- Registered Patients Table -->
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Registered Patients</h3>
                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Card ID</th>
                                <th>Name</th>
                                <th>Date of Birth</th>
                                <th>Gender</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty patients}">
                                    <c:forEach var="patient" items="${patients}">
                                        <tr>
                                            <td>${patient.cardId}</td>
                                            <th>${patient.name}</th>
                                            <td>${patient.birthDate != null ? patient.birthDate : "N/A"}</td>
                                            <td>${patient.sexe != null ? patient.sexe : "N/A"}</td>
                                            <td>${patient.phone != null ? patient.phone : "N/A"}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center; color: #6b7280; font-style: italic;">
                                            No patients registered yet
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Bottom Section with Appointments and Calendar -->
        <div class="grid grid-cols-3 mt-8">
            <!-- Today's Appointments -->
            <div class="card col-span-2">
                <div class="card-header">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 class="card-title" style="margin-bottom: 0;">Today's Appointments</h3>
                        <button onclick="showQueueModal()" class="btn-primary" style="gap: 4px; font-size: 14px; padding: 6px 12px;">
                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><path d="M224,128a8,8,0,0,1-8,8H136v80a8,8,0,0,1-16,0V136H40a8,8,0,0,1,0-16h80V40a8,8,0,0,1,16,0v80h80A8,8,0,0,1,224,128Z"></path></svg>
                            Add to Queue
                        </button>
                    </div>
                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Time(HH:mm)</th>
                                    <th>Patient</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="hasAppointments" value="${false}" />
                                <c:forEach var="patient" items="${patients}">
                                    <c:if test="${not empty patient.queueTime}">
                                        <c:set var="hasAppointments" value="${true}" />
                                        <tr>
                                            <td>${patient.queueTime}</td>
                                            <td>${patient.name}</td>
                                            <td>
                                                <button class="btn btn-edit" style="margin-right: 8px;">
                                                    <svg class="btn-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M195.88,66.12a8,8,0,0,0-11.31,0L128,128,71.43,81.43a8,8,0,0,0-11.31,11.31L116.69,139l-56.57,56.57a8,8,0,0,0,5.66,13.66h56.57l56.57,56.57a8,8,0,0,0,11.31-11.31L139,168.69l46.57-46.57A8,8,0,0,0,195.88,66.12Z"></path>
                                                    </svg>
                                                    Edit
                                                </button>
                                                <button class="btn btn-remove" style="padding: 4px 8px; font-size: 12px;">
                                                    <svg class="btn-icon" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M128,24A104,104,0,1,1,24,128,104.12,104.12,0,0,1,128,24ZM128,16A112,112,0,1,0,240,128,112.13,112.13,0,0,0,128,16ZM104,88a8,8,0,0,1,8-8h32a8,8,0,0,1,0,16H112A8,8,0,0,1,104,88Zm8,32a8,8,0,0,1,8-8h32a8,8,0,0,1,0,16H112A8,8,0,0,1,112,120Zm8,32a8,8,0,0,1,8-8h32a8,8,0,0,1,0,16H120A8,8,0,0,1,120,152Zm8,32a8,8,0,0,1,8-8h32a8,8,0,0,1,0,16H128A8,8,0,0,1,128,184Z"></path>
                                                    </svg>
                                                    Remove
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${not hasAppointments}">
                                    <tr>
                                        <td colspan="3" style="text-align: center; color: #6b7280; font-style: italic;">
                                            No appointments scheduled
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Calendar Widget -->
            <div class="card">
                <div class="card-header">
                    <div class="calendar-header">
                        <button class="calendar-nav-btn">
                            <svg width="18" height="18" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                <path d="M165.66,202.34a8,8,0,0,1-11.32,11.32l-80-80a8,8,0,0,1,0-11.32l80-80a8,8,0,0,1,11.32,11.32L91.31,128Z"></path>
                            </svg>
                        </button>
                        <p class="calendar-title">July 2024</p>
                        <button class="calendar-nav-btn">
                            <svg width="18" height="18" fill="currentColor" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                <path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path>
                        </button>
                    </div>
                    <div class="calendar-grid">
                        <div class="calendar-day-header">S</div>
                        <div class="calendar-day-header">M</div>
                        <div class="calendar-day-header">T</div>
                        <div class="calendar-day-header">W</div>
                        <div class="calendar-day-header">T</div>
                        <div class="calendar-day-header">F</div>
                        <div class="calendar-day-header">S</div>
                        <div style="grid-column-start: 4;" class="calendar-day">1</div>
                        <div class="calendar-day">2</div>
                        <div class="calendar-day">3</div>
                        <div class="calendar-day">4</div>
                        <div class="calendar-day"><button class="calendar-day-today">5</button></div>
                        <div class="calendar-day">6</div>
                        <div class="calendar-day">7</div>
                        <div class="calendar-day">8</div>
                        <div class="calendar-day">9</div>
                        <div class="calendar-day">10</div>
                        <div class="calendar-day">11</div>
                        <div class="calendar-day">12</div>
                        <div class="calendar-day">13</div>
                        <div class="calendar-day">14</div>
                        <div class="calendar-day">15</div>
                        <div class="calendar-day">16</div>
                        <div class="calendar-day">17</div>
                        <div class="calendar-day">18</div>
                        <div class="calendar-day">19</div>
                        <div class="calendar-day">20</div>
                        <div class="calendar-day">21</div>
                        <div class="calendar-day">22</div>
                        <div class="calendar-day">23</div>
                        <div class="calendar-day">24</div>
                        <div class="calendar-day">25</div>
                        <div class="calendar-day">26</div>
                        <div class="calendar-day">27</div>
                        <div class="calendar-day">28</div>
                        <div class="calendar-day">29</div>
                        <div class="calendar-day">30</div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- Modal Form -->
<div id="patientModal" class="modal hidden">
    <div class="modal-content">
        <header class="modal-header">
            <h2 class="modal-title">Add New Patient</h2>
            <button onclick="hideModal()" class="modal-close-btn">
                <span class="material-symbols-outlined">close</span>
            </button>
        </header>

        <main class="modal-body">
            <form action="${pageContext.request.contextPath}/nurse" method="post" id="patientForm" onsubmit="hideModal()">
                <div class="step-header">
                    <h3 class="step-title">Patient Information</h3>
                </div>

                <div class="form-grid-3col">
                    <!-- First Column: ID card, name, sex, date birth, address, phone -->
                    <div class="form-column">
                        <div class="form-group">
                            <label class="form-label" for="card-id">ID Card Number</label>
                            <input class="form-input" id="card-id" name="cardId" type="text" required/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="name">Full Name</label>
                            <input class="form-input" id="name" name="name" type="text" required/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="sex">Sex</label>
                            <select class="form-select" id="sex" name="sex" required>
                                <option value="">Select Sex</option>
                                <option value="MALE">Male</option>
                                <option value="FEMALE">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="birthdate">Date of Birth</label>
                            <input class="form-input" id="birthdate" name="birthdate" type="date" required/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="address">Address</label>
                            <input class="form-input" id="address" name="address" type="text" required/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="phone">Phone Number</label>
                            <input class="form-input" id="phone" name="phone" type="tel" required/>
                        </div>
                    </div>

                    <!-- Second Column: insurance, security number -->
                    <div class="form-column">
                        <div class="form-group">
                            <label class="form-label" for="insurance">Insurance Provider</label>
                            <input class="form-input" id="insurance" name="insurance" type="text"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="security-number">Security Number</label>
                            <input class="form-input" id="security-number" name="securityNumber" type="text" required/>
                        </div>
                    </div>

                    <!-- Third Column: temperature, heartRate, respiratoryRate, height, weight -->
                    <div class="form-column">
                        <div class="form-group">
                            <label class="form-label" for="temperature">Temperature (°C)</label>
                            <input class="form-input" id="temperature" name="temperature" type="number" step="0.1" min="30" max="45"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="heart-rate">Heart Rate (BPM)</label>
                            <input class="form-input" id="heart-rate" name="heartRate" type="number" min="40" max="200"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="respiratory-rate">Respiratory Rate (/min)</label>
                            <input class="form-input" id="respiratory-rate" name="respiratoryRate" type="number" min="8" max="40"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="height">Height (cm)</label>
                            <input class="form-input" id="height" name="height" type="number" min="50" max="250"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="weight">Weight (kg)</label>
                            <input class="form-input" id="weight" name="weight" type="number" step="0.1" min="10" max="300"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="hideModal()" class="btn btn-secondary">Cancel</button>
                    <button type="submit" class="btn btn-primary" onclick="event.stopPropagation()">Add Patient</button>
                </div>
            </form>
        </main>
    </div>
</div>

<!-- Modal Form for Queue -->
<div id="queueModal" class="modal hidden">
    <div class="modal-content" style="max-width: 500px;">
        <header class="modal-header">
            <h2 class="modal-title">Add Patient to Queue</h2>
            <button onclick="hideQueueModal()" class="modal-close-btn">
                <span class="material-symbols-outlined">close</span>
            </button>
        </header>

        <main class="modal-body">
            <form action="${pageContext.request.contextPath}/queue" method="post" id="queueForm">
                <input type="hidden" name="action" value="add">
                <div class="form-group" style="margin-bottom: 16px">
                    <label class="form-label" for="patient-select">Patient</label>
                    <select class="form-select" id="patient-select" name="patientId" required>
                        <option value="">Select a patient</option>
                        <c:forEach var="patient" items="${patients}">
                            <c:if test="${empty patient.queueTime}">
                                <option value="${patient.cardId}">${patient.name} - ${patient.cardId}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="queue-time">Time (HH:mm)</label>
                    <input class="form-input" id="queue-time" name="queueTime" type="time" required/>
                </div>

                <div class="modal-footer" style="margin-top: 24px">
                    <button type="button" onclick="hideQueueModal()" class="btn btn-secondary">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add to Queue</button>
                </div>
            </form>
        </main>
    </div>
</div>


<script>
    function showModal() {
        document.getElementById('patientModal').classList.remove('hidden');
        document.getElementById('main-content').classList.add('blur');
    }

    function hideModal() {
        document.getElementById('patientModal').classList.add('hidden');
        document.getElementById('main-content').classList.remove('blur');
    }

    function showQueueModal() {
        document.getElementById('queueModal').classList.remove('hidden');
        document.getElementById('main-content').classList.add('blur');
    }

    function hideQueueModal() {
        document.getElementById('queueModal').classList.add('hidden');
        document.getElementById('main-content').classList.remove('blur');
    }

    // Close patient modal when clicking outside
    document.getElementById('patientModal').addEventListener('click', function(e) {
        if (e.target === this) {
            hideModal();
        }
    });

    // Close queue modal when clicking outside
    document.getElementById('queueModal').addEventListener('click', function(e) {
        if (e.target === this) {
            hideQueueModal();
        }
    });

    document.getElementById('queueForm').addEventListener('submit', function() {
        hideQueueModal();
    });
</script>
</body>
</html>
