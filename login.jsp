<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="ISO-8859-1">
<title>login Form</title>
<link rel = "stylesheet" href = "reg.css">
<%

response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setHeader("Pragma","no-cache");
%>
<!-- <link rel="stylesheet" href="regstyle.css">
<link rel="stylesheet" href="style2.css"> -->
<!-- <style>
.er{
color:red;
text-align:center;

}
</style> -->
</head>
<body>
<%-- <%



response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setHeader("Pragma","no-cache");
%> --%>
<!-- cookies -->
 <%
    Cookie[] cookies = request.getCookies();
    String username="";
    String passw = "";
    if(cookies!=null)
    {
      for(int i=0;i<cookies.length;i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("username-cookie"))
        {
            username= cookie.getValue();
        }
        else if(cookie.getName().equals("password-cookie"))
        {
            passw= cookie.getValue();
        }
      }
    }
  %>
   
   <%
    String user=request.getParameter("email");
    String pass=request.getParameter("password");

    String rememberMe=  request.getParameter("rememberMe");
    if(rememberMe!=null)
    {
        Cookie usernameCookie = new Cookie("username-cookie", user);
        Cookie passwordCookie = new Cookie("password-cookie", pass);
        usernameCookie.setMaxAge(24*60*60);
        passwordCookie.setMaxAge(24*60*60);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
    }

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("email") != null || request.getParameter("password") != null)
		{
			String uname = request.getParameter("email");
			String password = request.getParameter("password");

			// Hash the entered password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(password.getBytes());
				byte[] hash = md.digest();
				String hashpass = new String(Base64.getEncoder().encode(hash));

			PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE email = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, hashpass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
			session.setAttribute("user_email", uname);
			session.setAttribute("user_id", rs.getString("rid"));
			session.setAttribute("user_name", rs.getString("user_name"));
			
			 response.sendRedirect("index1.jsp"); 
		} else {
			
			%>
			<p class="er"><%out.println("invalid username and password!"); %></p>
			<% 
			
		}
		}  
		else
		{
			%>
			<p class="er"><%out.println("invalid username and password!"); %></p>
			<% 
			

		}
		
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
			<form class="login" method = "post" onsubmit = "return check()">
			
				<div class="login__field">
					<h3>LOGIN Form </h3>
				</div>
			
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name = "email"  placeholder="email" id="email" value =" <%= username %>">
					<span id = "email-message" style="color:red"> </span>
				</div>
				
				
				<div class="login__field">
				<!-- 	<i class="login__icon fas fa-lock"></i> -->
					<input type="password" class="login__input" name = "password" placeholder="Password" id="password" value =" <%= passw %>">
					<span id = "pass-message" style="color:red"> </span>
					
				</div>
				
				<div class="login__field" >Remember me:
					<!-- <i class="login__icon fas fa-lock"></i> -->
					<input type="checkbox"  name = "rememberMe" value = "true" >
				</div>
				
				
				
				<button class="button login__submit" name="submit" type = "submit">
					<span class="button__text">Login Now</span>
					
					<i class="button__icon fas fa-chevron-right"></i>
				</button>	
				<div class="login__field">
				<!-- 	<i class="login__icon fas fa-lock"></i> -->
					<a href = "regjsp.jsp" >Sign up</a>
					<span id = "pass-message" style="color:red"> </span>
					
				</div>		
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
function check() {  
	var uname = document.getElementById("email").value;
	if(uname == ""){
  		document.getElementById("email-message").innerHTML = "**Fill the username please!";  
     	return false;
  	}
	
  	var pw = document.getElementById("password").value;  
  	//check empty password field  
  	if(pw == "") {  
     	document.getElementById("pass-message").innerHTML = "**Fill the password please!";  
     	return false;  
  	}  
  if(uname != null || pw != null)
	  {
	    document.getElementById("er-message").innerHTML = "**Incorrect Username and Password!";  
     	return false;
	  
	  }
  	
  }

</script>

</html>