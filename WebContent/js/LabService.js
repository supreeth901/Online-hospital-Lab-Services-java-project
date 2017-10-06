function validate_LabService() {
	var name = document.getElementById("name").value.trim();
	var desc = document.getElementById("desc").value.trim();
	var duration = document.getElementById("duration").value.trim();
	var cost = document.getElementById("cost").value.trim();
	
	

	var filter = /^([a-zA-Z ])+$/;
	var intfilter = /^([0-9])+$/;
	var decimal = /^[-+]?[0-9]+\.[0-9]+$/;
	var negative = /^-/;
	var count = 0;

	if (name == null || name == "" || name.length == 0) {
		document.getElementById("errorName").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter test name";
		count++;
	} else if (name.length > 5) {
		document.getElementById("errorName").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>test name should not be greater than 5";
		count++;
	}
	else if (!filter.test(name)) {
		document.getElementById("errorName").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Enter Valid test Name ";
		count++;
	} else {
		document.getElementById("errorName").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}

	if (desc == null || desc == "" || desc.length == 0) {
		document.getElementById("errordesc").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter test Description";
		count++;
	} else if (desc.length < 10) {
		document.getElementById("errordesc").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>test description should not be less 10 characters";
		count++;
	} else {
		document.getElementById("errordesc").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}

	if (!intfilter.test(duration)) {
		document.getElementById("errortime").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter numeric value";
		count++;
	}

	else if (duration == null || duration == "" || duration.length == 0|| duration==0) {
		document.getElementById("errortime").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter Test Duration in minutes";
		count++;
	} 
	else if(duration>420)
		{
		document.getElementById("errortime").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test Duaration cannot be greater than 420 minutes";
		count++;
		}
		else if (decimal.test(duration)) {
		
		document.getElementById("errortime").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test Duaration should not be in decimal";
		count++;
	} else if (negative.test(duration)) {
		document.getElementById("errortime").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test Duaration cannot be a Negative value";
		count++;
	} else {
		document.getElementById("errortime").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}

	if (!intfilter.test(cost)) {
		document.getElementById("errorcost").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter numeric value";
		count++;
	} else if (cost == null || cost == "" || cost.length == 0) {
		document.getElementById("errorcost").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter Test cost";
		count++;
	} else if (decimal.test(cost)) {
		document.getElementById("errorcost").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test cost should not be in decimal";
		count++;
	} else if (negative.test(cost)) {
		document.getElementById("errorcost").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test cost cannot be a Negative value";
		count++;
	} 
	else if(cost.length>7)
	{
	document.getElementById("errorcost").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Test cost should be below 10 lakhs";
	count++;
	}
	else {
		document.getElementById("errorcost").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
	if(document.getElementById("labathome1").checked==false && document.getElementById("labathome").checked==false)
		{
		document.getElementById("errorhome").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Select any one of the above options";
		count++;
		}
	else {
		
	}
	
		
	
	if (count > 0) {
		return false;
	}
}
function removeErrorquery() {
	document.getElementById("errorName").innerHTML = " ";

}
function removeErrorquery1() {

	document.getElementById("errordesc").innerHTML = " ";

}
function removeErrorquery2() {

	document.getElementById("errortime").innerHTML = " ";
}
function removeErrorquery3() {
	document.getElementById("errorcost").innerHTML = " ";

}
function removeErrorquery4() {
	document.getElementById("errorhome").innerHTML = " ";

}



function resetQuery() {
	document.getElementById("errorName").innerHTML = " ";
	document.getElementById("errordesc").innerHTML = " ";
	document.getElementById("errortime").innerHTML = " ";
	document.getElementById("errorcost").innerHTML = " ";
	document.getElementById("errorhome").innerHTML = " ";

}