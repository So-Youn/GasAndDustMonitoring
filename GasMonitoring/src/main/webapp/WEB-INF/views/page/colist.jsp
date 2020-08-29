<%@page import="com.nbp.co.CoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/gas/common/css/table.css" rel="stylesheet">
<!-- 차트 cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
</head>
<body>
	<div class="container" style="margin-top: 5%; margin-bottom: 5%;">

		<%
			List<CoDTO> colist = (List<CoDTO>) request.getAttribute("colist");
			List<CoDTO> coListAll = (List<CoDTO>) request.getAttribute("coListAll");
			int size = colist.size();
			int allSize = coListAll.size();
			double sum=0, avg = 0;
			CoDTO currentCo = coListAll.get(0);
		%>
				<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/gas/dashboard.do">Dashboard</a></li>
			<li class="breadcrumb-item active">CO Monitoring</li>
		</ol>
		<div class="row">
			<table class="rwd-table">
				<tr >
					<th>num</th>
					<th>PPM</th>
					<th>시간</th>
				</tr>
				<%
					for (int i = 0; i < size; i++) {
						CoDTO co = colist.get(i);
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%=co.getPpm()%></td>
					<td><%=co.getTime()%></td>
				</tr>
	
				<%
					}
				%>
				<tr>
					<td colspan="6" class="mid-col" >
					<a href="/gas/co/list.do?pageNo=0">1</a>&nbsp;&nbsp; 
					<a href="/gas/co/list.do?pageNo=1">2</a>&nbsp;&nbsp; 
					<a href="/gas/co/list.do?pageNo=2">3</a>&nbsp;&nbsp; 
					<a href="/gas/co/list.do?pageNo=3">4</a>&nbsp;&nbsp; 
					<a href="/gas/co/list.do?pageNo=4">5</a>&nbsp;&nbsp; 
					<a href="/gas/co/list.do?pageNo=5">6</a>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			<div id="pricing" class="pricing">	
					<div class="box" >
					  <h3>현재 CO 모니터링</h3>
              			<h4><%=  currentCo.getPpm() %><span>ppm</span></h4><br/>
              		  <h3> 평균 CO </h3>
              		    <% 
	             		  for (int i=0; i<allSize ;i++){
	             			 sum += Double.parseDouble(coListAll.get(i).getPpm());
	             		  }
              			  avg = sum / allSize;
             		 	%>
             		  <h4><%= String.format("%.2f", avg) %><span> ppm </span></h4>
						<div class="btn-wrap">
              				<a href="/gas/co/list.do?pageNo=0" class="btn-buy" id="confirm">Now</a>
           				</div> 
             		</div>
			</div>
			<div class="container" style="width: 80%"> 
				<canvas id="myChart"></canvas> 
			</div>
		
		</div>
	</div>
	<script type="text/javascript">
	window.onload = function(){
		setChart();
	}
	function setChart(){
		const colors=['red','blue','#eec9d2'];
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: ['${coListAll.get(200).time}'.substring(5,16),
					'${coListAll.get(180).time}'.substring(10,16),
					'${coListAll.get(160).time}'.substring(10,16),
					'${coListAll.get(140).time}'.substring(10,16),
					'${coListAll.get(120).time}'.substring(10,16),
					'${coListAll.get(100).time}'.substring(10,16),
					'${coListAll.get(80).time}'.substring(10,16),
					'${coListAll.get(60).time}'.substring(10,16),
					'${coListAll.get(40).time}'.substring(10,16),
					'${coListAll.get(20).time}'.substring(10,16),
					'${coListAll.get(0).time}'.substring(10,16),
					],
				datasets: [{ 
					label: 'CO 농도 [ppm]', 
					backgroundColor: colors[2], 
					borderColor: colors[0], 
					data: ['${coListAll.get(200).ppm}',
						'${coListAll.get(180).ppm}',
						'${coListAll.get(160).ppm}',
						'${coListAll.get(140).ppm}',
						'${coListAll.get(120).ppm}',
						'${coListAll.get(100).ppm}',
						'${coListAll.get(80).ppm}',
						'${coListAll.get(60).ppm}',
						'${coListAll.get(40).ppm}',
						'${coListAll.get(20).ppm}',
						'${coListAll.get(0).ppm}'],
						},
						{
					label: 'CO2 농도 [ppm]', 
					backgroundColor: 'transparent', 
					borderColor: colors[1], 
					data: ['${co2list.get(200).ppm}',
						'${co2list.get(180).ppm}',
						'${co2list.get(160).ppm}',
						'${co2list.get(140).ppm}',
						'${co2list.get(120).ppm}',
						'${co2list.get(100).ppm}',
						'${co2list.get(80).ppm}',
						'${co2list.get(60).ppm}',
						'${co2list.get(40).ppm}',
						'${co2list.get(20).ppm}',
						'${co2list.get(0).ppm}'],		
						}]
			},
			options:{}
			
			});
	}
	</script>
</body>
</html>