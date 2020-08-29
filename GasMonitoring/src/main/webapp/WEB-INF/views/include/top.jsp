<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Dashboard Gas Nbp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link href="/gas/common/css/style.css" rel="stylesheet">
<link href="/gas/common/css/dash.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/7d9d1fe263.js" crossorigin="anonymous"></script>
<!-- JS -->
<script src="/gas/common/js/main.js"></script>
</head>

<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="/gas/dashboard.do">NBP DATA CENTER</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="/gas/dashboard.do"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Dashboard</span>
				</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<a class="nav-link" href="#"> 
						<i class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Charts</span>
					</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
<!-- 				<li class="nav-item">
					<form class="form-inline my-2 my-lg-0 mr-lg-2">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..."> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</li> -->
				<li class="nav-item">
					<p id="welcome">윤소윤님 안녕하세요<p>
				</li>
			</ul>
		</div>
	</nav>

</body>
</html>