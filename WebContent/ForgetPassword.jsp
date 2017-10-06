<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String s = "abc";
%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;Forget&nbsp;Password&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

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
<script type="text/javascript" src="js/forgetPasswordValidate.js"></script>
<!--  script File -->

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


					</ul>

				</div>
			</div>
		</div>
	</header>


	<!-- Login form -->

	<section class="container"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/register_Success.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-md-6 col-md-offset-3 login_form_div">

						<h3 class="text-info text-left">Forget Password | LSP</h3>
						<div class="separator"></div>
						<h5 class="text-danger text-center">
							<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;Please
							Provide Following Information for Login Password
						</h5>
						<form action="LSPController" method="post" accept-charset="utf-8"
							onsubmit="return validateForgetPass()" onreset="resetError()">
							<input type="hidden" name="action" value="forgot">
							<div class="form-group">
								<label for="lab_name" class="col-md-4 control-label"><i
									class="glyphicon glyphicon-user"></i>&nbsp;Lab Id</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="userId" name="id"
										onfocus="removeError()" placeholder="Please enter you Lab ID"
										required><span id="errorId" style="color: red"></span>
									<!--   Span for Error    -->

								</div>

							</div>


							<br> <br>
							<div class="form-group">
								<div class="col-md-12 col-md-offset-1"><br>
									<a href="LoginPage.jsp" class="btn btn-primary"> <span
										class="glyphicon glyphicon-home"></span> Go Back to Login
									</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn btn-primary submit_btn">
										<span class="glyphicon glyphicon-ok"></span>&nbsp; Submit
									</button>
								</div>
							</div>

							<%
								if (request.getAttribute("fail") != null) {
							%>
							<span style="color: red">invalid lab Id</span>
							<%
								}
							%>
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