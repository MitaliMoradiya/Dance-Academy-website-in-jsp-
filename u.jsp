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

<link rel = "stylesheet" href = "enroll1.css">
<link rel = "stylesheet" href = "nav.css">
<link rel = "stylesheet" href = "index0.css">
 
 <script src="nav.js"></script>
</head>
<body>
<%@ page import="java.sql.*" %>

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

String session_user = (String)session.getAttribute("user_name");

String sessionid = (String)session.getAttribute("user_id");

/* out.print("Hi "+session_name);

out.print("Hi "+sessionid); */

%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");

try{
	String[] SHIFT={"Morning","Afternoon","Evening"};
	
	String[] cat={
			"classical","bollywood","salsa","hip hop"
	
	};

	
if(request.getParameter("update")!= null)

{

String update = request.getParameter("update");
out.println(update);
//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from enroll where eid ="+update+"");

while(rs.next())

{

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
    
    <div id="form-main">
  <div id="form-div">
   <form class="form" id="form1" method = "post" action="update.jsp" >
      
       <p class="name">
<h1> Enroll Now</h1>    </p>

 <input type="hidden"  name = "update"  value="<%= rs.getString("eid") %>">
  <p class="name">
        <input name="fname" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Name"  value="<%= rs.getString("fname") %>"/>
      </p>
      
 
 
        <p class="name">
       	<select name = "category" class="validate[required,length[6,300]] feedback-input">
						
					<% 
					
					for(int i=0;i<cat.length;i++)
					{
				
						if(cat[i].equals(rs.getString("category")))
						{
							out.println("<option selected>"+cat[i]+"</option>");
						}
						else
						{
							out.println("<option>"+cat[i]+"</option>");
						}
					}%>
					
					
					
					</select>
      </p>
      
      <p class="name">
<select name = "shift" class="validate[required,length[6,300]] feedback-input">
					
					<% 
					
					for(int i=0;i<SHIFT.length;i++)
					{
						
						
				
						if(SHIFT[i].equals(rs.getString("shift")))
						{
							out.println("<option selected>"+SHIFT[i]+"</option>");
						}
						else
						{
							out.println("<option>"+SHIFT[i]+"</option>");
						}
					}%>
					
					</select>      </p>
					
					
					 <p class="text">
        <input name="phone_num" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="Mobile_no:" value="<%= rs.getString("mobile") %>">
      </p>
      
        <p class="text">
		<input type="text" class="validate[required,length[6,300]] feedback-input"  name = "address" placeholder= "Address"  value="<%= rs.getString("address") %>">
      </p>
      
 
<div class="submit">
        <input type="submit" value="SEND" name="enroll" id="button-blue"/>
        <div class="ease"></div>
      </div>
<!-- Form Start -->

<%-- <div class="container">
		<div class="screen">
			<div class="screen__content">
			
		
			
			<form class="login" method = "post" action="update.jsp" >
			
				<div class="login__field">
					<h3>Enroll Form </h3>
				</div>
				 <input type="hidden"  name = "update"  value="<%= rs.getString("eid") %>"> --%>
			
				<%-- <div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name = "fname" placeholder="User name" value="<%= rs.getString("fname") %>">
				</div> --%>
				
				<%-- <div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<!-- <input type="email" class="login__input" name= "email" placeholder="Email"> -->
					<select name = "category">
					<option><%=rs.getString("category") %></option>
					</select>
				</div> --%>
				
				<%-- <div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<!-- <input type="password" class="login__input" name = "password" placeholder="Password"> -->
					<select name = "shift">
					<option><%=rs.getString("shift") %></option>
					</select>
				</div> --%>
				<%-- 
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text" class="login__input"  name = "phone_num" placeholder= "Phone Number" value="<%= rs.getString("mobile") %>">
					
				</div> --%>
				
			<%-- 	<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text" class="login__input"  name = "address" placeholder= "Address" value="<%= rs.getString("address") %>">
					
				</div> --%>
			
				 </form>

			
				
				<!-- <button class="button login__submit" name="enroll" type="submit">
					<span class="button__text">Enroll Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button> -->				
		<!-- 	</form>
			
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
</div> -->

<%

if(request.getParameter("update")!= null)

{

Statement st =con.createStatement();

String fname = request.getParameter("fname");

String category = request.getParameter("category");

String shift = request.getParameter("shift");

String phone_num = request.getParameter("phone_num");

String address = request.getParameter("address");

String id = request.getParameter("update");

PreparedStatement ps = con.prepareStatement("update enroll set fname=?,category=?,shift=?, phone_num=?,address=? where eid = ?;");

ps.setString(1,fname);

ps.setString(2,category);

ps.setString(3,shift);

ps.setString(4,phone_num);

ps.setString(5,address);

ps.setString(6,id);


int x = ps.executeUpdate();

response.sendRedirect("view2.jsp");

}

%>

<!-- Form Close -->



<!-- Form Wrap Close -->



<!-- Container Close -->

<%

}

}

}

catch(Exception e)

{

//out.println(e);

}
%>  </div>
   <%@ include file = "footer.jsp" %>

</body>
</html>