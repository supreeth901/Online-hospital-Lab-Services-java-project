<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.LabServices"%>
<%@ page import="Model.LabServiceProvider"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>


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


<script type="text/javascript">
	$(document).ready(function() {

		$('#select_alert').on('change', function() {

			var testcode = $('#code').val();
			var date = $('#select_alert option:selected').val();
			$.ajax({
				type : "POST",
				url : "LabScheduleController",
				data : {
					'name' : "add",
					'schdate' : date,
					'code' : testcode
				},
				success : function(data) {

					$('#slot').empty();
					var dates = data.split("\n");
					for ( var i = 0; i < dates.length; i++)
						$('#slot').append('<option>' + dates[i] + '</option>');

				}
			});
		});

	});
</script>

</head>

<body id="body">
	<%
		HttpSession session1 = request.getSession(false);
		LabServiceProvider lbobj = (LabServiceProvider) session
				.getAttribute("LspObj");
		String testcode = (String) request.getAttribute("testcode");
		String testname = (String) request.getAttribute("testname");
		ArrayList<String> list1 = (ArrayList<String>) request
				.getAttribute("slots");

		ArrayList<String> listdate = new ArrayList<String>();
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String strDate = sdfDate.format(now.getTime());
		for (int i = 1; i <= 7; i++) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, i);
			String formatted = sdfDate.format(cal.getTime());
			listdate.add(formatted);
		}
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
						<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
							Welcome <%=lbobj.getLabID()%></li>
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

					<h3>Add Lab Schedulee</h3>
					<div class="separator"></div>
					<form action="LabScheduleController" method="post"
						onSubmit="check()" accept-charset="utf-8">
						<div class='form-horizontal'>
							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Test
									code</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="code" name="code"
										value="<%=testcode%>" readonly>
								</div>
							</div>
							<input type="hidden" name="name" value="view1">
							<div class="form-group">
								<label for="city" class="col-md-3 control-label">Test
									name</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="testname"
										name="testname" value="<%=testname%>" readonly>
								</div>
							</div>
							<!--  Drop Down Menu -->
							<div class="form-group">
								<label class="control-label col-md-3">date</label>
								<div class="col-md-8">
									<select class="form-control" name="select_alert"
										id="select_alert">
										<%
											for (String str1 : listdate) {
										%>
										<option value="<%=str1%>"><%=str1%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>



							<div class="form-group">
								<label class="control-label col-md-3">Slots Available</label>
								<div class="col-md-8">
									<select class="form-control" name="slot" id="slot">

									</select>
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-offset-5">
									<button type="submit" class="btn btn-primary submit_btn"
										name="add" value="add">
										<span class="glyphicon glyphicon-plus"></span>&nbsp; Add
										Schedule
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;

									
								</div>
								<div class="panel-footer">
											<a href="LSPOption.jsp" type="button"
												class="btn btn-md btn-primary"><i
												class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
												DashBoard</a>
										</div>
							</div>
						</div>
					</form>
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