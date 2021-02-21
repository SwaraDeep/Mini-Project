<%@page import="com.doc.Cookie"%>
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
	String sdate = request.getParameter("date");

	if (dname == null || dname.isEmpty() || sdate == null || sdate.isEmpty()) {
		System.out.println("\nInvalid attempt to access bookAppointment.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {
		System.out.print("Doc: " + dname + " Date: " + sdate);

		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
		java.sql.Date sqldate = new java.sql.Date(date.getTime());
		String pname = null;
		String pmobile = null;

		if (Cookie.list(request, "bookAppointment.jsp") <= 2) {
			out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
		} else {
			pname = Cookie.get(request, "pname");
			pmobile = Cookie.get(request, "pmobile");

			if (pname != null && pmobile != null) {

		if (JDBCHelper.bookAppointment(dname, sqldate, pname, pmobile)) {
			out.println("Appointment booked on " + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900));
			Cookie.delete(response, request, "bookAppointment.jsp");
		} else {
			out.print("Failed to book appointment! Please <a href=login.jsp >try again!</a>");
		}

			} else {
		out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
			}
		}
	}
	%>

</body>
</html>