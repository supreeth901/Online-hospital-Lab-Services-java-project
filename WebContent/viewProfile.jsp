<%@page import="Model.LabServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;User&nbsp;Profile&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

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
<% 	LabServiceProvider lbobj =(LabServiceProvider)request.getAttribute("lab");%>
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
		

	<section class="container img-responsive"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/dash_board.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-8 col-md-offset-2 login_form_div">
					<!-- View Profile -->
					<div class="row">
						<div class="col-md-12 toppad">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title text-center">
										<i class="glyphicon glyphicon-list-alt"></i>&nbsp; <%=lbobj.getLabID()%> Profile
									</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class=" col-md-12">
											<table class="table table-user-information table-responsive">
												<tbody>
								
							
													<tr>
														<td><strong>Lab Name</strong></td>
														<td> <%=lbobj.getLabName()%></td>
													</tr>
													
													<tr>
														<td><strong>Address</strong></td>
														<td> <%=lbobj.getAddress()%></td>
													</tr>
													<tr>
														<td><strong>Zip Code</strong></td>
														<td> <%=lbobj.getZip()%></td>
													</tr>
													<tr>
														<td><strong>City</strong></td>
														<td> <%=lbobj.getCity()%></td>
													</tr>

													<tr>
													<tr>
														<td><strong>State</strong></td>
														<td> <%=lbobj.getState()%></td>
													</tr>
													<tr>
														<td><strong>Contact Number</strong></td>
														<td> <%=lbobj.getContactNo()%></td>
													</tr>
													<tr>
														<td><strong>Alternate Contact Number</strong></td>
														<td> <%=lbobj.getAlter_ContactNo()%></td>
													</tr>
													<tr>
														<td><strong>Email</strong></td>
														<td> <%=lbobj.getEmail()%></td>
													</tr>
													
													<tr>
														<td><strong>Category</strong></td>
														<td> <%=lbobj.getCategory() %></td>
													</tr>
												</tbody>
											</table>
										
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<a href="LSPOption.jsp" type="button"
										class="btn btn-md btn-primary"><i
										class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
										DashBoard</a> <span class="pull-right"> <a
										href="EditProfile.jsp" type="button"
										class="btn btn-md btn-warning"><i
											class="glyphicon glyphicon-edit"></i>&nbsp;Edit LSP Details</a>
									</span>
								</div>
							</div>
						</div>
					</div>


					<!-- View Profile Ends-->
				</div>
			</div>
		</div>
		<div data-spy="affix" class="right_affix">
			<a href="LSPOption.jsp"> <span><b>&nbsp;Go
						&nbsp;&nbsp;Back </b></span>

			</a>
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