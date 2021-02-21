function search() {
	var container = document.getElementById("list");
	var date = document.getElementById("search_date").value;

	if (date == null || date == "") {
		date = "all";
	}

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			container.innerHTML = this.responseText;
		}
	};
	xhttp.open('POST', "getAppointments.jsp?date=" + date, true);
	xhttp.send();
}