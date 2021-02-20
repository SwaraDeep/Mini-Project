<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>

	<%
	Cookie[] c = request.getCookies();
	for (int i = 1; i < c.length; i++) {
		System.out.println("logout.jsp - Cookie Invalidated: " + c[i].getName() + " : " + c[i].getValue());
		c[i].setMaxAge(0);
		response.addCookie(c[i]);
	}
	out.print("Successfully logged out! <br>Return to <a href=login.jsp >login</a> page!");
	%>


</body>
</html>