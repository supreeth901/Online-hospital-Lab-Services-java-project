<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ page import="Model.LabServiceProvider" %>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;Admin DashBoard&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=PT+Sans|Roboto+Slab'
	rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/password.js"></script>
<script src="js/custom.js"></script>
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
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
								Welcome Admin</a>
							</li>

						<li><a href="LoginPage.jsp"><span
								class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;
								LogOut</a></li>
					</ul>

				</div>
			</div>
		</div>
	</header>

	
	<!--=-=-=-=-=-=-=--=-=-=-=0-=-=-= Modal Code Ends -=-=-=-=-=-=-=-=-=-==--=0=0-=0=-=-=-=-=-=-->

	<!-- Login form -->

	<section class="container img-responsive"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/dash_board.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span style="color: white;">Admin | DashBoard</span>
				</h3>
				<div class="separator"></div>

				<div class="bs-glyphicons">
					<ul class="bs-glyphicons-list link_black">

						<li><a href="LabService.jsp"><span
								class="glyphicon glyphicon-plus" aria-hidden="true"></span> <span
								class="glyphicon-class"><span style="font-size: 20px;">Create
										Lab Service</span></span></a></li>
						<li><a href="LabServicesController?add=view"><span
								class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								<span class="glyphicon-class"><span
									style="font-size: 20px;">View Lab Service</span></span></a></li>
						<li><a href="UpdateService.jsp"><span
								class="glyphicon glyphicon-wrench" aria-hidden="true"></span> <span
								class="glyphicon-class"><span style="font-size: 20px;">Update
										Lab Service</span></span></a></li>
										
						<li><a href="LabServicesController?add=delete"><span
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
								<span class="glyphicon-class"><span
									style="font-size: 20px;">Delete Lab Services</span></span></a></li>
									
						
						<li><a href="searchPage.jsp"><span
								class="glyphicon glyphicon-search" aria-hidden="true"></span> <span
								class="glyphicon-class"><span style="font-size: 20px;">Search Lab Services
										</span></span></a></li>
									
									<li><a href="LabServicesController?add=view1"><span
								class="glyphicon glyphicon-plus" aria-hidden="true"></span> <span
								class="glyphicon-class"><span style="font-size: 20px;">Create
										lab Schedule</span></span></a></li>
										
						<li><a href="ViewSchedule.jsp"><span
								class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								<span class="glyphicon-class"><span
									style="font-size: 20px;">View Lab Schedule</span></span></a></li>
									
									<li><a href="RegisterPageAdmin.jsp"><span
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
								<span class="glyphicon-class"><span
									style="font-size: 20px;">Create LSP</span></span></a></li>
									
									<li><a href="LSPController?action=viewadmin"><span
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
								<span class="glyphicon-class"><span
									style="font-size: 20px;">View LSP</span></span></a></li>

					</ul>
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