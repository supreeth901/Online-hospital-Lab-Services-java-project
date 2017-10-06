<%@page import="Model.LabServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.LabServices,java.util.ArrayList"%>
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

<script type="text/javascript" src="tablefilter.js"></script>
<!-- 
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<!-- Script for View all -->

<script type="text/javascript" charset="utf-8">
	$(document).ready(
			function() {
				$('#example').DataTable(
						{
							"aLengthMenu" : [ [ 5, 10, 20, 40, 80, -1 ],
									[ 5, 10, 20, 40, 80, "All" ] ],
							"iDisplayLength" : 5,
							"bInfo" : true,
							"processing" : true

						});
			});
</script>

<!-- Script for View all -->

-->
</head>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-warning text-center" id="myModalLabel">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;Are
					you sure?
				</h4>
			</div>
			<form action="" method="post">
				<div class="modal-body text-center">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary">Delete LSP</button>

				</div>
			</form>
		</div>
	</div>
</div>









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
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-primary">
						<!-- Default panel contents -->
						<div class="panel-heading text-center">Test Details</div>
						<!-- Table -->
						<table class="table table-striped table-hover text-center display"
							id="example">
							<input type="hidden" name="add" value="view">
							<thead>
								<tr class="success">
									<%
										if ((ArrayList<LabServices>) request.getAttribute("viewlist") != null) {
											ArrayList<LabServices> list = (ArrayList<LabServices>) request
													.getAttribute("viewlist");
											if (list.size() > 0) {
									%>
									<th>Test Code:</th>
									<th>Test Name</th>
									<th>Test Description</th>
									<th>Test Duration</th>
									<th>Test Cost</th>
									<th>Lab At Home</th>
									<th>Lab ID</th>
								</tr>
								<%
									for (LabServices lbservice : list) {
								%>
							</thead>
							<tbody>
								<tr>
									<td><%=lbservice.getTestCode()%></td>
									<td><%=lbservice.getTestName()%></td>
									<td><%=lbservice.getTestDescription()%></td>
									<td><%=lbservice.getTestDuration()%></td>
									<td><%=lbservice.getTestCost()%></td>
									<td><%=lbservice.getLabHome()%></td>
									<td><%=lbservice.getLabId()%></td>
									<td><a type="button" class="btn btn-md btn-primary"
										href="LabServicesController?add=delete1&&code=<%=lbservice.getTestCode()%>&&testname=<%=lbservice.getTestName()%>">Delete
											Service</a></td>
									<%
										}
									%>



								</tr>
							</tbody>
						</table>
						<%
							}
							} else {
						%>
						<h3>No Existing Lab Services</h3>
						<%
							}
						%>
						<div class="panel-footer">
							<a href="LSPOption.jsp" type="button"
								class="btn btn-md btn-primary"><i
								class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back to
								DashBoard</a> </span>
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

	<!-- Bootstrap Dattable Query 
	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
	<!-- Bootstrap Dattable Query -->

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