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
<title>ENROLL NOW</title>


<link rel = "stylesheet" href = "reg.css">
<link rel = "stylesheet" href = "nav.css">
</head>
<body>



<%@ page import="java.sql.*" %>
<%
String session_name = (String)session.getAttribute("user_email");

String session_user = (String)session.getAttribute("user_name");

String sessionid = (String)session.getAttribute("user_id");

%>
<% 


try{

Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");
	
	

if(request.getParameter("enroll") != null)

{

if(request.getParameter("fname") != null ||  request.getParameter("phone_num") != null )

{

Statement st =con.createStatement();

// String rid = request.getParameter("rid");

String user_name = request.getParameter("fname");

String category = request.getParameter("category");

String shift = request.getParameter("shift");

String phone_num = request.getParameter("phone_num");

String address = request.getParameter("address");
String session_email = (String) session.getAttribute("user_email");



//hash password


PreparedStatement ps = con.prepareStatement("insert into enroll(fname, category, shift,mobile,address,userid) values(?,?,?,?,?,?);");

ps.setString(1,user_name);

ps.setString(2,category);

ps.setString(3,shift);

ps.setString(4,phone_num);

ps.setString(5,address);

ps.setString(6,sessionid);




int x = ps.executeUpdate();


response.sendRedirect("view2.jsp");
}

else

{

/* out.print("enter the details"); */

/* String er = "enter the details"; */

}

}

else

{

//out.print("enter the details");

}

}

catch(Exception e)

{

 out.println("error" +e);

}

%>


	<div class="container">
		<div class="screen">
			<div class="screen__content">
			
		
			
			<form class="login">
			
				<div class="login__field">
					<h3>Enroll Form </h3>
				</div>
				 
			
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name = "fname" placeholder="User name" value="<%= session.getAttribute("user_name") %>">
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<!-- <input type="email" class="login__input" name= "email" placeholder="Email"> -->
					<select name = "category">
					<option>classical</option>
					<option>bollywood</option>
					<option>salsa</option>
					<option> hip hop</option>
					</select>
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<!-- <input type="password" class="login__input" name = "password" placeholder="Password"> -->
					<select name = "shift">
					<option>Morning</option>
					<option>Afternoon</option>
					<option>Evening</option>
					</select>
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text" class="login__input"  name = "phone_num" placeholder= "Phone Number">
					
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text" class="login__input"  name = "address" placeholder= "Address">
					
				</div>
			
				
			
				
				<button class="button login__submit" name="enroll" type="submit">
					<span class="button__text">Enroll Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>				
			</form>
			
			<div class="social-login">
					
				<div class="social-icons">
					<a href="#" class="social-login__icon fab fa-instagram"></a>
					<a href="#" class="social-login__icon fab fa-facebook"></a>
					<a href="#" class="social-login__icon fab fa-twitter"></a>
				</div>
			</div>
		</div>
		
		
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div>
		
</body>

<script>

function verifyPassword() {

var decimal= /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;

var pw = document.getElementById("password").value;

var uname = document.getElementById("fname").value;

var lname = document.getElementById("lname").value;

var email = document.getElementById("email").value;

var date = document.getElementById("date").value;

if(uname == "") {

document.getElementById("uname-message").innerHTML = "**Fill the username please!";

return false;

}

if(lname == "") {

document.getElementById("lname-message").innerHTML = "**Fill the lastname please!";

return false;

}

if(email == "") {

document.getElementById("email-message").innerHTML = "**Fill the email please!";

return false;

}

//check empty password field

if(pw == "") {

document.getElementById("pass-message").innerHTML = "**Fill the password please!";

return false;

}

//To check a password between 8 to 15 characters which contain at least one lowercase letter,

//one uppercase letter, one numeric digit, and one special character

if(!pw.match(decimal)){

document.getElementById("pass-message").innerHTML = "**Follow the rules for password";

return false;

}

//minimum password length validation

if(pw.length < 8) {

document.getElementById("pass-message").innerHTML = "**Password length must be atleast 8 characters";

return false;

}

//maximum length of password validation

if(pw.length > 15) {

document.getElementById("pass-message").innerHTML = "**Password length must not exceed 15 characters";

return false;

} else {

}

if(date == "") {

document.getElementById("date-message").innerHTML = "**Fill the date please!";

return false;

}

}

</script>
</html>