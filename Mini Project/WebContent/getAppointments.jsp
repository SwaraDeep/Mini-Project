<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Appointment"%>
<%@ page import="com.doc.Cookie"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	if (Cookie.list(request, "getAppointments.jsp") <= 1) {
		System.out.println("\nInvalid attempt to access getAppointments.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {
		String dname = Cookie.get(request,"dname");
		if (dname != null) {
			String sdate = request.getParameter("date");
			List<Appointment> appointments = JDBCHelper.getAppointments(dname, sdate);
			String output = "";
			
			if (appointments == null && sdate.equals("all")) {
				out.println("<div id=list >No appointments at all!");
				//out.println("<div id=list >No appointments on " + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900) + "</div>");
			} else if(appointments == null){
				out.println("<div id=list >No appointments on " + sdate);
			}else{
				out.print("<div id=list ><table border=1 ><tr><th>Patient Name</th><th>Mobile</th><th>Date</th></tr>");
				Iterator<Appointment> i = appointments.iterator();
				
				while (i.hasNext()) {
					Appointment appointment = i.next();
					output += "<tr><td>" + appointment.getPname() + "</td><td>" + appointment.getMobile() + "</td><td>"	+ appointment.getDate() + "</td></tr>";
				}
				out.print(output + "</table></div>");
			}
		} else if (Cookie.get(request, "pname") != null) {
			response.sendRedirect("appointment.jsp");
		}
	}
	%>
</body>
</html>