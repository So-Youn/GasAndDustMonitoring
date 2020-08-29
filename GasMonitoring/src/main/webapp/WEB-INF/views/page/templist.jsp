
<%@page import="com.nbp.temp.TempDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.nbp.temp.*"%>
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
		List<TempDTO> templist = (List<TempDTO>) request.getAttribute("templist");
		List<TempDTO> tempListAll = (List<TempDTO>) request.getAttribute("tempListAll");
		int size = templist.size();
		int allSize = tempListAll.size();
		double tempSum=0, tempAvg = 0;
		double HumSum=0, HumAvg = 0;
		TempDTO currenttemp = tempListAll.get(0);
	%>
	
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/gas/dashboard.do">Dashboard</a></li>
				<li class="breadcrumb-item active">Temp Monitoring</li>
			</ol>
			<div class="row">
				<table class="rwd-table">
					<tr>
						<th>num</th><th>온도</th><th>습도</th><th>측정 시간</th>
					</tr>
					<% for(int i=0;i<size;i++){
						TempDTO temp = templist.get(i);%>
						<tr>
							<td><%= i+1 %></td>
							<td><%= Integer.toString(temp.getTemp()) %></td>
							<td><%= Integer.toString(temp.getHum()) %></td>
							<td><%= temp.getTime()%></td>
						</tr>
						
					<%} %>
					<tr>
						<td colspan="6" class="mid-col">
						<a href="/gas/temp/list.do?pageNo=0">1</a>&nbsp;&nbsp;
						<a href="/gas/temp/list.do?pageNo=1">2</a>&nbsp;&nbsp;
						<a href="/gas/temp/list.do?pageNo=2">3</a>&nbsp;&nbsp;
						<a href="/gas/temp/list.do?pageNo=3">4</a>&nbsp;&nbsp;
						<a href="/gas/temp/list.do?pageNo=4">5</a>&nbsp;&nbsp;
						<a href="/gas/temp/list.do?pageNo=5">6</a>&nbsp;&nbsp;
						</td>
					</tr>
				</table>
				<div id="pricing" class="pricing">	
					<div class="box" >
					  <h3>현재 온 습도 모니터링</h3>
              			<h4><sup>T</sup><%=  Integer.toString(currenttemp.getTemp()) %><span>ºC</span> <sup>H</sup><%=  Integer.toString(currenttemp.getHum()) %><span>%</span></h4><br/>
              			<h3> 평균 온/습도</h3>
              			<% 
	             		  for (int i=0; i<allSize ;i++){
	             			 tempSum += tempListAll.get(i).getTemp();
	             			 HumSum += tempListAll.get(i).getHum();
	             			 
	             		  }
              				tempAvg = tempSum / allSize;
              				HumAvg = HumSum/ allSize;
             			 %>
             			 <h4><sup>T</sup><%=  String.format("%.1f", tempAvg) %><span>ºC</span> <sup>H</sup><%=   String.format("%.1f", HumAvg) %><span>%</span></h4>
 							<div class="btn-wrap">
                				<a href="/gas/temp/list.do?pageNo=0" class="btn-buy" id="confirm">확인</a>
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
					labels: ['${tempListAll.get(200).time}'.substring(5,16),
						'${tempListAll.get(170).time}'.substring(10,16),
						'${tempListAll.get(150).time}'.substring(10,16),
						'${tempListAll.get(130).time}'.substring(10,16),
						'${tempListAll.get(110).time}'.substring(10,16),
						'${tempListAll.get(90).time}'.substring(10,16),
						'${tempListAll.get(70).time}'.substring(10,16),
						'${tempListAll.get(50).time}'.substring(10,16),
						'${tempListAll.get(30).time}'.substring(10,16),
						'${tempListAll.get(10).time}'.substring(10,16),
						'${tempListAll.get(0).time}'.substring(10,16),
						],
								
					datasets: [{ 
						label: '온도 [ºC]', 
						backgroundColor: colors[2], 
						borderColor: colors[0], 
						data: ['${tempListAll.get(200).temp}',
							'${tempListAll.get(170).temp}',
							'${tempListAll.get(150).temp}',
							'${tempListAll.get(130).temp}',
							'${tempListAll.get(110).temp}',
							'${tempListAll.get(90).temp}',
							'${tempListAll.get(70).temp}',
							'${tempListAll.get(50).temp}',
							'${tempListAll.get(30).temp}',
							'${tempListAll.get(10).temp}',
							'${tempListAll.get(0).temp}'],
							},
							{
						label: '습도 [%]',
						backgroundColor: 'transparent',
						borderColor: colors[1],
						data:['${tempListAll.get(200).hum}',
							'${tempListAll.get(170).hum}',
							'${tempListAll.get(150).hum}',
							'${tempListAll.get(130).hum}',
							'${tempListAll.get(110).hum}',
							'${tempListAll.get(90).hum}',
							'${tempListAll.get(70).hum}',
							'${tempListAll.get(50).hum}',
							'${tempListAll.get(30).hum}',
							'${tempListAll.get(10).hum}',
							'${tempListAll.get(0).hum}'],
							}]
				},
				options:{}
				
				
			});
		}
	

	
	</script>
</body>
</html>