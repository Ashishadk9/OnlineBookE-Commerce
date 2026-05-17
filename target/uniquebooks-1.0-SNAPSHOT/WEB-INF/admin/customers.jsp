<%----customers.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customers</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
</head>
<body>
<%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
<div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
    <jsp: param name="page" value="customers"/>
    </jsp:include>
    <main class="content">
        <div class="table-card">
            <div class="table-header">
                <h2>Customers</h2>
            </div>
      <table class="data-table">
       <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th></tr></thead>
      <tbody>
       <c:forEach var="c" items="${customers}">
           <tr>
               <td>${c.id}</td>
               <td>${c.fullName}</td>
               <td>${c.email}</td>
               <td>${c.phone}</td>
           </tr>
       </c:forEach>
       </tbody>
      </table>
     </div>
        <%@include file="/WEB-INF/templates/footer.jsp"%>
    </main>
</div>
</body>
</html>
