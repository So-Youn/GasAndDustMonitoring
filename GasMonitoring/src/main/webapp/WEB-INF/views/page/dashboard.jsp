<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.nbp.gas.OzoneDTO"%>
<%@page import="com.nbp.co.CoDTO"%>
<%@page import="com.nbp.temp.TempDTO"%>
<%@page import="java.util.List"%>
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
<title>Nbp Dashboard Gas</title>
<link href="/gas/common/css/main.css" rel="stylesheet">
<link href="/gas/common/css/mdb.min.css" rel="stylesheet">
<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="/gas/common/js/main.js"></script>
<script src="/gas/common/js/mdb.min.js"></script>
</head>
<body>
	
	<div class="container">
	<%
	 JSONObject parse_item = (JSONObject) request.getAttribute("parse_item");
	%>

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/gas/dashboard.do">Dashboard</a></li>
			<li class="breadcrumb-item active">Realtime Sensor</li>
		</ol>

		<div class="row" id="gas-row">
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-secondary o-hidden h-100">
					<div class="card-body">
						<div class="mr-5">온/습도 <i id="retemp" class="fas fa-sync-alt"></i></div>  
					</div>
					<a class="card-footer text-white clearfix small z-1" href="/gas/temp/list.do?pageNo=0">
						<span class="float-left" ><span id="temp"> - </span>&nbsp;ºC/ <span id="hum"> - </span>&nbsp;%</span>
						<span class="float-right"> <i class="fas fa-angle-right"></i>
					</span>
					</a>
					</div>
				</div>
			
			
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-primary o-hidden h-100">
					<div class="card-body">
						<div class="mr-5">CO<i id="reCo" class="fas fa-sync-alt"></i></div>
					</div>
					<a class="card-footer text-white clearfix small z-1" href="/gas/co/list.do?pageNo=0">
						<span class="float-left" ><span id="coPpm"> - </span>&nbsp;ppm</span> 
						<span class="float-right"> <i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-success o-hidden h-100">
					<div class="card-body">
						<div class="mr-5">O3<i id="reO3" class="fas fa-sync-alt"></i></div>
					</div>
					<a class="card-footer text-white clearfix small z-1" href="/gas/o3/list.do?pageNo=0">
						<span class="float-left" ><span id="o3Ppm"> - </span>&nbsp;ppm</span> 
						<span class="float-right"> <i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-warning o-hidden h-100">
					<div class="card-body">
						<div class="mr-5">NO2<i id="reNo2" class="fas fa-sync-alt"></i></div>
					</div>
					<a class="card-footer text-white clearfix small z-1" href="/gas/cautious/list.do?pageNo=0">
						<span class="float-left" ><span id="No2Ppm"> - </span>&nbsp;ppm</span> 
						<span class="float-right"> <i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
		</div>
		<div class="gas-table">
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-bar-chart"></i> Gas Concentrations (in ppm)
				</div>
					<div class="card-body">
						<div class="row"> 
							<div class="col-sm-8 ">
						    <div class="table-responsive">
								<table class="table table-bordered" id="stand-tabale" >
							      <thead>
							        <tr>
							          <th rowspan="2">오염물질</th>
							          <th colspan = "4" style="text-align: center;">농도</th>
							        </tr>
							        <tr>
							          <th >Mild</th>
							          <th >Moderate</th>
							          <th >Harsh</th>
							          <th >Severe</th>
							        </tr>
							      </thead>
							      <tbody>
							        <tr>
							          <td data-title="ID">H2S</td>
							          <td data-title="Mild">&lt;&nbsp;0.003</td>
									  <td data-title="Moderate">&lt;&nbsp;0.01</td>
							          <td data-title="Harsh">&lt;&nbsp;0.05</td>
							          <td data-title="Severe">0.05</td>
							        </tr>
							        <tr>
							          <td data-title="ID">SO2</td>
							          <td data-title="Mild">&lt;&nbsp;0.01</td>
									  <td data-title="Moderate">&lt;&nbsp;0.1</td>
							          <td data-title="Harsh">&lt;&nbsp;0.3</td>
							          <td data-title="Severe">0.3</td>
							        </tr>
							        <tr>
							          <td data-title="ID">NO2</td>
							          <td data-title="Mild">&lt;&nbsp;0.05</td>
									  <td data-title="Moderate">&lt;&nbsp;0.125</td>
							          <td data-title="Harsh">&lt;&nbsp;1.25</td>
							          <td data-title="Severe">1.25</td>
							        </tr>
							        <tr>
							          <td data-title="ID">O3</td>
							          <td data-title="Mild">&lt;&nbsp;0.02</td>
									  <td data-title="Moderate">&lt;&nbsp;0.25</td>
							          <td data-title="Harsh">&lt;&nbsp;1</td>
							          <td data-title="Severe">1</td>
							        </tr>
							        
							        <tr>
							          <td data-title="ID">CO</td>
							          <td data-title="Mild">&lt;&nbsp;10</td>
									  <td data-title="Moderate">&lt;&nbsp;13</td>
							          <td data-title="Harsh">&lt;&nbsp;16</td>
							          <td data-title="Severe">16</td>
							        </tr>
							        
							      </tbody>
							    </table>
						   </div>
						</div>
						<div class="col-sm-4 text-center my-auto">
								<div class="h4 mb-0 ">Mild</div>
								<div class="small text-muted">부식이 장비의 신뢰성 판단에 영향을 미치지 않는 정도</div>
								<hr>
								<div class="h4 mb-0 text-primary">Moderate</div>
								<div class="small text-muted">장비의 신뢰성을 판단하는데 부식이 발생할 가능성이 있어 부식에 대한 영향을 고려해야 할 수도 있는 정도</div>
								<hr>
								<div class="h4 mb-0 text-success">Harsh</div>
								<div class="small text-muted">높은 확률로 부식에 의한 장애가 발생할 수 있는 정도</div>
								<hr>
								<div class="h4 mb-0 text-warning">Severe</div>
								<div class="small text-muted">부식에 대한 방안을 설계에 포함한 제품이나 밀봉된 제품만 사용될 수 있는 정도</div>
						</div> 
						
					</div>
				</div>
			</div>
		</div>
		
			<div class="card mb-3" >
				<div class="card-header">
					<i class="fa fa-pie-chart"></i> 춘천시 대기오염 정보 조회 (in ppm)
				</div>
				<div class="row" id="pie-row">
					<div class="col-sm-6 ">
						<canvas id="pieChart"></canvas>
					</div>
					<div class="col-sm-6 ">
						<canvas id="pieChartPM"></canvas>
					</div>
					<div class="col-sm-6">
					<div class="pie-table">
						
							<table id="tablePreview" class="table table-borderless">
							<!--Table head-->
							  <thead>
							  <tbody>
							    <tr>
							      <th scope="row">So2</th>
							      <td><%= parse_item.get("so2Value") %></td>
							    </tr>
							    <tr>
							      <th scope="row">CO</th>
							      <td><%= parse_item.get("coValue") %></td>
							    </tr>
							    <tr>
							      <th scope="row">O3</th>
							      <td><%= parse_item.get("o3Value") %></td>
							    </tr>
							    <tr>
							      <th scope="row">No2</th>
							      <td><%= parse_item.get("no2Value") %></td>
							    </tr>
							  </tbody>
							  <!--Table body-->
							</table>
						</div>
					</div>
					<div class="col-sm-6">
					<div class="pie-table">
						
							<table id="tablePreview" class="table table-borderless">
							<!--Table head-->
							  <thead>
							  <tbody>
							    <tr>
							      <th scope="row">PM10</th>
							      <td><%= parse_item.get("pm10Value") %></td>
							    </tr>
							    <tr>
							      <th scope="row">PM2.5</th>
							      <td><%= parse_item.get("pm25Value") %></td>
							    </tr>
							 	<tr>
							      <th scope="row">평균 PM10</th>
							      <td><%= parse_item.get("pm10Value24") %></td>
							    </tr>
							    <tr>
							      <th scope="row">평균 PM2.5</th>
							      <td><%= parse_item.get("pm25Value24") %></td>
							    </tr>

							  </tbody>
							  <!--Table body-->
							</table>
						</div>
					</div>
				</div>
				
				
		
				<div class="card-footer small text-muted">Updated at <%= parse_item.get("dataTime") %> in <a href="https://www.airkorea.or.kr/index">airkorea</a> </div>
			</div>
</div>
	
	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
   <script type="text/javascript">
   
	//pie chart 선언문
	var ctxP = document.getElementById("pieChart").getContext('2d');
	var ctxPM = document.getElementById("pieChartPM").getContext('2d');
	var parse_item = "{parse_item}";
	console.log(parse_item); 

   
   function poll(){
		//온습도 센서 polling  
	   $.ajax({
			url: "/gas/temp/ajax_last.do",
			type:"get",
			async: false,
			success: function(data){
				$('#temp').text(data[0].Temp);
				$('#hum').text(data[0].Hum);
				if(parseFloat(data[0].Temp)>28){
					  event.preventDefault();
						Swal.fire({
						  title: 'Temp WARNING',
						  text: '실내 온도 '+data[0].Temp+'ºC으로 위험수치를 나타내고 있습니다.',
						  icon: 'error',
						  confirmButtonText: 'OK'
						})
					} else if (parseFloat(data[0].Hum)>=60){
						event.preventDefault();
						Swal.fire({
						  title: 'Humidity WARNING',
						  text: '실내 습도 '+data[0].Hum+'%으로 위험수치를 나타내고 있습니다.',
						  icon: 'error',
						  confirmButtonText: 'OK'
						})
					}
			}
			});
	   //Co 센서 polling  
		$.ajax({
			url: "/gas/co/ajax_last.do",
			type:"get",
			async: false,
			success: function(data){
					$("#coPpm").text(data[0].ppm);
					if(parseFloat(data[0].ppm)>10.5){ 
						  event.preventDefault();
							Swal.fire({
							  title: 'CO WARNING',
							  text: '일산화탄소 '+data[0].ppm+'ppm으로 위험수치를 나타내고 있습니다.',
							  icon: 'error',
							  confirmButtonText: 'OK'
							})
						}
				}
			});
		//O3 센서 polling  
 		$.ajax({
			url: "/gas/o3/ajax_last.do",
			type:"get",
			async: false,
			success: function(data){
				$("#o3Ppm").text(data[0].ppm);
				if(parseFloat(data[0].ppm)>0.02){
					  event.preventDefault();
						Swal.fire({
						  title: 'O3 WARNING',
						  text: '오존 가스 '+data[0].ppm+'ppm으로 위험수치를 나타내고 있습니다.',
						  icon: 'error',
						  confirmButtonText: 'OK'
						})
					}
				}
			});
		
 		$.ajax({
			url: "/gas/cautious/ajax_last.do",
			type:"get",
			async: false,
			success: function(data){
					$("#No2Ppm").text(data[0].ppm);
					if(parseFloat(data[0].ppm)>0.05){
						  event.preventDefault();
							Swal.fire({
							  title: 'No2 WARNING',
							  text: '이산화 질소'+data[0].ppm+'ppm으로 위험수치를 나타내고 있습니다.',
							  icon: 'error',
							  confirmButtonText: 'OK'
							})
						}
					
			}
			}); 
	   };
	window.setInterval(poll,10000);	
		
	// refresh 버튼 클릭시 값 셋팅
 	$(document).ready(function() {
		$("#retemp").on("click", function(){
			$.ajax({
				url: "/gas/temp/ajax_last.do",
				type:"get",
				async: false,
				success: function(data){				
						$('#temp').text(data[0].Temp);
						$('#hum').text(data[0].Hum); 					
				}
			})
		});
		
		$("#reCo").on("click", function(){
			$.ajax({
				url: "/gas/co/ajax_last.do",
				type:"get",
				async: false,
				success: function(data){
						$('#coPpm').text(data[0].ppm);		
				}
			})
		});
 		$("#reO3").on("click", function(){
			$.ajax({
				url: "/gas/o3/ajax_last.do",
				type:"get",
				async: false,
				success: function(data){	
						$('#o3Ppm').text(data[0].ppm);
						
				}
			})
		}); 
 		$("#reNo2").on("click", function(){
			$.ajax({
				url: "/gas/cautious/ajax_last.do",
				type:"get",
				async: false,
				success: function(data){
						$('#No2Ppm').text(data[0].ppm);
				}
			})
		}); 

 		var myPieChart = new Chart(ctxP, {
	 		type: 'pie',
	 		data: {
	 		labels: ["So2", "CO", "O3", "No2"],
	 		datasets: [{
	 		data: ["${parse_item.so2Value}", "${parse_item.coValue}", "${parse_item.o3Value}", "${parse_item.no2Value}"],
	 		backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1"],
	 		hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5"]
	 		}]
	 		},
	 		options: {
	 		responsive: true
	 		}
	 	});
 		var myPieChartPM = new Chart(ctxPM, {
	 		type: 'pie',
	 		data: {
	 		labels: ["PM10", "PM2.5"],
	 		datasets: [{
	 		data: ["${parse_item.pm10Value}", "${parse_item.pm25Value}"],
	 		backgroundColor: ["#4D5360", "#58508d"],
	 		hoverBackgroundColor: ["#616774", "#bc5090"]
	 		}]
	 		},
	 		options: {
	 		responsive: true
	 		}
 		});
		
 	});
	
	</script>
</body>
</html>