<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Appointment"%>
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
	Cookie cookies[] = request.getCookies();
	if (cookies == null || cookies.length <= 1 || cookies[1].getName() == null || cookies[1].getName() == "") {
		out.print("Please login!<br>Click <a href=login.jsp >here</a> to login");
	} else {
		if (cookies[1].getName().equals("doctor")) {

			String dname = cookies[1].getValue();

			//welcome text
			out.print("<h2>Welcome " + dname + "!</h2>");
			out.print("<a href=logout.jsp >Logout</a>");

			out.print("<br>Search: <input type=date id=search_date ><button onclick=search() >Search</button>");

			out.println("<h2>Appointments:</h2>");

			out.println("<div id=list >Please wait....</div>");

		} else if (cookies[1].getName().equals("patient")) {
			response.sendRedirect("appointment.jsp");
		} else {
			System.out.println("\nDashboard.jsp - Cookies(" + cookies.length + "): ");

			for (int i = 0; i < cookies.length; i++) {
		System.out.println("\t" + cookies[i].getName() + " : " + cookies[i].getValue());
			}
			out.println("Something went wrong. Please try again!");
		}
	}
	%>
</body>
</html>