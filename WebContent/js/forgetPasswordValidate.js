function validateForgetPass() {
	var labId = document.getElementById("userId").value.trim();

	var intfilter = /^([0-9])+$/;

	if (!intfilter.test(labId)) {
		document.getElementById("errorId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Lab Id Should have digits";
		return false;
	}

	if (labId.length != 4) {
		document.getElementById("errorId").innerHTML = "<img src='image/warning.png' width='18px' height='18px'/> Lab Id must contain 4 digits";
		return false;
	}

	return true;
}
function removeError() {
	document.getElementById("errorId").innerHTML = " ";
}

function resetError() {
	document.getElementById("errorId").innerHTML = " ";
}