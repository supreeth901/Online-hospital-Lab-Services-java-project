<%@page import="Model.LabServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.LabServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>

<head>
<title>&nbsp;&nbsp;LabSchedule&nbsp;&nbsp;||&nbsp;&nbsp;CoLab</title>

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
<script type="text/javascript" src="tablefilter.js"></script>
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
				<div class="col-md-10 col-md-offset-1">
					<h3>
						<span style="color: white;">Lab Schedule | view | Add</span>
					</h3>
					<div class="separator"></div>
					<%	ArrayList<LabServices> list1 = (ArrayList<LabServices>) request
											.getAttribute("view1");
									String testname, testcode;
									if(list1.size()>0){	%>
					<div class="panel panel-primary">
						<!-- Default panel contents -->
						<div class="panel-heading text-center">Lab Service Details</div>
						<!-- Table -->



						<table class="table table-striped table-hover table-responsive" id="example">
							<thead>


								<tr class="info text-center">
									<th>Lab ID</th>
									<th>Test Name</th>
									<th>Test Code:</th>
									<th></th>
								</tr>

							</thead>
							<tbody>
								<%
									for (LabServices ls : list1) {
								%>
								<tr>
									<td><%=lbobj.getLabID()%></td>
									<td><%=ls.getTestName()%></td>
									<td><%=ls.getTestCode()%></td>

									<td>
										<!--  <button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#myModal">
											<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add
											Schedule
										</button>--> <a
										href="LabScheduleController?name=view&&testcode=<%=ls.getTestCode()%>&&testname=<%=ls.getTestName()%>">Add
											Schedule</a>
									</td>
								</tr>
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
					<%}else{%>
					No Lab Schedule Exists For Specified Lab Service
					<div class="panel-footer">
						<a href="LSPOption.jsp" type="button"
							class="btn btn-md btn-primary"><i
							class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
							DashBoard</a>
					</div>
					<%} %>

				</div>
			</div>
		</div>
	</section>
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
						<span class="glyphicon glyphircon-plus-sign" aria-hidden="true"></span>&nbsp;Create
						Schedule
					</h4>
				</div>
				<form action="" method="post" accept-charset="utf-8">
					r
					<div class="modal-body">

						<!-- <div class="form-group">
							<label for="slot_id" class="col-md-3 control-label">&nbsp;Slot
								Id</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="slotId" name="id"
									placeholder="Slot ID" required>
							</div>

						</div>
						<br> <br> -->
						<div class="form-group">
							<label for="test_code" class="col-md-3 control-label">&nbsp;Test
								Code</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="test_code"
									value="<%=request.getAttribute("testcode")%>" name="test_code"
									readonly>
							</div>

						</div>
						<br> <br>
						<div class="form-group">
							<label for="test_name" class="col-md-3 control-label">&nbsp;Test
								Name</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="test_name"
									value="<%=request.getAttribute("testname")%>" name="test_name"
									readonly>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label for="slot_time" class="col-md-3 control-label">&nbsp;Slot
								Time</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="slot_time"
									name="slot_time" placeholder="Slot Time" required>
							</div>
						</div>
						<br> <br>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Create
							Schedule</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--=-=-=-=-=-=-=--=-=-=-=0-=-=-= Modal Code Ends -=-=-=-=-=-=-=-=-=-==--=0=0-=0=-=-=-=-=-=-->

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