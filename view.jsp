<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>

<thead>

<tr>

<th class="pro-remove"> </th>

<th class="pro-thumbnail"> </th>

<th class="pro-name">Product</th>

<th class="pro-price">Price</th>

<th class="pro-quantity">Quantity</th>

</tr>

</thead>

<tbody>s
<%@ page import="java.sql.*" %>
<% 
try{

Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance","root","");
	
	/* String sql2 = "SELECT * FROM reg where rid=?";

	PreparedStatement pst2 = con.prepareStatement(sql2);

	pst2.setString(1, user_id); 

	ResultSet rs2 = pst2.executeQuery(); */

	/* if (rs2.next()) {

	rid = rs2.getString("email");
 */
	//-------------
String session_email = (String) session.getAttribute("user_id");

	String sq12 = "SELECT * FROM enroll where eid = ?";

	PreparedStatement pst12 = con.prepareStatement(sq12);

	pst12.setString(1, session_email);

	ResultSet rs12 = pst12.executeQuery();

	while (rs12.next()) {

	String id = rs12.getString("fname");
/* 
	String gen = rs12.getString("price");

	String delimiter = ",";

	String[] array_en = gen.split(delimiter); */
	
	
	
	
	
	%>
	<tr>

<td class="pro-remove"></td>

<td class="pro-thumbnail">

<div class="pro-info">


</div>

</td>


<td class="pro-name"><span> <%=rs12.getString("fname")%></span></td>
	<% 
	}
	
}

	catch(Exception e)

	{

	 out.println("error" +e);

	}

	%>
	 


</body>
</html>