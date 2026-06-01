<%----edit-books.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
  <html>
    <head>
     <title>${empty book ? 'Add Book' : 'Edit Book'}</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
    </head>
   <body>
   <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
   <div class="admin-main">
       <jsp:include page="/WEB-INF/templates/sidebar.jsp">
       <jsp:param name="page" value="books"/>
       </jsp:include>
       <main class="content">
          <div class="form-card">
              <h1 class="page-title">${empty book ? 'Add New Book' : 'Edit Book'}</h1>
              <form action="${pageContext.request.contextPath}/admin/books" method="post" class="book-form">
                  <input type="hidden" name="action" value="${empty book ? 'add' : 'update'}"/>
                  <c:if test="${not empty book}">
                      <input type="hidden" name="id" value="${book.id}"/>
                  </c:if>
                  
                  <div class="form-group">
                      <label>Book Title</label>
                      <input type="text" name="title" value="${book.title}" required/>
                  </div>
                  <div class="form-group">
                      <label>ISBN Number</label>
                      <input type="text" name="isbn" value="${book.isbn}" required/>
                  </div>
                  <div class="form-group">
                      <label>Published</label>
                      <input type="date" name="publishedDate" value="${book.publishedDate}" required/>
                  </div>
                  <div class="form-group">
                      <label>Stock</label>
                      <input type="number" name="stock" value="${book.stock}" required/>
                  </div>
                  <div class="form-group">
                      <label>Author</label>
                      <input type="text" name="author" value="${book.author}"/>
                  </div>
                  <div class="form-group">
                      <label>Price</label>
                      <input type="number" step="0.1" name="price" value="${book.price}" required/>
                  </div>
                  <div class="form-group">
                      <label>Cover Image URL</label>
                      <input type="text" name="imagePath" value="${book.imagePath}" placeholder="https://..." />
                  </div>
                  <div class="form-group">
                      <label>Description</label>
                      <textarea name="description" rows="4">${book.description}</textarea>
                  </div>
                  <div class="action-buttons">
                      <button type="submit" class="update-btn">Update Book</button>
                      <a href="${pageContext.request.contextPath}/admin/books" class="cancel-btn">Cancel</a>
                  </div>
              </form>
          </div> 
       </main>

     </div>
   <%@include file="/WEB-INF/templates/footer.jsp"%>
   </body>
 </html>