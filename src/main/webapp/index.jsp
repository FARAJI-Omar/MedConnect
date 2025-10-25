<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>MedConnect</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(-45deg, #f6f7f8, #e8f4f8, #f0f9ff, #f6f7f8);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            color: #334155;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .page-wrapper {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
            position: relative;
        }

        /* Animated background elements */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            overflow: hidden;
        }

        .floating-shape {
            position: absolute;
            border-radius: 50%;
            opacity: 0.15;
            animation: float 20s infinite ease-in-out;
        }

        .shape-1 {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #1193d4, #0ea5e9);
            top: 10%;
            left: 10%;
            animation-delay: 0s;
            animation-duration: 25s;
        }

        .shape-2 {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #0ea5e9, #38bdf8);
            top: 60%;
            left: 80%;
            animation-delay: 3s;
            animation-duration: 20s;
        }

        .shape-3 {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #1193d4, #0284c7);
            top: 80%;
            left: 20%;
            animation-delay: 6s;
            animation-duration: 30s;
        }

        .shape-4 {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #38bdf8, #1193d4);
            top: 30%;
            left: 70%;
            animation-delay: 9s;
            animation-duration: 22s;
        }

        .shape-5 {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #0ea5e9, #1193d4);
            top: 50%;
            left: 5%;
            animation-delay: 12s;
            animation-duration: 28s;
        }

        .shape-6 {
            width: 90px;
            height: 90px;
            background: linear-gradient(135deg, #0284c7, #0ea5e9);
            top: 15%;
            left: 85%;
            animation-delay: 15s;
            animation-duration: 26s;
        }

        @keyframes float {
            0%, 100% {
                transform: translate(0, 0) scale(1);
            }
            25% {
                transform: translate(30px, -30px) scale(1.1);
            }
            50% {
                transform: translate(-20px, 20px) scale(0.9);
            }
            75% {
                transform: translate(20px, 30px) scale(1.05);
            }
        }

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5rem 0;
            position: relative;
            z-index: 1;
        }

        .hero-section {
            text-align: center;
            max-width: 800px;
        }

        .hero-title {
            font-size: 2.5rem;
            font-weight: 900;
            color: #1e293b;
            margin-bottom: 1rem;
            letter-spacing: -0.025em;
        }

        .hero-description {
            font-size: 1.125rem;
            color: #64748b;
            margin-bottom: 2rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .button-primary {
            padding: 0.75rem 2rem;
            background-color: #1193d4;
            color: white;
            font-weight: 600;
            border-radius: 0.5rem;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.2s;
        }

        .button-primary:hover {
            background-color: rgba(17, 147, 212, 0.9);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            transform: translateY(-1px);
        }

        .button-secondary {
            padding: 0.75rem 2rem;
            background-color: #e2e8f0;
            color: #1e293b;
            font-weight: 600;
            border-radius: 0.5rem;
            text-decoration: none;
            transition: all 0.2s;
        }

        .button-secondary:hover {
            background-color: #cbd5e1;
        }
    </style>
</head>
<body>
<div class="page-wrapper">
    <!-- Animated background -->
    <div class="bg-animation">
        <div class="floating-shape shape-1"></div>
        <div class="floating-shape shape-2"></div>
        <div class="floating-shape shape-3"></div>
        <div class="floating-shape shape-4"></div>
        <div class="floating-shape shape-5"></div>
        <div class="floating-shape shape-6"></div>
    </div>

    <jsp:include page="header.jsp" />
    <main class="main-content">
        <div class="container">
            <div class="hero-section">
                <h2 class="hero-title">Welcome to MedConnect</h2>
                <p class="hero-description">
                    Connect with specialists and enhance patient care through seamless remote consultations.
                </p>
                <div class="hero-buttons">
                    <a class="button-primary" href="register">Get Started</a>
                    <a class="button-secondary" href="#">Learn More</a>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>