<%----manage-books.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Books</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
    </head>
  <body>
  <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
  <div class="admin-main">
      <jsp:include page="/WEB-INF/templates/sidebar.jsp">
      <jsp: param name="page" value="manage books"/>
      </jsp:include>

      <main class="content">
          <div class="table-card">
              <div class="table-header">
                  <h2>Manage Books</h2>
                  <a href="#" class="add-btn">+ Add New Book</a>
              </div>
              <table class="data-table">
                  <thead>
                  <tr><th>ID</th><th>Title</th><th>Author</th><th>ISBN</th>
                      <th>Genre</th><th>Published</th><th>Price</th><th>Action</th></tr>
                  </thead>
                  <tbody>
                  <c:forEach var="book" items="${books}">
                      <tr>
                          <td>${book.id}</td>
                          <td>${book.title}</td>
                          <td>${book.author}</td>
                          <td>${book.isbn}</td>
                          <td>${book.published}</td>
                          <td>${book.genre}</td>
                          <td>Rs. ${book.price}</td>
                          <td class="action">
                              <a href="${pageContext.request.contextPath}../admin/view-book?id=${book.id}" class="view">View</a>
                              <a href="${pageContext.request.contextPath}../admin/edit-books?id=${book.id}" class="edit">Edit</a>
                              <a href="${pageContext.request.contextPath}../admin/delete-book?id=${book.id}" class="delete"> onclick="return confirm('Delete this book?')">Delete</a>
                          </td>
                      </tr>
                  </c:forEach>
                  <c:if test="${empty books}">
                      <tr><td colspan="8" style="text-align:center;"> No books found. Add some!</td> </tr>
                  </c:if>
                  </tbody>
              </table>
          </div>
          <%@include file="/WEB-INF/templates/footer.jsp"%>
      </main>
  </div>
  </body>
</html>
