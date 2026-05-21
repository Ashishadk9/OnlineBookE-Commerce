<%----settings.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Settings</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
  </head>
  <body>
   <%@ include file="/WEB-INF/templates/headeradmin.jsp" %>
   <div class="admin-main">
    <jsp:include page="/WEB-INF/templates/sidebar.jsp">
    <jsp:param name="page" value="settings"/>
    </jsp:include>
    <main class="content">
        <div class="table-card">
            <div class="table-header">
                <h2>Settings</h2>
            </div>
            <div style="padding: 1.5rem;">
                <!--Profit & Security form-->
                <form action="${pageContext.request.contextPath}/admin/settings" method="post">
                    <div class="settings-tabs"
                         style="display:
                         flex; gap: 1rem;
                         border-bottom: 1px solid #e2e8f0;
                         margin-bottom: 1.5rem;">
                        <a href="#profile" style="padding: 8px 1rem;
                         text-decoration: none; color: #2f3b63;
                          font-weight: 500;">Profile</a>
                    </div>

                    <!--Profile Section-->
                    <div id="profile" class="setting-section">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="fullName" value="${user.fullName}">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                           <input type="email" name="email" value="${user.email}">
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" name="phone" value="${user.phone}">
                        </div>

                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="newPassword" value="">
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirmPassword" value="">
                        </div>
                    </div>
                    <button type="submit" class="save-btn">Save Changes</button>
                    </form>
            </div>
        </div>
        </main>
   </div>
  <!--Footer-->
   <%@include file="/WEB-INF/templates/footer.jsp"%>

     <!--Optional  simple JS move tabs-->
  <script>
      const tabs = document.querySelectorAll('.settings-tab a');
      const sections = document.querySelectorAll('.settings-section');
      tabs.forEach((tab,index) => {
          tab.addEventListener('click', (e) => {
              e.preventDefault();
              tabs.forEach(t => t.style.color ='#666');
              tab.style.color ='#2f3b63';
              sections.forEach(s => s.style.display='none');
              sections[index].style.display='block';
          });
      });
      if (sections.length) sections[0].style.display='none';
  </script>
  </body>
</html>

