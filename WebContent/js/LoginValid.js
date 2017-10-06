function login_validate() {
	var labId = document.getElementById("userId").value.trim();
	var intfilter = /^([0-9])+$/;
	if (labId == "" || labId == null || labId == " ") {
		document.getElementById("lab").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Invalid Lab Id";
		return false;
	}
	if (!intfilter.test(labId)) {
		document.getElementById("lab").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Lab Id contains only digits";
		return false;
	}
	if (labId.length != 4) {
		document.getElementById("lab").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/>Lab Id must have four digits";
		return false;
	}
	return true;
}

function removeErrorquery() {
	document.getElementById("lab").innerHTML = " ";

}