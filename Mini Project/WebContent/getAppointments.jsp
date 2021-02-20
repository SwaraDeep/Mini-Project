<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Appointment"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	Cookie cookies[] = request.getCookies();
	if (cookies == null || cookies.length <= 1 || cookies[1].getName() == null || cookies[1].getName() == "") {
		out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
	} else {
		if (cookies[1].getName().equals("doctor")) {

			String dname = cookies[1].getValue();
			String sdate = request.getParameter("date");
			List<Appointment> appointments = JDBCHelper.getAppointments(dname, sdate);
			String output = "";
			if (appointments == null && !sdate.equals("all")) {
		out.println("<div id=list >No appointments on " + sdate);
		//out.println("<div id=list >No appointments on " + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900) + "</div>");
			} else {
		out.print("<div id=list ><table border=1 ><tr><th>Patient Name</th><th>Mobile</th><th>Date</th></tr>");
		Iterator<Appointment> i = appointments.iterator();
		while (i.hasNext()) {
			Appointment appointment = i.next();
			output += "<tr><td>" + appointment.getPname() + "</td><td>" + appointment.getMobile() + "</td><td>"
					+ appointment.getDate() + "</td></tr>";
		}
		out.print(output + "</table></div>");
			}

		} else if (cookies[1].getName().equals("patient")) {
			response.sendRedirect("appointment.jsp");
		}
	}
	%>
</body>
</html>