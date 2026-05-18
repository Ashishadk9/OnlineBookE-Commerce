<%----footer.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
<footer class="site-footer">
    <div class="footer-grid">
        <!-- logo + Name -->
        <div class="footer-col logo-col">
            <div class="footer-logo">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="UniqueBooks" onerror="this.src='${pageContext.request.contextPath}/static/images/logo.png'">
                <span>UniqueBooks</span>
            </div>
        </div>
        <!--Quick link-->
        <div class="footer-col">
            <h3>Quick link</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/product">Product</a> </li>
                <li><a href="${pageContext.request.contextPath}/about">About us</a> </li>
            </ul>
        </div>

        <!--Contact Info-->
        <div class="footer-col">
            <h3>Contact</h3>
            <ul class="contact-list">
                <li> <a href="mailto:support@gmail.com">support@uniquebooks.com</a> </li>
                <li>+977 067-010-2337</li>
                <li>Mon-Fri, 9am-6pm</li>
            </ul>
        </div>

        <!--Follow/social-->
        <div class="footer-col">
            <h3>Follow</h3>
            <ul class="follow-list">
                <li><a href="#">Twitter</a> </li>
                <li><a href="#">Facebook</a> </li>
                <li><a href="#">LinkedIn</a> </li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 UniqueBooks. All rights reserved.</p>
    </div>
</footer>