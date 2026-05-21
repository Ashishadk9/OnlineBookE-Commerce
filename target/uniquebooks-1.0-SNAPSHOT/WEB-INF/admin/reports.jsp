<%----reports.jsp---%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Reports</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
  </head>
  <body>
   <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
   <div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
    <jsp:param name="page" value="reports"/>
    </jsp:include>
    <main class="content">
        <div class="table-card">
            <div class="table-header">
                <h2>Reports</h2>
            </div>
            <!--Statistics Cards-->
            <div class="stat-grid">
                <div class="stat-card">
                    <div class="stat-value">${totalBooks}</div>
                    <div class="stat-label">Total Books</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${totalOrders}</div>
                    <div class="stat-label">Total Orders</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">Rs. ${revenue}</div>
                    <div class="stat-label">Revenue</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${pendingUsers}</div>
                    <div class="stat-label">Pending Users</div>
                </div>
            </div>
        </div>
    </main>
   </div>
   <%@include file="/WEB-INF/templates/footer.jsp"%>
  </body>
</html>
