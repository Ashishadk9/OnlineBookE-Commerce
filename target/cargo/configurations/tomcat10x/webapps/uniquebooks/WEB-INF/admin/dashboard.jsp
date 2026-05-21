<%----dashboard.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
</head>
<body>
<%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
 <div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
        <jsp:param name="page" value="dashboard"/>
    </jsp:include>

    <main class="content">
        <h1 class="page-title">Dashboard</h1>
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value">10</div>
                <div class="stat-label">Total Books</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">5</div>
                <div class="stat-label">Total Orders</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">Rs. 12,200</div>
                <div class="stat-label">Revenue</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">3</div>
                <div class="stat-label">Pending Users</div>
            </div>
        </div>

        <div class="table-card">
            <div class="table-header">
                <h3>Recent Orders</h3>
            </div>
            <div style="padding: 0 1rem 1rem 1rem">
                <c:forEach items="${recentOrders}" var="order">
                    <div style="border-bottom: 1px solid #eee;
                                padding: 12px 0;
                                display:flex; justify-content:space-between;">
                        <div><strong>${order.orderNumber}</strong>
                        <br>${order.orderDate}</div>
                        <div>Rs. ${order.totalAmount}</div>
                    </div>    
                </c:forEach>
                <c:if test="${empty recentOrders}">
                    <p>No recent orders.</p>
                </c:if>
            </div>
        </div>
     </main>
 </div>
       <%@include file="/WEB-INF/templates/footer.jsp"%>
  </body>
</html>