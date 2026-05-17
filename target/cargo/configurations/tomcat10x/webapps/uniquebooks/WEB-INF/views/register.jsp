<%----register.jsp---%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register UniqueBooks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
</head>
<body>
<%@ include file="/WEB-INF/templates/header.jsp"%>
<div class="auth-container">
    <div class="auth-card">
        <h2>Create Account</h2>
        <p>Join UniqueBooks today</p>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <input type="text" name="fullName" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="tel" name="phone" placeholder="Phone(10 digits)" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            <button type="submit">Register</button>
        </form>

        <div class="link">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/templates/footer.jsp"%>
</body>
</html>