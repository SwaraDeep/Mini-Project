function validateSignupForm() {
	var dname = document.getElementById("dname").value;
	var dpass = document.getElementById("dpassword").value;
	var name = document.getElementById("name").value;
	var flag = 0;
	var flag1 = 0;

	if (dname == null || dname == "") {
		document.getElementById("dname_req").innerHTML = "*Username is required";
		document.getElementById("dname_req").style.display = "block";
		flag = 1;
		flag1 = 1;
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

	if (flag1 != 1) {

		//check if a doctor with same user name exists or not
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var res = this.responseText;
				if (res.search("not exists") != -1) {
					document.getElementById("dname_req").innerHTML = "Available";
					document.getElementById("dname_req").style.display = "block";
					if (flag == 0) {
						document.getElementById("form").submit();
					}
					return false;
				} else if (res.search("exists") != -1) {
					document.getElementById("dname_req").innerHTML = "*Account already exists!";
					document.getElementById("dname_req").style.display = "block";
					return false;
				}
			}
		};
		xhttp.open('POST', "checkDoctorAccount.jsp?doctor=" + dname, true);
		xhttp.send();
		return false;
	}
	return false;
}