<%----orders.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
 <html>
   <head>
    <title>Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
   </head>
  <body>
     <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
     <div class="admin-main">
         <jsp:include page="/WEB-INF/templates/sidebar.jsp">
             <jsp: param name="page" value="orders"/>
         </jsp:include>
         <main class="content">
             <div class="table-card">
                 <div class="table-header">
                     <h2>Orders</h2>
                 </div>
                 <table class="data-table">
                     <thead>
                     <tr>
                         <th>Order ID</th>
                         <th>Customer</th>
                         <th>Date</th>
                         <th>Total</th>
                         <th>Status</th>
                         <th>Actions</th>
                     </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="order" items="${orders}">
                         <tr>
                             <td>${order.orderNumber}</td>
                             <td>${order.customerName}</td>
                             <td>${order.orderDate}</td>
                             <td>${order.totalamount}</td>
                             <td>
                                 <span class="status-badge status-${order.status}">
                                     ${order.status}
                                 </span>
                             </td>
                             <td><a href="#">View</a> </td>
                         </tr>
                     </c:forEach>
                     <c:if test="${empty orders}">
                         <tr><td colspan="6" style="text-align:center;">No orders found.</td> </tr>
                     </c:if>
                     </tbody>
                 </table>
             </div>
             <%@include file="/WEB-INF/templates/footer.jsp"%>
         </main>
     </div>
  </body>
 </html>