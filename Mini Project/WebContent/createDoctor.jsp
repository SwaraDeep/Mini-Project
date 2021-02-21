<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Doctor"%>
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

	if(dname == null || dname.isEmpty() || dpass == null || dpass.isEmpty() || name == null || name.isEmpty()){
		System.out.println("\nInvalid attempt to access createDoctor.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	}else{
		
		Doctor doctor = new Doctor(dname, dpass, name);

		if (JDBCHelper.insertDoctor(doctor)) {
			out.write("Account created Successfully!");
			out.write("<br><a href=login.jsp >Login...</a>");
		} else {
			out.write("Failed to signup! Please try again!");
			out.write("<br><a href=signup.jsp >Signup...</a>");
		}
		
	}
	%>

</body>
</html>