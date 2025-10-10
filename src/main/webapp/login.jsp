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
            max-width: 400px;
        }

        .login-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1e293b;
            text-align: center;
            margin-bottom: 1.5rem;
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

        .form-input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: border-color 0.2s;
        }

        .form-input:focus {
            outline: none;
            border-color: #1193d4;
            box-shadow: 0 0 0 2px rgba(17, 147, 212, 0.1);
        }

        .login-button {
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

        .login-button:hover {
            background-color: rgba(17, 147, 212, 0.9);
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
        }

        .register-link a {
            color: #1193d4;
            text-decoration: none;
            font-size: 0.875rem;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="page-wrapper">
    <jsp:include page="header.jsp"/>
    <main class="main-content">
        <div class="login-container">
            <h1 class="login-title">Sign In</h1>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" id="email" name="email" class="form-input" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="login-button">Sign In</button>
            </form>
            <div class="register-link">
                <a href="register">Don't have an account? Sign up</a>
            </div>
        </div>
    </main>
</div>
</body>
</html>
