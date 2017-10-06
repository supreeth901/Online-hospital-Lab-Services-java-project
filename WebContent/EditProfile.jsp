<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.LabServiceProvider"%>
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
<link rel="icon" href="image/colab-logo.png">

</head>

<body id="body">
	<%
		HttpSession session1 = request.getSession(false);
		LabServiceProvider lbobj = (LabServiceProvider)session.getAttribute("LspObj");
	%>
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
						<li><a href="LSPOption.jsp"><i class="glyphicon glyphicon-home"
								aria-hidden="true"></i>&nbsp; Home</a></li>
						<li><a href="Faq.jsp"> <i
								class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>&nbsp;
								F.A.Qs
						</a></li>
						<li><a href="AboutUs.jsp"><i class="glyphicon glyphicon-info-sign"
								aria-hidden="true"></i>&nbsp; About us</a></li>
						<li><a href="ContactUs.jsp"><i class="glyphicon glyphicon-earphone"
								aria-hidden="true"></i>&nbsp; Contact us</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right"
						style="font-weight: bolder;">
						<li><a href="LSPOption.jsp"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
								Welcome  <%=lbobj.getLabID()%></a></li>
						<li><a href="LoginPage.jsp"><span
								class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;
								LogOut</a></li>

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

						<h3>Update | Profile</h3>
						<div class="separator"></div>
						<form action="LSPController" method="post" accept-charset="utf-8">
							<div class='form-horizontal'>
								<div class="form-group">
									<label for="lab_name" class="col-md-3 control-label">Lab
										Name</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="lab_name"
											name="lab_name" value="<%=lbobj.getLabName()%>"
											placeholder="Lab Name" required>
									</div>
								</div>
								<input type="hidden" value="updateprofile" name="action">
								<div class="form-group">
									<label class="control-label col-md-3" for="postalAddress">Address:</label>
									<div class="col-md-8">
										<textarea rows="3" class="form-control" id="postalAddress"
											name="postal_address" placeholder="Postal Address" value=""><%=lbobj.getAddress()%></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="zip_code" class="col-md-3 control-label">Zip
										Code</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="user_pin"
											name="zip_code" value="<%=lbobj.getZip()%>"
											placeholder="Zip Code" required>
									</div>
								</div>

								<div class="form-group">
									<label for="city" class="col-md-3 control-label">City</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="city" name="city"
											value="<%=lbobj.getCity()%>" placeholder="City" required>
									</div>
								</div>

								<div class="form-group">
									<label for="state" class="col-md-3 control-label">state</label>
									<div class="col-md-8">
										<input onfocus="removeErrorquery4()" type="text"
											class="form-control" id="state" name="state"
											value="<%=lbobj.getState()%>" placeholder="state" required><span
											id="s" style="color: red"></span>
									</div>
								</div>

								<div class="form-group">
									<label for="contact_no" class="col-md-3 control-label">Contact
										Number</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="user_phone"
											name="contact_no" value="<%=lbobj.getContactNo()%>"
											placeholder="Contact Number" required>
									</div>
								</div>
								<div class="form-group">
									<label for="contact_no_alt" class="col-md-3 control-label">Alternate
										Contact</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="contact_no_alt"
											name="contact_no_alt" value="<%=lbobj.getAlter_ContactNo()%>"
											placeholder="Alternate Contact Number" required>
									</div>
								</div>

								<div class="form-group">
									<label for="email" class="col-md-3 control-label">E-mail</label>
									<div class="col-md-8">
										<input type="email" class="form-control" id="user_email"
											name="email" value="<%=lbobj.getEmail()%>"
											placeholder="E-mail ID" required>

									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Security Question</label>
									<div class="col-md-8">
										<select onfocus="removeErrorquery8()" name="question"
											class="form-control" id="question">
											<option value="sport">What is your favourite sport?</option>
											<option value="veh">What is your vehicle number?</option>
											<option value="teacher">What is your favourite
												teacher's name?</option>
											<option value="friend">Name your best friend</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="city" class="col-md-3 control-label">Answer</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="answer"
											name="answer" value="<%=lbobj.getSecurity_answer()%>"
											placeholder="Please fill your answer" required>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">Category</label>
									<div class="col-md-2">
										<label> <input type="radio" name="category"
											id="category" value="special">Speciality
										</label>
									</div>
									<div class="col-md-2">
										<label> <input name="category" type="radio"
											value="normal" checked="checked">Normal
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3">
										<a href="LSPOption.jsp" class="btn btn-primary"> <span
											class="glyphicon glyphicon-home"></span>Go Back to DashBoard
										</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary submit_btn">
											<span class="glyphicon glyphicon-pencil"></span>&nbsp;
											Update
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