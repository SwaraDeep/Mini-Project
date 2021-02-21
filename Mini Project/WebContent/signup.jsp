<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
</head>
<body>

	<script type="text/javascript" src="js/signup.js"></script>

	Doctor Signup Form:
	<form action=createDoctor.jsp id=form onsubmit="return validateSignupForm()"
		method=POST>
		User name: <input type=text id=dname name=dname ><br>
		<div id=dname_req style="color: red; display: none;">*Username
			is required</div>
		Password: <input type=password id=dpassword name=dpassword ><br>
		<div id=dpass_req style="color: red; display: none;">*Password
			is required</div>
		Name: <input type=text id=name name=name ><br>
		<div id=name_req style="color: red; display: none;">*Name is
			required</div>
		<input type=submit value=Signup>
	</form>

</body>
</html>