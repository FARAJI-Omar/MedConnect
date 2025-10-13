<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>${title}</title>
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
            padding: 2rem 0;
        }

        .login-container {
            background-color: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        .login-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1e293b;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .error-message {
            background-color: #fee2e2;
            border: 1px solid #fecaca;
            color: #dc2626;
            padding: 0.75rem;
            border-radius: 0.375rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-input, .form-select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: border-color 0.2s;
            background-color: white;
        }

        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: #1193d4;
            box-shadow: 0 0 0 2px rgba(17, 147, 212, 0.1);
        }

        .register-button {
            width: 100%;
            background-color: #1193d4;
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 0.375rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 0.5rem;
        }

        .register-button:hover {
            background-color: rgba(17, 147, 212, 0.9);
        }

        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: #1193d4;
            text-decoration: none;
            font-size: 0.875rem;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="page-wrapper">
    <jsp:include page="header.jsp"/>
    <main class="main-content">
        <div class="login-container">
            <h1 class="login-title">Create Account</h1>

            <!-- error message -->
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="error-message">
                    <%= error %>
                </div>
            <% } %>

            <form method="post" action="register">
                <div class="form-group">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" id="name" name="name" class="form-input"
                           placeholder="Enter your full name"
                           value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>"
                           required>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" id="email" name="email" class="form-input"
                           placeholder="Enter your email"
                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                           required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-input"
                           placeholder="Enter your password (min. 6 characters)" required>
                </div>
                <div class="form-group">
                    <label for="role" class="form-label">Role</label>
                    <select id="role" name="role" class="form-select" required>
                        <option value="">Select your role</option>
                        <option value="Generalist" <%= "Generalist".equals(request.getParameter("role")) ? "selected" : "" %>>Generalist</option>
                        <option value="Specialist" <%= "Specialist".equals(request.getParameter("role")) ? "selected" : "" %>>Specialist</option>
                        <option value="Nurse" <%= "Nurse".equals(request.getParameter("role")) ? "selected" : "" %>>Nurse</option>
                    </select>
                </div>
                <button type="submit" class="register-button">Create Account</button>
            </form>
            <div class="login-link">
                <a href="login">Already have an account? Sign in</a>
            </div>
        </div>
    </main>
</div>
</body>
</html>
