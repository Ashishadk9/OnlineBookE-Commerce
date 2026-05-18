<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css">
<header class="site-header">
    <div class="header-container">
        <!-- logo area(image+text) -->
        <div class="logo-area">
            <a href="${pageContext.request.contextPath}/home" style="text-decoration: none">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="UniqueBooks Logo">
            <span>UniqueBooks</span>
            </a>
        </div>

        <!-- Navigation Links -->
        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/product">Product</a>
            <a href="${pageContext.request.contextPath}/about">About</a>

            <!-- Cart icon -->
            <a href="${pageContext.request.contextPath}/cart" class="cart-icon">
                <img src="${pageContext.request.contextPath}/static/images/Icons.png" alt="Cart">
            </a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register">Register</a>
        </nav>
    </div>
</header>
