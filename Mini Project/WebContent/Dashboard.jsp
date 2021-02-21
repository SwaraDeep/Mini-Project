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
<title>Dashboard</title>
</head>
<body onload=search()>

	<script>

function search(){
	var container = document.getElementById("list");
	var date = document.getElementById("search_date").value;
	
	if(date == null || date == ""){
		date = "all";
	}
	
	 var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function(){
	        if(this.readyState == 4 && this.status == 200){
	            container.innerHTML = this.responseText;
	        }
	    };
	    xhttp.open('POST', "getAppointments.jsp?date=" + date, true);
	    xhttp.send();
}

</script>

<%
	if (Cookie.list(request, "Dashboard.jsp") <= 1) {
		System.out.println("\nInvalid attempt to access Dashboard.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {

		String dname = Cookie.get(request, "doctor");
		if (dname != null) {

			//welcome text
			out.print("<h2>Welcome " + dname + "!</h2>");
			out.print("<a href=logout.jsp >Logout</a>");

			out.print("<br>Search: <input type=date id=search_date ><button onclick=search() >Search</button>");

			out.println("<h2>Appointments:</h2>");

			out.println("<div id=list >Please wait....</div>");

		} else if (Cookie.get(request, "patient") != null) {
			response.sendRedirect("appointment.jsp");
		} else {
			System.out.println("\nInvalid attempt to access Dashboard.jsp -- Redirecting to login.jsp");
			response.sendRedirect("login.jsp");
		}
	}
%>
</body>
</html>