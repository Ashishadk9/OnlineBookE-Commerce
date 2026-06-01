<%----headeradmin.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="admin-header">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
        <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="UniqueBooks Logo"/>
        <span>UniqueBooks</span>
       </a>
    </div>
    <div class="header-right">
      <div class="nav-center">
         <a href="${pageContext.request.contextPath}/home">Home</a>
         <a href="${pageContext.request.contextPath}/product">Product</a>
        <a href="${pageContext.request.contextPath}/about">About</a>
      </div>

        <a href="${pageContext.request.contextPath}/cart" class="cart-icon">
            <img src="${pageContext.request.contextPath}/static/images/Icons.png" alt="Cart"></a>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="admin-btn">Admin</a>
        <div class="user-area">
            <span class="user-name">${fullName}</span>
            <a href="${pageContext.request.contextPath}/logout" class="logout-icon">
                <img src="${pageContext.request.contextPath}/static/images/Icon.png" alt="Logout"></a>
        </div>
    </div>
</header>