<style>
    .header {
        border-bottom: 1px solid #e2e8f0;
        padding: 1rem 0;
    }

    .header-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .logo-icon {
        width: 32px;
        height: 32px;
        background-color: #1193d4;
        border-radius: 50%;
    }

    .logo-text {
        font-size: 1.25rem;
        font-weight: bold;
        color: #1e293b;
    }

    .navigation-buttons {
        display: flex;
        gap: 0.5rem;
    }

    .button {
        padding: 0.5rem 1rem;
        font-size: 0.875rem;
        font-weight: 600;
        border-radius: 0.5rem;
        text-decoration: none;
        transition: all 0.2s;
        border: none;
        cursor: pointer;
    }

    .button-login {
        background-color: rgba(17, 147, 212, 0.1);
        color: #1193d4;
    }

    .button-login:hover {
        background-color: rgba(17, 147, 212, 0.2);
    }

    .button-signup {
        background-color: #1193d4;
        color: white;
    }

    .button-signup:hover {
        background-color: rgba(17, 147, 212, 0.9);
    }

    @media (max-width: 768px) {
        .header-content {
            flex-direction: column;
            gap: 1rem;
        }
    }
</style>

<header class="header">
    <div class="container">
        <div class="header-content">
            <a href="home" style="text-decoration: none">
                <div class="logo">
                    <div class="logo-icon"></div>
                    <h1 class="logo-text">MedConnect</h1>
                </div>
            </a>
            <div class="navigation-buttons">
                <a class="button button-login" href="login">Log In</a>
                <a class="button button-signup" href="register">Sign Up</a>
            </div>
        </div>
    </div>
</header>
