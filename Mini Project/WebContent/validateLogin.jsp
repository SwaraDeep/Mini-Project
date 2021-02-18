<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid Request</title>
</head>
<body>

	<%
	String type = request.getParameter("type");
	
	if(type == null || type == ""){
		out.print("Invalid request!<br> Please login <a href=login.jsp >here</a>");
	}else{
		
		if(type.equals("doctor")){

			String dname = request.getParameter("dname");
			String dpass = request.getParameter("dpass");
			
			if(dname == null || dname == "" || dpass == null || dpass == ""){
				out.print("Incomplete request!<br> Please login <a href=login.jsp >here</a>");
			}else{
				
				//validate doctor name and password
				if(JDBCHelper.getDoctor(dname, dpass)){
					//TODO cookie
					
					
					response.sendRedirect("Dashboard.jsp");
				}else{
					out.print("Invalid credentials! Please try again...<br>Return to <a href=login.jsp >login page</a>");
				}
				
			}
		}else if(type.equals("patient")){

			String pname = request.getParameter("pname");
			String pmobile = request.getParameter("pmobile");
			
			if(pname == null || pname == "" || pmobile == null || pmobile == ""){
				out.print("Invalid request!<br> Please login <a href=login.jsp >here</a>");
			}else{
				
				//redirect to appointment page
				response.sendRedirect("appointment.jsp");
				
			}
		}else{
			out.print("Invalid request!<br> Please login <a href=login.jsp >here</a>");
		}
	}

	%>

</body>
</html>