<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="index3.css">
<link rel="stylesheet" href="footer.css">
</head>
<body>
<nav>
        <div class="container">
                <img src="https://i.postimg.cc/K8TZQwpJ/tutorial-logo.png" width="20" height="40">
                <input type="checkbox" id="showNav">
                <label for="showNav" id="toggleNav"><i class="fas fa-bars"></i></label>
            <ul>
                <li><a href="index1.jsp" class="active">Home</a></li>
                <li><a href="about.jsp">About us</a></li>
                 <li><a href="achievement.jsp">Achievement</a></li>
                  <li><a href="choreographers.jsp">Choreographers</a></li>
                  <li><a href="login.jsp">LogIn</a></li>
                
                <%
	                if(session.getAttribute("user_name")!=null)
	            	{
	            %>
	            		<li><a href="login.jsp">logout</a></li>
	            <%
	            	}
                %>
            </ul>
        </div>
    </nav>
    
    <section>
        <div class="container">
        <h1>Dance</h1>
        

       <!--  <input type="search" placeholder="search...">
 -->
        <p>Dancing can be a tremendous sport and it is great fun also. If you are looking for a path to get in shape, dancing is a great choice. You can burn a lot of calories while dancing and also tone your body. Dancing is also a great way to boost your balance and coordination. </p>
        <%
	                if(session.getAttribute("user_name")!=null)
	            	{
	            %>
	            		<a href="regjsp.jsp">sign-up here</a>
	            <%
	            	}
                %>
        
        <a href="enroll1.jsp">Enroll Now</a>
        </div>
    </section>
     <%@ include file = "footer.jsp" %>
</body>
</html>