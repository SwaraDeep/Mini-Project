//to validate the Doctor Name and Date fields 
function validatePatientForm() {
	var doc = document.getElementById("doc").value;
	var date = document.getElementById("date").value;
	var flag = 0;

	if (doc == null || doc == "" || doc == "---Select---") {
		document.getElementById("doc_req").style.display = "inline-block";
		flag = 1;
	} else {
		document.getElementById("doc_req").style.display = "none";
	}

	if (date == null || date == "") {
		document.getElementById("date_req").style.display = "inline-block";
		flag = 1;
	} else {
		document.getElementById("date_req").style.display = "none";
	}

	if (flag == 0) {
		return true;
	} else {
		return false;
	}

}