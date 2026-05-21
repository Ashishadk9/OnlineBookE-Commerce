<%----approve-users.jsp---%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Approve-users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
  </head>
  <body>
   <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
  <div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
    <jsp:param name="page" value="approve-users"/>
    </jsp:include>
    <main class="content">
    <div class="table-card">
    <div class="table-header">
        <h2>Pending Approvals</h2>
    </div>
   <div class="pending-list">
    <c:forEach var="u" items="${pendingList}">
      <div class="pending-item">
            <div><strong>${u.fullName}</strong>
            <br>
                <span style="font-size:0.8rem;">${u.email} Registered ${u.createdAt}</span>
            </div>
        <div>
            <a href="${pageContext.request.contextPath}WEB-INF/admin/approveUsers? action=approve&id=${u.id}"
               class="approve-btn"> Approve</a>
            <a href="${pageContext.request.contextPath}WEB-INF//admin/approveUsers? action=reject&id=${u.id}"
               class="reject-btn"> Reject</a>
        </div>
     </div>
    </c:forEach>
   </div>
    </div>
        <%@include file="/WEB-INF/templates/footer.jsp"%>
    </main>
  </div>
  </body>
</html>