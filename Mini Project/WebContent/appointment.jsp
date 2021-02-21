<!-- 
	To show the appointment form to the patient
	Require two cookies - pname and pmobile
 -->

<%@page import="com.doc.JDBCHelper"%>
<%@page import="com.doc.Cookie"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Appointment</title>
</head>
<body>
	<script src="js/appointment.js" type="text/javascript"></script>

	<%
	/*
	 *To validate the patient name and mobile number cookies
	 */
	String pname = Cookie.get(request, "pname");
	String pmobile = Cookie.get(request, "pmobile");
	if (pname == null || pname.isEmpty() || pmobile == null || pmobile.isEmpty()) {
		System.out.println("\nInvalid attempt to access appointment.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {

		//To display the form that contains Doctor name and Date fields
		out.print("<h2>Get Appointment:</h2>");
		out.print("<form action=bookAppointment.jsp onsubmit='return validatePatientForm()' method=POST >");
		out.print("<span>Select Doctor:</span>&emsp;");
		out.print("&emsp;<select id=doc name=doc >");
		out.print("<option selected>---Select---</option>");

		/*
		 * Retreiving Doctor names from database
		 */
		List<String> list = JDBCHelper.getAllDoctors();

		if (list.size() != 0) {
			Iterator<String> i = list.iterator();

			while (i.hasNext()) {
		String name = i.next();

		//To add options to the <select> tag
		out.print("<option value=\"" + name + "\">" + name + "</option>");
			}
			out.print("</select><span id=doc_req style='color: red; display: none;'>&nbsp;*required</span>");
		}

		//Date input field
		out.print("<br><br><span>Select Date:</span>&emsp;");
		out.print("&emsp;<input type=date id=date name=date ><div id=date_req style='color: red; display: none;'>&nbsp;*required</div>");
		out.print("<br><input type=submit value='Book Appointment'>");
	}
	%>
</body>
</html>