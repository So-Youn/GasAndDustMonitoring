<%@page import="com.nbp.gas.NH3DTO"%>
<%@page import="com.nbp.gas.No2DTO"%>
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
			List<No2DTO> No2list = (List<No2DTO>) request.getAttribute("No2list");
			List<No2DTO> No2listAll = (List<No2DTO>) request.getAttribute("No2listAll");
			List<NH3DTO> Nh3listAll = (List<NH3DTO>) request.getAttribute("Nh3listAll");
			int size = No2list.size();
			int allSize = No2listAll.size();
			int nh3Size = Nh3listAll.size();
			double sum=0, avg = 0;
			double nh3Sum=0, nh3Avg=0;
			No2DTO currentNo2 = No2listAll.get(0);
		%>
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/gas/dashboard.do">Dashboard</a></li>
			<li class="breadcrumb-item active">NO2 Monitoring</li>
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
						No2DTO no2 = No2list.get(i);
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%= no2.getPpm() %></td>
					<td><%= no2.getTime()%></td>
				</tr>
	
				<%
					}
				%>
				<tr>
					<td colspan="6" class="mid-col">
					<a href="/gas/cautious/list.do?pageNo=0">1</a>&nbsp;&nbsp;
					<a href="/gas/cautious/list.do?pageNo=1">2</a>&nbsp;&nbsp;
					<a href="/gas/cautious/list.do?pageNo=2">3</a>&nbsp;&nbsp;
					<a href="/gas/cautious/list.do?pageNo=3">4</a>&nbsp;&nbsp;
					<a href="/gas/cautious/list.do?pageNo=4">5</a>&nbsp;&nbsp;
					<a href="/gas/cautious/list.do?pageNo=5">6</a>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			<div id="pricing" class="pricing">	
					<div class="box" >
					  <h3>현재 NO2 모니터링</h3>
              			<h4><%=  currentNo2.getPpm() %><span> ppm</span></h4><br/>
              		  <h3> 평균 NO2 </h3>
              		 <% 
	             		  for (int i=0; i<allSize ;i++){
	             			 sum += Double.parseDouble(No2listAll.get(i).getPpm());
	             		  }
              		 	  for (int j=0; j<nh3Size;j++){
              		 		 nh3Sum += Double.parseDouble(Nh3listAll.get(j).getVolts());
              		 	  }
              				avg = sum / allSize;
              				nh3Avg = nh3Sum/nh3Size;
             		 %>
             		 	<h4><%= String.format("%.2f", avg) %><span> ppm </span></h4>
             		 <h3>현재 NH3 Volt</h3>
             		 	<h4><%= String.format("%.2f", nh3Avg) %><span> V </span></h4>
 							<div class="btn-wrap">
                				<a href="/gas/cautious/list.do?pageNo=0" class="btn-buy" id="confirm">Now</a>
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
				labels: ['${No2listAll.get(25).time}'.substring(5,16),
					'${No2listAll.get(22).time}'.substring(10,16),
					'${No2listAll.get(20).time}'.substring(10,16),
					'${No2listAll.get(16).time}'.substring(10,16),
					'${No2listAll.get(14).time}'.substring(10,16),
					'${No2listAll.get(12).time}'.substring(10,16),
					'${No2listAll.get(10).time}'.substring(10,16),
					'${No2listAll.get(7).time}'.substring(10,16),
					'${No2listAll.get(5).time}'.substring(10,16),
					'${No2listAll.get(0).time}'.substring(10,16),
					],
				datasets: [{ 
					label: 'No2 농도 [ppm]', 
					backgroundColor: colors[2], 
					borderColor: colors[0], 
					data: [
						'${No2listAll.get(25).ppm}',
						'${No2listAll.get(22).ppm}',
						'${No2listAll.get(20).ppm}',
						'${No2listAll.get(16).ppm}',
						'${No2listAll.get(14).ppm}',
						'${No2listAll.get(12).ppm}',
						'${No2listAll.get(10).ppm}',
						'${No2listAll.get(7).ppm}',
						'${No2listAll.get(5).ppm}',
						'${No2listAll.get(0).ppm}'],
						},
						{
					label: 'NH3 Volt', 
					backgroundColor: 'transparent', 
					borderColor: colors[1], 
					data: ['${Nh3listAll.get(25).volts}',
						'${Nh3listAll.get(22).volts}',
						'${Nh3listAll.get(20).volts}',
						'${Nh3listAll.get(16).volts}',
						'${Nh3listAll.get(14).volts}',
						'${Nh3listAll.get(12).volts}',
						'${Nh3listAll.get(10).volts}',
						'${Nh3listAll.get(7).volts}',
						'${Nh3listAll.get(5).volts}',
						'${Nh3listAll.get(0).volts}'],		
						}]
			},
			options:{}
			
			});
	}
	</script>
</body>
</html>