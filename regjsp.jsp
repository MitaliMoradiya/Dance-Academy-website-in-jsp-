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
<title>REGISTRATION FORM</title>

<link rel = "stylesheet" href = "reg1.css">
</head>
<body>

<%@ page import="java.sql.*" %>
<% 
try{

Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");
	
	

if(request.getParameter("submit") != null)

{

if(request.getParameter("user_name") != null || request.getParameter("email") != null ||request.getParameter("password") != null || request.getParameter("phone_num") != null )

{

Statement st =con.createStatement();

// String rid = request.getParameter("rid");

String user_name = request.getParameter("user_name");

String email = request.getParameter("email");

String password = request.getParameter("password");

String phone_num = request.getParameter("phone_num");



//hash password

MessageDigest md = MessageDigest.getInstance("SHA-256");

md.update(password.getBytes());

byte[] hash = md.digest();

String hashpass = new String(Base64.getEncoder().encode(hash));

PreparedStatement ps = con.prepareStatement("insert into reg(user_name, email, password,phone_num) values(?,?,?,?);");

ps.setString(1,user_name);

ps.setString(2,email);

ps.setString(3,hashpass);

ps.setString(4,phone_num);



int x = ps.executeUpdate();


response.sendRedirect("login.jsp");
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
			
		
			
			<form class="login" method  = "post" onsubmit="return verifyPassword()">
			
				<div class="login__field">
					<h3>Registration Form </h3>
				</div>
				 
			
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name = "user_name"   placeholder="User name" id= "user_name"><br>
			<span id = "uname-message" style="color:red"> </span>
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="email" class="login__input" name= "email" placeholder="Email" id= "email"><br>
					<span id = "email-message" style="color:red"> </span></div>
				
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="password" class="login__input" name = "password" placeholder="Password" id= "password"><br>
					<span id = "pass-message" style="color:red"> </span>

					
				</div>
				
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="tel" class="login__input"  name = "phone_num" pattern="[0-9]{10}" placeholder= "Phone Number" id= "phone_num"><br>
					<span id = "phone-message" style="color:red"> </span>

					
					
				</div>
				
				<button class="button login__submit" name="submit" type = "submit">
					<span class="button__text">Register Now</span>
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

var uname = document.getElementById("user_name").value;

var phone = document.getElementById("phone_num").value;

var email = document.getElementById("email").value;



if(uname == "") {

document.getElementById("uname-message").innerHTML = "**Fill the username please!";

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

if(phone == "") {

document.getElementById("phone-message").innerHTML = "**Fill the phone please!";

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



}

</script>
</html>