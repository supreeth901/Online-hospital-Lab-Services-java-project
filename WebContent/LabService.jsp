<%@page import="Model.LabServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript" src="js/LabService.js"></script>
<link rel="icon" href="image/colab-logo.png">

<style type="text/css">
.glyphicon.glyphicon-asterisk {
	color: red;
	font-size: 10px;
}
</style>

</head>

<body id="body">
	<%
		HttpSession session1 = request.getSession(false);
		LabServiceProvider lbobj = (LabServiceProvider) session
				.getAttribute("LspObj");
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
						<li><a href="LSPOption.jsp"><i
								class="glyphicon glyphicon-home" aria-hidden="true"></i>&nbsp;
								Home</a></li>
						<li><a href="Faq.jsp"> <i
								class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>&nbsp;
								F.A.Qs
						</a></li>
						<li><a href="AboutUs.jsp"><i
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>&nbsp;
								About us</a></li>
						<li><a href="ContactUs.jsp"><i
								class="glyphicon glyphicon-earphone" aria-hidden="true"></i>&nbsp;
								Contact us</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right"
						style="font-weight: bolder;">
						<li><a href="LSPOption.jsp"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
								Welcome <%=lbobj.getLabID()%></a></li>
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

					<h3>Add | Lab Service</h3>
					<div class="separator"></div>
					<form action="LabServicesController" method="post"
						accept-charset="utf-8" onsubmit="return validate_LabService()"
						onreset="return resetQuery()">
						<div class='form-horizontal'>
							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Test
									Name&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="name" name="name"
										value="" onfocus="removeErrorquery()" placeholder="Test Name">
									<span id="errorName"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3" for="postalAddress">Test
									Description&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-md-8">
									<textarea rows="3" class="form-control" id="desc" name="desc"
										onfocus="removeErrorquery1()" placeholder="Test Description"> </textarea>
									<span id="errordesc"></span>
								</div>
							</div>
							<!--  Drop Down Menu -->

							<div class="form-group">
								<label for="contact_no" class="col-md-3 control-label">Test
									Duration&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="duration"
										onfocus="removeErrorquery2()" name="duration" value=""
										placeholder="Test Duration in minutes"> <span
										id="errortime"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="contact_no_alt" class="col-md-3 control-label">Cost
									of the Test&nbsp;<span class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="cost" name="cost"
										onfocus="removeErrorquery3()" value=""
										placeholder="Cost of Test"> <span id="errorcost"></span>
								</div>
							</div>


							<!--  Input type = checkbox -->

							<div class="form-group">
								<label class="control-label col-md-3">Lab@Home </label>&nbsp;
								<div class="col-md-2">
									<label class="radio-inline"> <input type="radio"
										name="labathome" onfocus="removeErrorquery4()" id="labathome1"
										value="yes"> Yes
									</label>
								</div>
								<div class="col-md-2">
									<label class="radio-inline"> <input type="radio"
										name="labathome" onfocus="removeErrorquery4()" id="labathome"
										value="no"> No
									</label>
								</div>
								<span id="errorhome"></span>
							</div>

							<div class="form-group">
								<div class="col-md-12 col-md-offset-3">
									<a href="LSPOption.jsp" class="btn btn-primary submit_btn">
										<span class="glyphicon glyphicon-home"></span>&nbsp; Back to
										DashBoard
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn btn-primary submit_btn"
										name="add" value="add">
										<span class="glyphicon glyphicon-saved"></span>&nbsp; Submit
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<button type="reset" class="btn btn-primary submit_btn">
										<span class="glyphicon glyphicon-refresh"></span>&nbsp; Reset
									</button>
								</div>
							</div>
						</div>
					</form>
					<span class="glyphicon glyphicon-asterisk"></span> <span
						style="font-size: 15px; color: red;">&nbsp; fields are
						mandatory.</span> <br> <br>
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






















