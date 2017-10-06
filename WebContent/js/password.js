function validate_password() {
	var pwd=document.getElementById("new_pass").value.trim();
	var pwd1=document.getElementById("conf_pass").value.trim();
	if(!pwd.match(pwd1))
	{
	document.getElementById("pw").innerHTML="<img src='image/warning.png' width='18px' height='18px'/> Make sure both passwords are same ";
	 return false;
	}
return true;
}
