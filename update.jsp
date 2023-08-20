<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>

<%@ page import="java.util.Base64" %>

<%@ page import="java.io.*"%>

<%@ page import="java.math.*"%>

<%@ page import="java.security.MessageDigest"%>

<%@ page import="java.util.Calendar"%>

<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel = "stylesheet" href = "reg.css">
</head>
<body>
<%

response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");

response.setDateHeader("Expires", 0);

response.setHeader("Pragma","no-cache");

if(session.getAttribute("user_id")== null)

{

response.sendRedirect("login.jsp");

}

%>

<%

String session_name = (String)session.getAttribute("user_email");

String sessionid = (String)session.getAttribute("user_id");

/* out.print("Hi "+session_name);

out.print("Hi "+sessionid); */

%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");
try{

if(request.getParameter("update")!= null)

{
Statement st =con.createStatement();

String fname = request.getParameter("fname");

String category = request.getParameter("category");

String shift = request.getParameter("shift");

String phone_num = request.getParameter("phone_num");

String address = request.getParameter("address");

String update = request.getParameter("update");
System.out.println(update);
PreparedStatement ps = con.prepareStatement("update enroll set eid=?,fname=?,category=?,shift=?, mobile=?,address=? where eid =" + update);

ps.setString(1,update);
ps.setString(2,fname);
ps.setString(3,category);
ps.setString(4,shift);
ps.setString(5,phone_num);
ps.setString(6,address);


int x = ps.executeUpdate();
response.sendRedirect("view2.jsp");

/* response.sendRedirect("index.jsp"); */

}

}

catch(Exception e)

{

out.println(e);

}

%>


</body>
</html>