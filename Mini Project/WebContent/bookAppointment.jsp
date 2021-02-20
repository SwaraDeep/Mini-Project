
<%@page import="com.doc.JDBCHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid</title>
</head>
<body>

	<%
	String dname = request.getParameter("doc");
	System.out.print("Doc: " + dname + " Date: " + request.getParameter("date"));
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
	java.sql.Date sqldate = new java.sql.Date(date.getTime());
	String pname = null;
	String pmobile = null;

	Cookie cookies[] = request.getCookies();
	if (cookies == null || cookies.length <= 2 || cookies[1].getName() == null || cookies[1].getName() == ""
			|| cookies[2].getName() == null || cookies[2].getName() == "") {
		out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
	} else {
		if (cookies[1].getName().equals("pname") && cookies[2].getName().equals("pmobile")) {

			pname = cookies[1].getValue();
			pmobile = cookies[2].getValue();

			if (JDBCHelper.bookAppointment(dname, sqldate, pname, pmobile)) {
		out.println("Appointment booked on " + +date.getDate() + "-" + (date.getMonth() + 1) + "-"
				+ (date.getYear() + 1900));
		Cookie[] c = request.getCookies();
		for (int i = 1; i < c.length; i++) {
			System.out.println("bookAppointment.jsp - Cookie Invalidated: " + c[i].getName());
			c[i].setMaxAge(0);
			response.addCookie(c[i]);
		}
			} else {
		out.print("Failed to book appointment! Please <a href=login.jsp >try again!</a>");
			}
		} else {
			out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
		}
	}
	%>


</body>
</html>