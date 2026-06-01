<%--
order-details page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Order Details</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
</head>
<body>
<%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
<div class="admin-main">
  <jsp:include page="/WEB-INF/templates/sidebar.jsp">
    <jsp:param name="page" value="orders"/>
  </jsp:include>
  <main class="content">
    <div class="details-card">
      <h1 class="page-title">Order Details</h1>
      <table class="details-table">
        <tr><th>Order ID</th><td>${order.orderNumber}</td></tr>
        <tr><th>Customer</th><td>${order.customerName}</td></tr>
        <tr><th>Date</th><td>${order.orderDate}</td></tr>
        <tr><th>Status</th><td>${order.status}</td></tr>
        <tr><th>Total Amount</th><td>Rs. ${order.totalAmount}</td></tr>
      </table>
      <h3>Items</h3>
      <table class="data-table">
        <thead>
        <tr><th>Book Title</th><th>Quantity</th><th>Unit Price</th><th>Total</th></tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
          <tr>
            <td>${item.bookTitle}</td>
            <td>${item.quantity}</td>
            <td>${item.price}</td>
            <td>${item.price * item.quantity}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="action-buttons">
        <a href="${pageContext.request.contextPath}/admin/orders" class="back-btn">Back to Orders</a>
      </div>
    </div>
  </main>
</div>
<%@include file="/WEB-INF/templates/footer.jsp"%>
</body>
</html>
