<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
</head>
<body>

	<script>
		function validateSignupForm() {
			var dname = document.getElementById("dname").value;
			var dpass = document.getElementById("dpassword").value;
			var name = document.getElementById("name").value;
			var flag = 0;

			if (dname == null || dname == "") {
				document.getElementById("dname_req").innerHTML = "*Username is required";
				document.getElementById("dname_req").style.display = "block";
				flag = 1;
			} else {
				document.getElementById("dname_req").style.display = "none";
			}

			if (dpass == null || dpass == "") {
				document.getElementById("dpass_req").style.display = "block";
				flag = 1;
			} else {
				document.getElementById("dpass_req").style.display = "none";
			}

			if (name == null || name == "") {
				document.getElementById("name_req").style.display = "block";
				flag = 1;
			} else {
				document.getElementById("name_req").style.display = "none";
			}

			
				//check if a doctor with same user name exists or not
				var xhttp = new XMLHttpRequest();
			    xhttp.onreadystatechange = function(){
			        if(this.readyState == 4 && this.status == 200){
			        	var res = this.responseText;
			            if(res.search("not exists") != -1){
							document.getElementById("dname_req").innerHTML = "Available";
							document.getElementById("dname_req").style.display = "block";
							if(flag == 0){
								document.getElementById("form").submit();
							}
							return false;
			            }else if(res.search("exists") != -1){
							document.getElementById("dname_req").innerHTML = "*Account already exists!";
							document.getElementById("dname_req").style.display = "block";
							return false;
			            }
			        }
			    };
			    xhttp.open('POST', "checkDoctorAccount.jsp?doctor=" + dname, true);
			    xhttp.send();
			    return false;
			
			return false;
		}
	</script>

	Doctor Signup Form:
	<form action=createDoctor.jsp id=form onsubmit="return validateSignupForm()"
		method=POST>
		User name: <input type=text id=dname name=dname ><br>
		<div id=dname_req style="color: red; display: none;">*Username
			is required</div>
		Password: <input type=password id=dpassword name=dpassword ><br>
		<div id=dpass_req style="color: red; display: none;">*Password
			is required</div>
		Name: <input type=text id=name name=name ><br>
		<div id=name_req style="color: red; display: none;">*Name is
			required</div>
		<input type=submit value=Signup>
	</form>

</body>
</html>