function validate_register()
	{
	var name = document.getElementById("lab_name").value.trim();
	var address = document.getElementById("address").value.trim();
	var zip = document.getElementById("user_zip").value.trim();
	var city = document.getElementById("city").value.trim();
	var state = document.getElementById("state").value.trim();
	var phone = document.getElementById("user_phone").value.trim();
	var phonealt = document.getElementById("user_phone_alt").value.trim();
	var email = document.getElementById("user_email").value.trim();
	var answer = document.getElementById("answer").value.trim();
	var filter = /^[a-zA-Z ]*$/;
	var intfilter = /^([0-9])+$/;
	var phoneno = /^[7-9]{1}[0-9]{9}$/;
	var emailfilter = /\S+@\S+\.\S+/;
	var count = 0;

	if (name == null || name == "" || name.length == 0) {
		document.getElementById("ln").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter Lab name";
		return false;
	}
	else if (name.length > 30) {
		document.getElementById("ln").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Lab Name should not be greater than 30";
		count++;
		return false;
	} 
	else if (!filter.test(name)) {
		document.getElementById("ln").innerHTML = "<i class='fa fa-ban fa-stack-2x' style='color: red;'></i>Invalid Lab Name ";
		count++;
		return false;
	} 
	else {
		document.getElementById("ln").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}

	if (address == null || address == "" || address.length == 0) {
		document.getElementById("la").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter Lab Address";
		count++;
		return false;
	}
	else if (address.length < 10) {
		document.getElementById("la").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Invalid Lab Address minimum 10 characters";
		count++;
		return false;
	} else {
		document.getElementById("la").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
		
	if (!intfilter.test(zip)) {
		document.getElementById("zc").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Zip Code contains only numbers";
		count++;
		return false;
	} else if (zip.length != 6) {
		document.getElementById("zc").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Zip Code should contain 6 numbers";
		count++;
		return false;
	} 
	else if(isNaN(zip))
		{
		document.getElementById("zc").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Zip Code should contain only numbers";
		count++;
		return false;
		}
	else {
		document.getElementById("zc").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
		}
		
	if (city == null || city == "" || city.length == 0) {
		document.getElementById("c").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter City Name";
		count++;
		return false;
	}	
	else if (!filter.test(city)) {
		document.getElementById("c").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>City Name cannot be in numbers";
		count++;
		return false;
	} else {
		document.getElementById("c").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
	if (state == null || state == "" || state.length == 0) {
		document.getElementById("s").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter State Name";
		count++;
		return false;
	}
	else if (!filter.test(state)) {
		document.getElementById("s").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>State Name cannot be in numbers";
		count++;
		return false;
	} else {
		document.getElementById("s").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
	}
	
	if(phone == null || phone == "" || phone.length == 0) {
		document.getElementById("ph").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter your Contact Number";
		count++;
		return false;
	}
	else if (isNaN(phone) || phone.indexOf(" ") != -1) {
		document.getElementById("ph").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter valid contact number";
		count++;
		return false;
	} else if (phone.length != 10) {
		document.getElementById("ph").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter 10 digit contact number";
		count++;
		return false;
	} else if (!(phoneno.test(phone))) {
		document.getElementById("ph").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Enter 10 digit Contact No. starting with 7/8/9";
		count++;
		return false;
	} else {
		document.getElementById("ph").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
		;
	}
	if(phonealt.length>0)
	{			
		if (isNaN(phonealt) || phonealt.indexOf(" ") != -1) {
		document.getElementById("pha").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter valid contact number";
		count++;
		return false;
	} else if (phonealt.length != 10) {
		document.getElementById("pha").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter 10 digit contact number";
		count++;
		return false;
	} else if (!(phoneno.test(phonealt))) {
		document.getElementById("pha").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Enter 10 digit Contact No starting with 7/8/9";
		count++;
		return false;
	} 
	}
	else {
		document.getElementById("pha").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
		
	}
	if(email == null || email == "" || email.length == 0) {
		document.getElementById("em").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter email address";
		count++;
		return false;
	}
	else if (!(emailfilter.test(email))) {
		document.getElementById("em").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Email ID is not Valid according to the format ";
		count++;
		return false;
	} else {
		document.getElementById("em").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
		
	}
	if(answer == null || answer == "" || answer.length == 0) {
		document.getElementById("em").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Enter email address";
		count++;
		return false;
	} else
		{
		document.getElementById("em").innerHTML = "<img src='image/right.png' width='18px' height='18px'/> ";
		}
	if(document.getElementById("category1").checked==false && document.getElementById("category").checked==false)
	{
	document.getElementById("cat").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Select any one of the above options";
	count++;
	return false;
	}
else {
	
}
	
	if (count>0)
		return false;
	else;
		return true;
		}

function removeErrorquery() {
	document.getElementById("ln").innerHTML = " ";

}
function removeErrorquery1() {

	document.getElementById("la").innerHTML = " ";

}
function removeErrorquery2() {

	document.getElementById("zc").innerHTML = " ";
}
function removeErrorquery3() {
	document.getElementById("c").innerHTML = " ";

}
function removeErrorquery4() {

	document.getElementById("s").innerHTML = " ";

}
function removeErrorquery5() {

	document.getElementById("ph").innerHTML = " ";

}
function removeErrorquery6() {

	document.getElementById("pha").innerHTML = " ";

}
function removeErrorquery7() {

	document.getElementById("em").innerHTML = " ";

}
function removeErrorquery8() {

	document.getElementById("answer").innerHTML = " ";

}
function removeErrorquery9() {

	document.getElementById("cat").innerHTML = " ";

}
function resetQuery() {
	document.getElementById("ln").innerHTML = " ";
	document.getElementById("la").innerHTML = " ";
	document.getElementById("zc").innerHTML = " ";
	document.getElementById("c").innerHTML = " ";
	document.getElementById("s").innerHTML = " ";
	document.getElementById("ph").innerHTML = " ";
	document.getElementById("pha").innerHTML = " ";
	document.getElementById("em").innerHTML = " ";
	document.getElementById("answer").innerHTML = " ";
	document.getElementById("cat").innerHTML = " ";

}