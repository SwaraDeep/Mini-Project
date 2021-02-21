<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>

	<script type="text/javascript" src="js/login.js"></script>

	<%
	if (Cookie.get(request, "dname") != null) {
		response.sendRedirect("Dashboard.jsp");
	}
	%>

	<!-- Doctor Login Form -->
	<div id=container >
	<div id=doc_form >
	<form action=validateLogin.jsp?type=doctor onsubmit="return validateDocLogin()" method=POST>
		<h3>Doctors Login</h3>
		<div class=text >User Name:</div>

		<input type=text name=dname id=dname ><br>
		<div id=dname_req style="color: red;"></div>
		<div class=text >Password:</div>
		<input type=password name=dpass id=dpass>
		<div id=dpass_req style="color: red;"></div>
		<input type=submit value=Login> <a href=signup.jsp>Register
			Here</a>
	</form>
</div>

<div id=patient_form >
	<!-- Patient Login Form -->
	<form action=validateLogin.jsp?type=patient
		onsubmit="return validatePatientLogin()" method=POST>
		<h3>Patient Login</h3>
		<div class=text >User Name:</div>
		<input type=text name=pname id=pname>
		<div id=pname_req style="color: red;"></div>
		<div class=text >Mobile:</div>
		<input type=number name=pmobile id=pmobile>
		<div id=pmobile_req style="color: red;"></div>
		<input type=submit value=Proceed>
	</form>
	</div>
	</div>
</body>
</html>