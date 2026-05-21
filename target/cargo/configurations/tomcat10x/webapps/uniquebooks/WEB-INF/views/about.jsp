<%----about.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover"/>
    <title>UniqueBook Hand-picked Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #faf9f8;
            color: #1a2a3a;
            line-height: 1.5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem 2rem;
        }
        .about-section {
            background: white;
            border-radius: 24px;
            padding: 2rem;
            margin: 2rem 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
        }
        .about-section h2{
            font-size: 1.8rem;
            color: #0f172a;
            margin-bottom: 1rem;
            padding-left:1rem;
        }
        .about-list{
            list-style: none;
            margin-top: 1rem;
        }
        .about-list li {
            margin: 0.8rem 0;
            padding-left: 1.5rem;
            position: relative;
        }
        .about-list li:before {
            content: '*';
            color: black;
            font-weight: bold;
            font-size: 1.2rem;
            position: absolute;
            left: 0;
        }
        .team-section {
            margin:3rem 0;
        }
        .team-section h2 {
            font-size: 1.8rem;
            color: #0f172a;
            margin-bottom: 1rem;
            text-align: center;
            padding-left: 1rem;
        }
        .team-grid{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        .team-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
            text-align: center;
            padding-bottom: 1.2rem;
            transition: 0.2s;
        }
        .team-card:hover {
            transform: translateY(-5px);
        }
        .team-image{
            width: 100%;
            height: 260px;
            object-fit: cover;
            background: #e2e8f0;
        }
        .team-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0.8rem 0 0.2rem;
        }
        .team-role {
            color: #64748b;
            font-size:0.9rem;
        }
        @media (min-width: 768px) {
            .container {
                padding: 0.8rem 1rem;
            }
            .team-grid {
                gap: 1rem;
            }
            .team-image {
                height: 200px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <%@include file="/WEB-INF/templates/header.jsp"%>

    <!--About Section-->
    <div class="about-section">
        <h2>About the Bookstore</h2>
        <ul class="about-list">
            <li>10 carefully curated books across fiction, history, and more.</li>
            <li>To make great books accessible to every reader.</li>
            <li>Available for all types of readers.</li>
            <li>UniqueBooks is your destination for a thoughtfully curated collection of books.</li>
            <li>All books price shown in Rs.</li>
        </ul>
    </div>

    <!--Meet the Team Section-->
    <div class="team-section">
          <h2>Meet the Team behind our success</h2>
           <p style="margin-bottom:1rem; color: #475569; text-align: center;">
               Our talented team of professionals dedicated to delivering excellence and innovation.
           </p>
         <div class="team-grid">
            <!--Team Member1-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team2.png" alt="Dev Raj Kandel" onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book.png'">
                <div class="team-name">Dev Raj Kandel</div>
                <div class="team-role">Founder & Lead</div>
            </div>
            <!--Team Member2-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team1.png" alt="Ashish Adhikari" onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book.png'">
                <div class="team-name">Ashish Adhikari</div>
                <div class="team-role">UI/UX Designer</div>
            </div>
            <!--Team Member3-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team2.png" alt="Bimal Pandey " onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book1.jpg'">
                <div class="team-name">Bimal Pandey</div>
                <div class="team-role">Content Creator</div>
            </div>
            <!--Team Member4-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team2.png" alt="Darshan Jung Kc" onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book1.jpg'">
                <div class="team-name">Darshan Jung Kc</div>
                <div class="team-role">Manager</div>
            </div>
            <!--Team Member5-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team2.png" alt="Ashok Karki" onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book1.jpg'">
                <div class="team-name">Ashok Karki</div>
                <div class="team-role">Developer</div>
            </div>
            <!--Team Member6-->
            <div class="team-card">
                <img class="team-image" src="${pageContext.request.contextPath}/static/images/team2.png" alt="Samir Thapa" onerror="this.src='${pageContext.request.contextPath}webapp/static/images/book1.jpg'">
                <div class="team-name">Samir Thapa</div>
                <div class="team-role">Software developer</div>
            </div>
        </div>
    </div>


</div>
<%@include file="/WEB-INF/templates/footer.jsp"%>
</body>
</html>