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
            background-color: #f6f7f8;
            color: #334155;
            line-height: 1.6;
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
        }

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5rem 0;
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