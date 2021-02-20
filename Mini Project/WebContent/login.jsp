<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body>
	<script>
            function validateDocLogin(){
            	//get the values of Doctor name and password
            	var name = document.getElementById("dname").value;
            	var pass = document.getElementById("dpass").value;
            	var flag = 0;
            	
            	//check if the username field is empty or null
                if(name == null || name == ""){
                    document.getElementById("dname_req").style.display = "block";
                	flag = 1;
                }else{
                    document.getElementById("dname_req").style.display = "none";
                }
                
              //check if the password field is empty or null
				if(pass == null || pass == ""){
                    document.getElementById("dpass_req").style.display = "block";
                	flag = 1;
                }else{
                    document.getElementById("dpass_req").style.display = "none";
                }

				if(flag == 1){
					return false;
				}else{
					return true;
				}
            }
            
            
            //Validate Patient form
            function validatePatientLogin(){
            	//get the values of Doctor name and password
            	var name = document.getElementById("pname").value;
            	var mobile = document.getElementById("pmobile").value;
            	var flag = 0;
            	
            	//check if the username field is empty or null
                if(name == null || name == ""){
                    document.getElementById("pname_req").style.display = "block";
                	flag = 1;
                }else{
                    document.getElementById("pname_req").style.display = "none";
                }
                
              //check if the password field is empty or null
				if(mobile == null || mobile == ""){
                    document.getElementById("pmobile_req").style.display = "block";
                	flag = 1;
                }else{
                	if(mobile.length < 8 || mobile.length > 13){
                		document.getElementById("pmobile_req").innerHTML = "*Invalid mobile number";
                        document.getElementById("pmobile_req").style.display = "block";
                    	flag = 1;
                	}else{
                        document.getElementById("pmobile_req").style.display = "none";
                	}
                }

				if(flag == 1){
					return false;
				}else{
					return true;
				}
            }
            
        </script>

	<%
	Cookie[] cookies = request.getCookies();

	System.out.println("\nlogin.jsp - Cookies :(" + cookies.length + "): ");

	for (int i = 0; i < cookies.length; i++) {
		System.out.println("\t" + cookies[i].getName() + " : " + cookies[i].getValue());
	}

	if (cookies.length == 2 && cookies[1].getName().equals("doctor")) {
		response.sendRedirect("Dashboard.jsp");
	}
	%>

	<!-- Doctor Login Form -->
	<form action=validateLogin.jsp?type=doctor
		onsubmit="return validateDocLogin()" method=POST>
		<h3>Doctors Login</h3>
		<div>User Name:</div>

		<input type=text name=dname id=dname>
		<div id=dname_req style="color: red; display: none;">*User name
			is required</div>

		<div>Password:</div>
		<input type=password name=dpass id=dpass>
		<div id=dpass_req style="color: red; display: none;">*Password
			is required</div>
		<br>
		<input type=submit value=Login> <a href=signup.jsp>Register
			Here</a>
	</form>

	<!-- Patient Login Form -->
	<form action=validateLogin.jsp?type=patient
		onsubmit="return validatePatientLogin()" method=POST>
		<h3>Patient Login</h3>
		<div>User Name:</div>
		<input type=text name=pname id=pname>
		<div id=pname_req style="color: red; display: none;">*Patient
			name is required</div>
		<div>Mobile:</div>
		<input type=number name=pmobile id=pmobile>
		<div id=pmobile_req style="color: red; display: none;">*Mobile
			number is required</div>
		<br>
		<input type=submit value=Proceed>
	</form>
</body>
</html>