<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.doc.JDBCHelper" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid Page</title>
</head>
<body>

<%
	String dname = request.getParameter("doctor");
	if(dname != null || !dname.isEmpty()){
		
		//0 - Not found, 1 - Found
		int flag = 0;
		List<String> list = JDBCHelper.getAllDoctors();
		
		if(list != null){
			Iterator<String> i = list.iterator();
			while(i.hasNext()){
				String name = i.next();
				if(name.equals(dname)){
					System.out.println("Exists: " + name);
					flag = 1;
				}
			}
		}
		
		if(flag == 1){
			out.print("exists");
		}else{
			out.print("not exists");
		}
	}else{
		System.out.println("\nInvalid attempt to access checkDoctorAccount.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	}
%>


</body>
</html>