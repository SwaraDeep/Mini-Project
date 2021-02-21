function validateDocLogin() {
	//get the values of Doctor name and password
	var name = document.getElementById("dname").value;
	var pass = document.getElementById("dpass").value;
	var flag = 0;

	//check if the username field is empty or null
	if (name == null || name == "") {	
		document.getElementById("dname_req").innerHTML = "*User name is required";
		flag = 1;
	} else {
		document.getElementById("dname_req").innerHTML = "";
	}

	//check if the password field is empty or null
	if (pass == null || pass == "") {
		document.getElementById("dpass_req").innerHTML = "*Password	is required";
		flag = 1;
	} else {
		document.getElementById("dpass_req").innerHTML = "";
	}

	if (flag == 1) {
		return false;
	} else {
		return true;
	}
}


//Validate Patient form
function validatePatientLogin() {
	//get the values of Doctor name and password
	var name = document.getElementById("pname").value;
	var mobile = document.getElementById("pmobile").value;
	var flag = 0;

	//check if the username field is empty or null
	if (name == null || name == "") {
		document.getElementById("pname_req").innerHTML = "*Patient name is required";
		flag = 1;
	} else {
		document.getElementById("pname_req").innerHTML = "";
	}

	//check if the password field is empty or null
	if (mobile == null || mobile == "") {
		document.getElementById("pmobile_req").innerHTML = "*Mobile number is required";
		flag = 1;
	} else {
		if (mobile.length < 8 || mobile.length > 13) {
			document.getElementById("pmobile_req").innerHTML = "*Invalid mobile number";
			flag = 1;
		} else {
			document.getElementById("pmobile_req").innerHTML = "";
		}
	}

	if (flag == 1) {
		return false;
	} else {
		return true;
	}
}
