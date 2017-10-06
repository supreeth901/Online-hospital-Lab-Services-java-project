<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;Register&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<link href='https://fonts.googleapis.com/css?family=PT+Sans|Roboto+Slab'
	rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custome.js"></script>
<script src="js/zip.js"></script>
<link rel="icon" href="image/colab-logo.png">
<script src="js/Validation.js" type="text/javascript"></script>

<style type="text/css">
.glyphicon.glyphicon-asterisk {
	color: red;
	font-size: 10px;
}
</style>

</head>

<body id="body">

	<!-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  Header section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

	<header class="container">
		<div class="row">
			<div class="col-md-12" id="header">
				<div class="row">
					<div class="col-md-2 img-responsive" id="logo"
						style="margin-left: 1%; margin-top: 1%;">
						<img src="image/colab-logo.png" alt="CoLab" width="200"
							height="100"></img>
					</div>
					<div class="col-md-9" id="title" style="margin-left: 2%">
						<div class="row">
							<div class="col-md-12">
								<h2 style="font-weight: bolder; text-align: center;">Online
									Lab Management System</h2>
							</div>
							<div class="col-md-12" style="text-align: center;">
								<h5>by</h5>
							</div>
							<div class="col-md-12 link" style="text-align: center;">
								<h4>
									<a href="#" target="_blank">Lab Services Corporation
										Private Limited</a>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--   -=-=-=-=-=-=-=-=-=-=-=-=-=-  navigation Bar   -=-=-=-=-=-=-=-=-=-=-=-=-   -->
		<div class="row">
			<div class="col-md-12 navbar navbar-custom" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-inverse-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse navbar-inverse-collapse">
					<ul class="nav navbar-nav navbar-main-menu"
						style="color: blue; font-weight: bolder;">
						<li><a href="#"><i class="glyphicon glyphicon-home"
								aria-hidden="true"></i>&nbsp; Home</a></li>
						<li><a href="#"> <i
								class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>&nbsp;
								F.A.Qs
						</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-info-sign"
								aria-hidden="true"></i>&nbsp; About us</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-earphone"
								aria-hidden="true"></i>&nbsp; Contact us</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right"
						style="font-weight: bolder;">

						<li><a href="#"><span class="glyphicon glyphicon-log-in"
								aria-hidden="true"></span>&nbsp; Admin Login</a></li>
					</ul>

				</div>
			</div>
		</div>
	</header>


	<!-- Login form -->

	<section class="container"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/img3.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-md-8 col-md-offset-2 login_form_div_register">

						<h3>Register | Lab Service Provider</h3>
						<div class="separator"></div>
						<br> <span class="col-md-offset-3 glyphicon glyphicon-asterisk"></span> <span
							style="font-size: 15px; color: red;">&nbsp; fields are
							mandatory.</span> <br><br>
						<form action="LSPController" method="post"
							onreset="return resetQuery()" accept-charset="utf-8"
							onSubmit="return validate_register()">
							<input type="hidden" name="action" value="register">
							<div class='form-horizontal'>
								<div class="form-group">
									<label for="lab_name" class="col-md-3 control-label">Lab
										Name&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
									</label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery()" type="text"
											class="form-control" id="lab_name" name="lab_name" value=""
											placeholder="Lab Name"><span id="ln"
											style="color: red"></span>
									</div>
								</div>
								<input type="hidden" name="action" value="register">
								<div class="form-group">
									<label class="control-label col-md-3" for="postalAddress">Address&nbsp;<span
										class="glyphicon glyphicon-asterisk"></span></label>
									<div class="col-md-8">
										<textarea onfocus="removeErrorquery1()" rows="3"
											class="form-control" name="postal_address" id="address"
											placeholder="Postal Address"></textarea>
										<span id="la" style="color: red"></span>
									</div>
								</div>

								<div class="form-group">
									<label for="zip_code" class="col-md-3 control-label">Zip
										Code&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
									</label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery2()" type="text"
											class="form-control" id="user_zip"
											onkeyup="populateFields(parseInt(this.value, 10));"
											name="zip_code" value="" placeholder="Zip Code"><span
											id="zc" style="color: red"></span>
									</div>
								</div>

								<div class="form-group">
									<label for="city" class="col-md-3 control-label">City&nbsp;<span
										class="glyphicon glyphicon-asterisk"></span></label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery3()" type="text"
											class="form-control" id="city" name="city" onkeyup=""
											value="" placeholder="City"><span id="c"
											style="color: red"></span>
									</div>
								</div>
								<!--  Drop Down Menu -->

								<div class="form-group">
									<label for="state" class="col-md-3 control-label">state&nbsp;<span
										class="glyphicon glyphicon-asterisk"></span></label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery4()" type="text"
											class="form-control" id="state" name="state" onkeyup=""
											value="" placeholder="state"><span id="s"
											style="color: red"></span>
									</div>
								</div>

								<div class="form-group">
									<label for="contact_no" class="col-md-3 control-label">Contact
										Number&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
									</label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery5()" type="text"
											class="form-control" id="user_phone" name="contact_no"
											value="" placeholder="Contact Number"><span id="ph"
											style="color: red"></span>

									</div>
								</div>
								<div class="form-group">
									<label for="contact_no_alt" class="col-md-3 control-label">Alternate
										Contact&nbsp; </label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery6()" type="text"
											class="form-control" id="user_phone_alt"
											name="contact_no_alt" placeholder="Alternate Contact Number"><span
											id="pha" style="color: red"></span>
									</div>
								</div>

								<div class="form-group">
									<label for="email" class="col-md-3 control-label">E-mail&nbsp;<span
										class="glyphicon glyphicon-asterisk"></span></label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery7()" type="email"
											class="form-control" id="user_email" name="email" value=""
											placeholder="Email:abc@xyz.com"><span id="em"
											style="color: red"></span>

									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Security Question</label>
									<div class="col-md-8">
										<select name="question" class="form-control" id="question">
											<option value="What is your favourite sport?">What
												is your favourite sport?</option>
											<option value="What is your vehicle number?">What is
												your vehicle number?</option>
											<option value="What is your favourite teacher's name?">What
												is your favourite teacher's name?</option>
											<option value="Name your best friend">Name your best
												friend</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="city" class="col-md-3 control-label">Answer&nbsp;<span
										class="glyphicon glyphicon-asterisk"></span></label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="answer"
											name="answer" value="" onfocus="removeErrorquery8()"
											placeholder="Please fill your answer">
									</div>
								</div>
								<!--  Input type = checkbox -->

								<div class="form-group">
									<label class="col-md-3 control-label">Category</label>
									<div class="col-md-2">
										<label> <input type="radio" name="category"
											id="category" value="special" onfocus="removeErrorquery9()">Speciality
										</label>
									</div>
									<div class="col-md-2">
										<label> <input name="category" type="radio"
											id="category1" value="normal" checked="checked"
											onfocus="removeErrorquery9()">Normal
										</label>
									</div>
								</div>

								<div class="form-group">

									<div class="col-sm-offset-3">
										<a href="LoginPage.jsp" type="button"
											class="btn btn-md btn-primary"><i
											class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
											Login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary submit_btn">
											<span class="glyphicon glyphicon-pencil"></span>&nbsp;
											Register
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="reset" class="btn btn-primary submit_btn">
											<span class="glyphicon glyphicon-refresh"></span>&nbsp; Reset
										</button>
									</div>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  footer section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

	<footer class="container">
		<div class="row">
			<div class="col-md-12"
				style="margin-bottom: 0.5%; height: 80px; background-color: #0F204B; border-top: 1px solid RGB(0, 76, 102);">
				<p style="color: white; text-align: center; margin-top: 2.8%;">

					&#169; Copyright 2015, Lab Service Corporation Pvt Ltd, Trivandrum
					- All Rights Reserved. <span class="pull-right"><a href="#"
						id="team" style="color: white;">Site Development Team</a></span>
				</p>
			</div>
		</div>
	</footer>


	<!-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  footer section Ends =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

	<script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>