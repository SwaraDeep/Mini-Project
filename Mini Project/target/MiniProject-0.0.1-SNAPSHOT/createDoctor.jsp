<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper" %>
<%@ page import="com.doc.Doctor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Doctor</title>
</head>
<body>

<% 

	String dname = request.getParameter("dname");
	String dpass = request.getParameter("dpassword");
	String name = request.getParameter("name");
	
	Doctor doctor = new Doctor(dname, dpass, name);
	
	if(JDBCHelper.insertDoctor(doctor)){
		out.write("Inserted Successfully!");
	}
	
	
%>

</body>
</html>