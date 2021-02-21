<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Cookie"%>
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
		System.out.println("\nInvalid attempt to access vaidateLogin.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	}else{
		
		//Check if doctor trying to login
		if(type.equals("doctor")){
			
			Cookie.delete(response, request, "validateLogin.jsp");

			String dname = request.getParameter("dname");
			String dpass = request.getParameter("dpass");
			
			if(dname == null || dname == "" || dpass == null || dpass == ""){
				System.out.println("Dname: " + dname + "\t Dpass: " + dpass);
				System.out.println("\nInvalid attempt to access vaidateLogin.jsp -- Redirecting to login.jsp");
				response.sendRedirect("login.jsp");
			}else{
				
				//validate doctor name and password
				if(JDBCHelper.getDoctor(dname, dpass)){
					
					//create cookie of doctor
					Cookie.create(response, "dname", dname, "validateLogin.jsp");
					
					//redirect to dashboard
					response.sendRedirect("Dashboard.jsp");
				}else{
					out.print("Invalid credentials! Please try again...<br>Return to <a href=login.jsp >login page</a>");
					
				}
				
			}
		}else if(type.equals("patient")){ //Check if patient tying to login

			Cookie.delete(response, request, "validateLogin.jsp");
			
			String pname = request.getParameter("pname");
			String pmobile = request.getParameter("pmobile");
			
			if(pname == null || pname == "" || pmobile == null || pmobile == ""){
				System.out.println("Pname: " + pname + "\t Pmobile: " + pmobile);
				System.out.println("\nInvalid attempt to access validateLogin.jsp -- Redirecting to login.jsp");
				response.sendRedirect("login.jsp");
			}else{

				//create cookie of patient
				Cookie.create(response, "pname", pname, "validateLogin.jsp");
				Cookie.create(response, "pmobile", pmobile, "validateLogin.jsp");
				
				//redirect to appointment page
				response.sendRedirect("appointment.jsp");
				
			}
		}else{
			System.out.println("\nInvalid attempt to access validateLogin.jsp -- Redirecting to login.jsp");
			response.sendRedirect("login.jsp");
		}
	}

	%>

</body>
</html>