<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.LabServiceProvider"%>
<%
	int i = 0;
%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;Login&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

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
<script src="js/admin.js"></script>
<script type="text/javascript" src="js/LoginValid.js"></script>
<link rel="icon" href="image/colab-logo.png">

</head>

<body id="body">

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
						<li><a href="LoginPage.jsp"><i
								class="glyphicon glyphicon-home" aria-hidden="true"></i>&nbsp;
								Home</a></li>
						<li><a href="faq.jsp"> <i
								class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>&nbsp;
								F.A.Qs
						</a></li>
						<li><a href="AboutUs.jsp"><i
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>&nbsp;
								About us</a></li>
						<li><a href="contactUs.jsp"><i
								class="glyphicon glyphicon-earphone" aria-hidden="true"></i>&nbsp;
								Contact us</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right"
						style="font-weight: bolder;">

						<li><a href="#" data-toggle="modal" data-target="#myModal"><span
								class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;
								Admin Login</a></li>

						

					</ul>

				</div>
			</div>
		</div>
	</header>

	<!--=-=-=-=-=-=-=--=-=-=-=0-=-=-= Modal Code -=-=-=-=-=-=-=-=-=-==--=0=0-=0=-=-=-=-=-=-->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-center" id="myModalLabel">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Admin
						Login
					</h4>
				</div>
				<form action="LSPController" method="post" accept-charset="utf-8" onSubmit="return validate()">
					<input type="hidden" name="action" value="loginadmin">
					<div class="modal-body">

						<div class="form-group">
							<label for="name" class="col-md-4 control-label"><i
								class="glyphicon glyphicon-user"></i> User Id</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="adminId"
									name="user_id" placeholder="Enter User Id"  onfocus="removeErrorquery()">
							</div>
							<br> <br>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-4 control-label"><i
								class="glyphicon glyphicon-lock"></i> Password</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="pass"
									name="pass" value="" placeholder="Password" onfocus="removeErrorquery()">
							</div>
						</div>


						<br> <br>
					</div>
					<div class="modal-footer"><span
										id="adminId"></span>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Login</button>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--=-=-=-=-=-=-=--=-=-=-=0-=-=-= Modal Code Ends -=-=-=-=-=-=-=-=-=-==--=0=0-=0=-=-=-=-=-=-->



	<!-- Login form -->

	<section class="container"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/login_img.jpg'); background-repeat: no-repeat;">
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-md-5 login_form_div">

						<h3>Login | Lab Service Provider</h3>
						<div class="separator"></div>
						<!--  	<div class="error hidden">
							<i class="fa fa-exclamation-triangle"></i> Invalid E-mail or
							Password
						</div>-->
						<br>

						<form action="LSPController" method="post" accept-charset="utf-8"
							onSubmit="return login_validate()">
							<div class="form-group">
								<label for="name"><i class="glyphicon glyphicon-user"></i>
									Lab Id</label> <input type="text" class="form-control" id="userId"
									name="id" placeholder="Lab Id" onfocus="removeErrorquery()"
									required><span id="lab" style="color: red"></span>
							</div>
							<div class="form-group">
								<label for="password"><i
									class="glyphicon glyphicon-lock"></i> Password</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="Password" required />
							</div>
							<input type="hidden" name="action" value="login">


							<button type="submit" class="btn btn-primary">Login</button>
							<%
								if (request.getAttribute("check") != null)
									i = (Integer) request.getAttribute("check");
								if (i > 0) {
							%>
							<p style="color: red">Invalid Username or Password</p>
							<%
								}
							%>
						</form>

						<div class="pull-right">
							<a href="ForgetPassword.jsp">Forget password</a>&nbsp; | &nbsp; <a
								href="RegisterPage.jsp">Not a Member yet, Signup Here</a>
						</div>
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