<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
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
			
			Cookie[] c = request.getCookies();
			for(int i = 1; i < c.length; i++){
				System.out.println("validateLogin.jsp (doctor) - Cookie Invalidated: " + c[i].getName() + " : " + c[i].getValue());
				c[i].setMaxAge(0);
				response.addCookie(c[i]);
			}

			String dname = request.getParameter("dname");
			String dpass = request.getParameter("dpass");
			
			if(dname == null || dname == "" || dpass == null || dpass == ""){
				out.print("Dname: " + dname + " Dpass: " + dpass);
				out.print("Incomplete request!<br> Please login <a href=login.jsp >here</a>");
			}else{
				
				//validate doctor name and password
				if(JDBCHelper.getDoctor(dname, dpass)){
					
					//create cookie of doctor
					Cookie cookie = new Cookie("doctor", dname);
					cookie.setMaxAge(60 * 60);
					response.addCookie(cookie);
					System.out.print("validateLogin.jsp - Cookie Added: doctor");
					
					//redirect to dashboard
					response.sendRedirect("Dashboard.jsp");
				}else{
					out.print("Invalid credentials! Please try again...<br>Return to <a href=login.jsp >login page</a>");
					
				}
				
			}
		}else if(type.equals("patient")){

			Cookie[] c = request.getCookies();
			for(int i = 1; i < c.length; i++){
				System.out.println("validateLogin.jsp (Pateint) - Cookie Invalidated: " + c[i].getName() + " : " + c[i].getValue());
				c[i].setMaxAge(0);
				response.addCookie(c[i]);
			}
			
			String pname = request.getParameter("pname");
			String pmobile = request.getParameter("pmobile");
			
			if(pname == null || pname == "" || pmobile == null || pmobile == ""){
				out.print("Invalid request!<br> Please login <a href=login.jsp >here</a>");
			}else{

				//create cookie of patient
				Cookie cookie = new Cookie("pname", pname);
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);
				System.out.print("validateLogin.jsp - Cookie Added: pname");
				cookie = new Cookie("pmobile", pmobile);
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);
				System.out.print("validateLogin.jsp - Cookie Added: pmobile");
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