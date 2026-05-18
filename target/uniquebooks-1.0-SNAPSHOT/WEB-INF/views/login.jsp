<%----login.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login UniqueBooks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
</head>
<body>
   <%@ include file="/WEB-INF/templates/header.jsp"%>
     <div class="auth-container">
         <div class="auth-card">
             <h2>Welcome back</h2>
             <p>Sign in to UniqueBooks</p>

             <c:if test="${not empty error}">
                 <div class="error">${error}</div>
             </c:if>

             <form action="${pageContext.request.contextPath}/login" method="post">
                 <input type="email" name="email" placeholder="Email" required>
                 <input type="password" name="password" placeholder="Password" required>
                 <button type="submit">Login</button>
             </form>

             <div class="link">
                 New here? <a href="${pageContext.request.contextPath}/register">Create an account</a>
             </div>
         </div>
     </div>

    <%@include file="/WEB-INF/templates/footer.jsp" %>
</body>
</html>