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
       
<!-- Check session is set or not And clearing Cached -->
<%
		if(session!=null){
			
			String userid=(String) session.getAttribute("user_id");
			System.out.println("Inside Session Check Code");
			
			if(session.getAttribute("user_id")==null)
			{
				response.sendRedirect("login.jsp");
				//System.out.println("Session is not set");
				
			}
			else
			{
				//*System.out.println("Session is sett");
			}
		}
		
		//clear cache for logout
		response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0); 
		
%>
	
<title>Insert title here</title>

<link rel = "stylesheet" href = "enroll1.css">
<link rel = "stylesheet" href = "nav.css">
<link rel = "stylesheet" href = "index0.css">
 
 <script src="nav.js"></script>
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

//System.out.println("First Name:"+ user_name +" \n Category: "+category +"\n shift :"+shift + "\n Phone_num : " +phone_num + " \n  address: "+address);
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


<nav>
        <div class="container">
                <img src="https://i.postimg.cc/K8TZQwpJ/tutorial-logo.png" width="20" height="40">
                <input type="checkbox" id="showNav">
                <label for="showNav" id="toggleNav"><i class="fas fa-bars"></i></label>
            <ul>
                <li><a href="index1.jsp" class="active">Home</a></li>
                <li><a href="#">About us</a></li>
                 <li><a href="#">Achievement</a></li>
                  <li><a href="#">Choreographers</a></li>
                  <li><a href="logout.jsp">Logout</a></li>
            
            </ul>
        </div>
    </nav>

<div id="form-main">
  <div id="form-div">
    <form class="form" id="form1">
      
       <p class="name">
<h1> Enroll Now</h1>    </p>
      
      <p class="name">
        <input name="fname" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Name" id="name" value="<%= session.getAttribute("user_name") %>"/>
      </p>
      
       <p class="name">
       	<select name = "category" class="validate[required,length[6,300]] feedback-input" required>
					<option selected disabled hidden>category</option>
					<option>classical</option>
					<option>bollywood</option>
					<option>salsa</option>
					<option> hip hop</option>
					</select>
      </p>
      
      
      <p class="name">
<select name = "shift" class="validate[required,length[6,300]] feedback-input" required>
					<option selected disabled hidden>shift</option>
					<option>Morning</option>
					<option>Afternoon</option>
					<option>Evening</option>
					</select>      </p>
      
      <p class="text">
        <input name="phone_num" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="Mobile_no:" required>
      </p>
      
      <p class="text">
		<input type="text" class="validate[required,length[6,300]] feedback-input"  name = "address" placeholder= "Address" required>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="SEND" name="enroll" id="button-blue"/>
        <div class="ease"></div>
      </div>
    </form>
  </div>
   <%@ include file = "footer.jsp" %>
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