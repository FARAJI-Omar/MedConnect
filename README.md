# MedConnect

MedConnect is a **Jakarta EE (JEE)** web application that helps medical teams collaborate.
It supports role-based workflows for **Nurses**, **Generalists**, and **Specialists** to improve patient follow-up and remote consultation.

## What this project does

- User registration and login
- Role-based dashboards
- Patient queue management
- Medical records management
- Consultation and specialist request flow

## Tech stack

- **Jakarta EE 10** (Servlets 6, JSP, JSTL) — core application platform
- Java 17
- Hibernate 7 / Jakarta JPA 3.2
- MySQL 8
- Maven (WAR packaging)

## Quick start

### 1) Requirements

- Java 17+
- Maven 3.9+
- MySQL 8+
- A Jakarta EE compatible server (Tomcat 10.1+ recommended)

### 2) Database setup

Create the database:

```sql
CREATE DATABASE medconnect;
```

Default local connection is configured in:
`src/main/resources/META-INF/persistence.xml`

- URL: `jdbc:mysql://localhost:3306/medconnect?useSSL=false&serverTimezone=UTC`
- User: `root`
- Password: *(empty by default)*

Update these values if your local MySQL setup is different.

### 3) Build

```bash
mvn clean package
```

This generates a WAR file in `target/`.

### 4) Run

Deploy the generated WAR to your servlet container (for example, Tomcat), then open the app in your browser.

## Main routes

- `/home`
- `/register`
- `/login`
- `/logout`
- `/nurse`
- `/queue`
- `/generalist`
- `/consultation`
- `/medicalrecord`

## Notes

- Passwords are hashed using BCrypt.
- Hibernate schema mode is currently set to `update` for local development.
