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
            	var name = document.getElementById("dname").value;
                if(name == null || name == ""){
                    document.getElementById("dname_req").style.display = "block";
                    return false;
                }else{
                	return true;
                }
            }
        </script>

	<form onsubmit="return validateDocLogin()">
		<h3>Doctors Login</h3>
		<div>User Name:</div>
		<input type=text name=dname id=dname>
		<div id=dname_req style="color: red; display: none;">*User name
			is required</div>
		<div>Password:</div>
		<input type=password name=dpass> <input type=submit
			value=Login>
	</form>
</body>
</html>