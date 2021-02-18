<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
</head>
<body>

	<form action=createDoctor.jsp method=POST >
		User name: <input type=text id=dname name=dname><br>
		Password: <input type=password id=dpassword name=dpassword><br>
		Name: <input type=text id=name name=name><br>
		<input type=submit value=Signup >
	</form>

</body>
</html>