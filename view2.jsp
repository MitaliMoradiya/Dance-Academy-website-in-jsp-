<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>

<%@ page import="java.util.Base64" %>

<%@ page import="java.io.*"%>

<%@ page import="java.math.*"%>

<%@ page import="java.security.MessageDigest"%>

<%@ page import="java.util.Calendar"%>

<%@ page import="java.text.SimpleDateFormat"%>
<% response.setHeader("Cache-Control","no-cache"); %>
<% response.setHeader("Cache-Control","no-store");  %>
<% response.setDateHeader("Expires", 0);  %>
<% response.setHeader("Pragma","no-cache");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
<link rel = "stylesheet" href = "view2.css">
 <link rel = "stylesheet" href = "nav.css">
<!--  <script src="nav.js"></script> -->
</head>
<body>

<%
if(session.getAttribute("user_id")== null)

{

response.sendRedirect("login.jsp");

}

%>

<%

String session_name = (String)session.getAttribute("user_email");

String session_user = (String)session.getAttribute("user_name");

String sessionid = (String)session.getAttribute("user_id");

/* out.print("Hi "+session_name);

out.print("Hi "+sessionid); */

%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");

//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from enroll where userid="+sessionid+"");

%>

   <nav>
      <!--   <div class="container"> -->
               
               
                <label for="showNav" id="toggleNav"><i class="fas fa-bars"></i></label>
            <ul> 
            
            <li><img src="https://i.postimg.cc/K8TZQwpJ/tutorial-logo.png" width="20" height="40"></li>
                <li><a href="index1.jsp" class="active">Home</a></li>
                <li><a href="#">About us</a></li>
                 <li><a href="#">Achievement</a></li>
                  <li><a href="#">Choreographers</a></li>
                  <li><a href="logout.jsp">Logout</a></li>
             <%--    
                <%
	                if(session.getAttribute("user_name")!=null)
	            	{
	            %>
	            		<li><a href="login.jsp">logout</a></li>
	            <%
	            	}
                %> --%>
            </ul>
        </div>
    </nav>



<div class="table-wrapper">
    <table class="fl-table">
<!-- <table id ="customers"> -->
<thead>
<tr>

<th>fname</th>
<th>category</th>
<th>shift</th>
<th>mobile</th>
<th>address</th>

<th class="u">Update</th>

<th class="u">Delete</th>

</tr>
</thead>
        <tbody>

<%

while(rs.next())

{

%>

<tr>

<td> <%= rs.getString(2) %></td>
<td> <%= rs.getString(3) %></td>
<td> <%= rs.getString(4) %></td>
<td> <%= rs.getString(5) %></td>
<td> <%= rs.getString(6) %></td>

<td><a href="u.jsp?update=<%= rs.getString(1)%>" class="edit">Update</a></td>

<td><a href="delete.jsp?delete=<%= rs.getString(1)%> " class="del">Delete</a></td>

</tr>
 <tbody>
<%

}%>

</table>
</div>
 <%@ include file = "footer.jsp" %>
</body>
</html>