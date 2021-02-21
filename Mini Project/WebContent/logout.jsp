<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.doc.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>

	<%
	Cookie.delete(response, request, "logout.jsp");
	out.print("Successfully logged out! <br>Return to <a href=login.jsp >login</a> page!");
	%>

</body>
</html>