<%--
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
</head>
<body>
<%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
<div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
        <jsp:param name="page" value="books"/>
    </jsp:include>
    <main class="content">
        <div class="details-card">
           <h1>Book Details</h1>
            <p>ID: ${book.id}</p>
            <p>Title: ${book.title}</p>
           <p>Author: ${book.author}</p>
           <p>Published Date: ${book.publishedDate}</p>
           <p>ISBN: ${book.isbn}</p>
          <p>Genre: ${book.genre}</p>
          <p>Price: Rs. ${book.price}</p>
         <p>Stock: ${book.stock}</p>
         <p>Description: ${book.description}</p>

           <a href="${pageContext.request.contextPath}/admin/books">Back to List</a>
        </div>
    </main>
</div>
<%@include file="/WEB-INF/templates/footer.jsp"%>
</body>
</html>
