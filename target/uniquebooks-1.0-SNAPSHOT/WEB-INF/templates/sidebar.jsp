<%----sidebar.jsp---%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@  taglib prefix="c" uri="jakarta.tags.core" %>
<aside class="sidebar">
    <div class="sidebar-title">ADMIN</div>
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="${param.page == 'dashboard' ? 'active': ''}">Dashboard</a> </li>
        <li><a href="${pageContext.request.contextPath}/admin/manage-books" class="${param.page == 'books' ? 'active': ''}">Manage Books</a> </li>
        <li><a href="${pageContext.request.contextPath}/admin/orders" class="${param.page == 'orders' ? 'active': ''}">Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/customers" class="${param.page == 'customers' ? 'active': ''}">Customers</a> </li>
        <li><a href="${pageContext.request.contextPath}/admin/approve-users" class="${param.page == 'approve' ? 'active': ''}">Approve Users</a> </li>
        <li><a href="${pageContext.request.contextPath}/admin/reports" class="${param.page == 'reports' ? 'active': ''}">Reports</a> </li>
        <li><a href="${pageContext.request.contextPath}/admin/settings" class="${param.page == 'settings' ? 'active': ''}">Settings</a> </li>
    </ul>
</aside>