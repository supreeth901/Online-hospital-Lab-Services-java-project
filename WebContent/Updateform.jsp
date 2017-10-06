<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.LabServices"%>
<%@ page import="Model.LabServiceProvider"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;LabService&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<link href='https://fonts.googleapis.com/css?family=PT+Sans|Roboto+Slab'
	rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>

<link rel="icon" href="image/colab-logo.png">

</head>

<body id="body">
	<%
		HttpSession session1 = request.getSession(false);
		LabServiceProvider lbobj = (LabServiceProvider) session
				.getAttribute("LspObj");
		LabServices lbobj1 = (LabServices) request.getAttribute("lbserob");
	%>

	<!-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  Header section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

	<header class="container">
		<div class="row">
			<div class="col-md-12" id="header">
				<div class="row">
					<div class="col-md-2 img-responsive" id="logo"
						style="margin-left: 1%;">
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
									<a href="#" target="_blank">Lab Services Corporation Pvt
										Ltd</a>
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
						<li><a href="LSPOption.jsp"><span class="glyphicon glyphicon-user"
								aria-hidden="true"></span>&nbsp; Welcome <%=lbobj.getLabID()%> </a></li>
						<li><a href="LoginPage.jsp"><span
								class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;
								LogOut</a></li>

					</ul>

				</div>
			</div>
		</div>
	</header>


	<!-- Login form -->

	<section class="container img-responsive"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/dash_board.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-8 col-md-offset-2 login_form_div">

					<h3>Update | Lab Service</h3>
					<%
						if (lbobj1 != null) {
					%>
					<div class="separator"></div>
					<form action="LabServicesController" method="post"
						onSubmit="check()" accept-charset="utf-8">
						<div class='form-horizontal'>
							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Test
									Code</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="code" name="code"
										value="<%=lbobj1.getTestCode()%>" placeholder="Test code"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Test
									Name</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="city" name="city"
										value="<%=lbobj1.getTestName()%>" placeholder="Test Name"
										required>
								</div>
							</div>
							<!--  	<div class="form-group">
								<label for="zip_code" class="col-md-3 control-label">Test
									Code</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="user_pin"
										name="zip_code" value="" placeholder="Test Code" required>
								</div>
							</div>-->
							<div class="form-group">
								<label class="control-label col-md-3" for="postalAddress">Test
									Description:</label>
								<div class="col-md-8">
									<textarea rows="3" class="form-control" id="postalAddress"
										placeholder="Test Description" name="desc"><%=lbobj1.getTestDescription()%></textarea>

								</div>
							</div>
							<!--  Drop Down Menu -->
							<input type="hidden" value="updateform" name="add">
							<div class="form-group">
								<label for="contact_no" class="col-md-3 control-label">Test
									Duration </label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="user_phone"
										name="contact_no" value="<%=lbobj1.getTestDuration()%>"
										placeholder="Test Duration" required>
								</div>
							</div>
							<div class="form-group">
								<label for="contact_no_alt" class="col-md-3 control-label">Cost
									of the Test</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="contact_no_alt"
										name="contact_no_alt" value="<%=lbobj1.getTestCost()%>"
										placeholder="Cost of Test" required>
								</div>
							</div>


							<!--  Input type = checkbox -->

							<div class="form-group">
								<label class="control-label col-md-3">Lab@Home </label>
								<div class="col-md-2">
									<label class="radio-inline"> <input type="radio"
										name="labathome" value="yes" required> Yes
									</label>
								</div>
								<div class="col-md-2">
									<label class="radio-inline"> <input type="radio"
										name="labathome" value="no" required> No
									</label>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-3">

									<a href="LSPOption.jsp" type="button"
										class="btn btn-md btn-primary"><i
										class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
										DashBoard</a> &nbsp;&nbsp;&nbsp;&nbsp;

									<button type="submit" class="btn btn-primary submit_btn"
										name="update" value="Update">
										<span class="glyphicon glyphicon-plus"></span>&nbsp; Update

									</button>

								</div>
							</div>
						</div>
					</form>
					<%
						} else {
					%>
					<br>
					<h5 class="text-danger text-center">
						<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;Lab
						Services not Available
					</h5>
					<div class="col-sm-offset-3">
						<br> <br> <a href="LSPOption.jsp" type="button"
							class="btn btn-md btn-primary"><i
							class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
							DashBoard</a> &nbsp;&nbsp;&nbsp;&nbsp;


					</div>
				</div>
				<%
					}
				%>
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
</html>