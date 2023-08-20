
<%
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%


if (session.getAttribute("user_email") == null) {
	response.sendRedirect("login.jsp");
}

Enumeration<String> sessionNames = session.getAttributeNames();
boolean allnull = true;

while (sessionNames.hasMoreElements()) {
	String sessionName = sessionNames.nextElement();
	Object sessionAttribute = session.getAttribute(sessionName);

	if (sessionAttribute != null) {
		allnull = false;
		break;
	}
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="hm-gradient">


<%
	String showsuccess = null, showerror = null, enn = null, rid = null, add = null;

	String session_email = (String) session.getAttribute("user_email");

	/* String btn_logout = request.getParameter("logout"); */

	/* String btn_submit = request.getParameter("submit");
	String pname = request.getParameter("pname");
	String game = request.getParameter("game");
	String date = request.getParameter("date");
	String mnum = request.getParameter("mnum");
	String gender = request.getParameter("gender");
	String mail = request.getParameter("mail");

	String[] en = request.getParameterValues("en"); */

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance", "root", "");

	if (con != null) {

		/* if(btn_logout != null){
			
			session.invalidate(); 
			response.sendRedirect("login.jsp");
			
		} */
		}
	%>







   <main>

<div class="container mt-4">
            <div class="card mb-4">
                <div class="card-body">
                
               <table class="table table-hover">
                        <!--Table head-->
                        <thead class="mdb-color darken-3">
                            <tr class="text-white">
                                <th>id</th>
                                <th>User Name</th>
                                <th>Phone number</th>
                                <th>Address</th>
                                <th>Category</th>
                                <th>Shift</th>
                                <th>Update</th>
                                <th>delete</th>
                            </tr>
                        </thead>  
                        
                        <tbody>
                        <%
						String sql2 = "SELECT * FROM reg where email=?";
						PreparedStatement pst2 = con.prepareStatement(sql2);

						pst2.setString(1, session_email);

						ResultSet rs2 = pst2.executeQuery();

						if (rs2.next()) {
							rid = rs2.getString("email");

							//-------------

							String sq12 = "SELECT * FROM enroll where email = ?";
							PreparedStatement pst12 = con.prepareStatement(sq12);

							pst12.setString(1, rid);

							ResultSet rs12 = pst12.executeQuery();
							while (rs12.next()) {

								String eid = rs12.getString("eid");
								String fname = rs12.getString("fname");
								String mobile = rs12.getString("mobile");
								String address = rs12.getString("address");
								/* String gen = rs12.getString("gender");
								String delimiter = ",";
								String[] array_en = gen.split(delimiter); */
						%>
                            <tr>
                                <th scope="row"><%=rs12.getString("eid")%></th>
                                <td><%=rs12.getString("fname")%></td>
                                <td><%=rs12.getString("mobile")%></td>
                                <td><%=rs12.getString("address")%></td>
                                <td><%=rs12.getString("category")%></td>
                                <td><%=rs12.getString("shift")%></td>
                                <td><a href="update.jsp?eid=<%=eid%>"
								class="btn btn-primary">Update</a></td>
							<td><a href="delete.jsp?eid=<%=eid%>"
								class="btn btn-danger">Delete</a></td>
                            </tr>
                            <%
						}
						}
						%>
                            </tbody>
                             </table>
                             
                    <!--Table-->
                </div>
            </div>

        </div>
        <!--MDB Tables-->
      
    </main>
                           
                

</body>
</html>