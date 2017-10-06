<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;F.A.Q&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=PT+Sans|Roboto+Slab'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
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
				<div class="navbar-header ">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigationbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse" id="navigationbar">
					<ul class="nav navbar-nav navbar-main-menu "
						style="color: blue; font-weight: bolder;">
						<li><a href="#"><i class="glyphicon glyphicon-home"
								aria-hidden="true"></i>&nbsp; Home</a></li>
						<li><a href="#"> <i
								class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>&nbsp;
								F.A.Qs
						</a></li>
						<li><a href="faq.jsp"><i
								class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>&nbsp;
								About us</a></li>
						<li><a href="contactUs.jsp"><i
								class="glyphicon glyphicon-earphone" aria-hidden="true"></i>&nbsp;
								Contact us</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right"
						style="font-weight: bolder;">
						<li class="dropdown"><a href="LSPOption.jsp"
							data-toggle="dropdown" class="dropdown-toggle"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
								Welcome 1004110</a>
							<ul class="dropdown-menu">
								<li><a href="viewProfile.jsp"><span
										class="glyphicon  glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;View
										Profile</a></li>
								<!-- Edit profile Page -->
								<li><a href="EditProfile.jsp"><span
										class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;&nbsp;Edit
										Profile</a></li>
								<li><a href="#" data-toggle="modal" data-target="#myModal"><span
										class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;Change
										Password</a></li>
							</ul></li>

						<li><a href="LoginPage.jsp"><span
								class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;
								LogOut</a></li>
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
					<h4 class="modal-title text-success text-center" id="myModalLabel">
						<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;Change
						Password
					</h4>
				</div>
				<form method="post" action="" accept-charset="utf-8">
					<div class="modal-body">

						<div class="form-group">
							<label for="old_pass" class="col-md-4 control-label">Old
								Password</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="old_pass"
									name="old_pass" value="" placeholder="Old Password" required>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label for="new_pass" class="col-md-4 control-label">New
								Password</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="old_pass"
									name="new_pass" value="" placeholder="New Password" required>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label for="conf_pass" class="col-md-4 control-label">Confirm
								New Password</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="conf_pass"
									name="conf_pass" value="" placeholder="Confirm Password"
									required>
							</div>
						</div>
						<br> <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Change
							Password</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--=-=-=-=-=-=-=--=-=-=-=0-=-=-= Modal Code Ends -=-=-=-=-=-=-=-=-=-==--=0=0-=0=-=-=-=-=-=-->

	<!-- Login form -->

	<section class="container img-responsive"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/dash_board.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span style="color: white;">Frequently Asked Questions |
						CoLab</span>
				</h3>
				<div class="separator"></div>
				<div class="col-md-10 col-md-offset-1">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">1) I feel healthy, so why should I
								get tested?</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">A serious medical condition such as
								heart disease, prostate cancer or diabetes can exist without
								noticeable symptoms for up to two years. Early detection is your
								best defense. A simple blood test can increase your chances of
								identifying potential medical conditions, and establish a
								baseline of your normal ranges from which future tests can be
								monitored</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">2) Is this covered by insurance?</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">We can provide you with CPT codes
								so that you may file for reimbursement yourself. DLS cannot
								guarantee that your claim will be reimbursed. Contact your
								insurance provider for your benefits and reimbursement options.</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">3) What is the testing procedure?</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">When you go to the lab to have your
								blood drawn, only take our requisition and your photo ID with
								you. If you bring a requisition to the lab OTHER than the one
								provided by DLS, you will receive a bill from the lab for which
								you will be responsible, even if our requisition is meant to
								replace that one. Bring NO other requisition besides ours. If
								you go to another lab that is not included in our list of
								patient service centers, you will also be responsible for the
								bill from that lab.</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">4) What should I do if I can not find
								the test I am looking for?</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">If there is a test you are
								interested in but cannot find on the website, please call us at
								(800) 908-0000 and we will be happy to discuss the availability
								of the test.</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">5) Do I need an appointment?</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">An appointment is usually not
								required at most Patient Service Centers. We encourage our
								customers to call the lab location they choose to confirm their
								hours of operation and that an appointment is not required.</div>
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