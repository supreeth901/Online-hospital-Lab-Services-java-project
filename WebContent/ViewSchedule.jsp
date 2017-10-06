<%@page import="Model.LabSchedule"%>
<%@page import="Model.LabServices"%>
<%@page import="Model.LabServiceProvider"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;Search&nbsp;Test&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

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

<script type="text/javascript" src="tablefilter.js"></script>
</head>

<body id="body">
	<%
		HttpSession session1 = request.getSession(false);
		LabServiceProvider lbobj = (LabServiceProvider) session
				.getAttribute("LspObj");

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

	<section class="container"
		style="margin-top: -1.5%; border-top: 2px solid purple; padding: 1% 4% 3% 3%; background-image: url('image/dash_board.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<span style="color: white;">Search Lab Schedule</span>
				</h3>
				<div class="separator"></div>
				<div class="col-md-12" id="search-bar"
					style="margin-top: -1.5%; padding-top: 2%; padding-bottom: 2%;">
					<div class="row">
						<div class="col-md-12">
							<div class="row">

								<div class="col-md-10 col-md-offset-1"
									style="margin-bottom: 2%;">
									<div class="row">
										<form action="LabScheduleController" method="post"
											accept-charset="utf-8">
											<div class="col-md-9 col-md-offset-1">
												<div class="row">
													<div class="form-group">
														<label class="control-label col-md-2"
															style="font-size: 20px">Date</label>
														<div class="col-md-8">
															<select class="form-control" name="keyword"
																id="select_alert">

																<%
																	for (String str1 : listdate) {
																%>
																<option value="<%=str1%>"><%=str1%></option>
																<%}%>
															</select>
														</div>
													</div>
													<!--  <div class="col-md-6">
														<input type="text" class="form-control" name="title"
															placeholder="Search by Test Code">
													</div>-->
												</div>
											</div>
											<input type="hidden" name="name" value="viewschedule">
											<div class="col-md-2">
												<button type="submit" name="search" class="btn btn-primary">
													<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
													View
												</button>
											</div>

										</form>

									</div>
								</div>

								<div class="col-md-10 col-md-offset-1
								">
									<%
										if ((ArrayList<LabSchedule>) request.getAttribute("schdate") != null) {
											ArrayList<LabSchedule> list = (ArrayList<LabSchedule>) request
													.getAttribute("schdate");
									%>
									<div class="panel panel-primary">
										<!-- Default panel contents -->
										<div class="panel-heading text-center">Search Lab
											Schedule</div>
										<!-- Table -->
										<table
											class="table table-striped table-responsive table-hover text-center"
											id="example">
											<thead>

												<tr class="info">
													<th>Slot ID</th>
													<th>Start Time</th>
													<th>End Time</th>
													<th>Schedule Date</th>
													<th>Status</th>
													<th>Test Code</th>

												</tr>
											</thead>
											<tbody>

												<tr>
													<%
														for (LabSchedule lb : list) {
													%><td><%=lb.getSlotId()%></td>
													<td><%=lb.getStartTime()%></td>
													<td><%=lb.getEndTime()%></td>
													<td><%=lb.getSchedule_Date()%></td>
													<td><%=lb.getStatus()%></td>
													<td><%=lb.getTestCode()%></td>
													<td><a
														href="LabScheduleController?name=updateschedule&&testcode=<%=lb.getSlotId()%>">delete
															Schedule</a></td>

												</tr>
												<%
													}
												%>
												<%
													}
												%>
											</tbody>
										</table>
										<div class="panel-footer">
											<a href="LSPOption.jsp" type="button"
												class="btn btn-md btn-primary"><i
												class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
												DashBoard</a>
										</div>
									</div>
								</div>
							</div>
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

	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="paging.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').paging({
				limit : 5
			});
		});
	</script>
</body>
</html>