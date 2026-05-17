<%----error404.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 Page Not Found</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/error.css" />
</head>
 <body>
  <div class="container">
    <h1>404</h1>
    <h2>We're sorry, but the page you are looking for does not exist.</h2>
    <a href="${pageContext.request.contextPath}/home" class="btn">Return to Home </a>
   </div>
 </body>
</html>