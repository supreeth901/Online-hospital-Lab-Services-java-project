function validate_LabService() {
	
	
	var duration = document.getElementById("name").value.trim();
	var duration1 = document.getElementById("pass").value.trim();
	
	
	
	

	var filter = /^([a-zA-Z ])+$/;
	var intfilter = /^([0-9])+$/;
	var decimal = /^[-+]?[0-9]+\.[0-9]+$/;
	var negative = /^-/;
	var count = 0;
	if (duration == null || duration == "" || duration.length == 0|| duration==0) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter admin Id";
		count++;
	} else if (decimal.test(duration)) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>admin Id should not be in decimal";
		count++;
	} else if (negative.test(duration)) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Admin cannot be a Negative value";
		count++;
	} else {
		document.getElementById("adminId").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
	if (duration1 == null || duration1 == "" || duration1.length == 0|| duration1==0) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter admin Id";
		count++;
	} else if (decimal.test(duration)) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>admin Id should not be in decimal";
		count++;
	} else if (negative.test(duration)) {
		document.getElementById("adminId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Admin cannot be a Negative value";
		count++;
	} else {
		document.getElementById("adminId").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
	
	if (count > 0) {
		return false;
	}
	
	function removeErrorquery() {
		document.getElementById("errorName").innerHTML = " ";

	}
	function removeErrorquery1() {

		document.getElementById("errordesc").innerHTML = " ";

	}
	
	
	
	}
	
	
	
	
	
	
	
