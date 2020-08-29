<%@page import="com.nbp.gas.OzoneDTO"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
</head>
<body>
		<div class="container" style="margin-top: 5%; margin-bottom: 5%;">

		<%
			List<OzoneDTO> o3List = (List<OzoneDTO>) request.getAttribute("o3List");
			List<OzoneDTO> o3ListAll = (List<OzoneDTO>) request.getAttribute("o3ListAll");
			int size = o3List.size();
			int allSize = o3ListAll.size();
			double sum=0, avg = 0;
			OzoneDTO currentO3 = o3ListAll.get(0);
		%>
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/gas/dashboard.do">Dashboard</a></li>
			<li class="breadcrumb-item active">OZONE Monitoring</li>
		</ol>
		<div class="row">
			<table class="rwd-table">
				<tr >
					<th>num</th>
					<th>PPM</th>
					<th>mg/m3</th>
					<th>시간</th>
				</tr>
				<%
					for (int i = 0; i < size; i++) {
						OzoneDTO o3 = o3List.get(i);
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%=o3.getPpm()%></td>
					<td><%=o3.getMg_ppm()%></td>
					<td><%=o3.getTime()%></td>
				</tr>
	
				<%
					}
				%>
				<tr>
					<td colspan="6" class="mid-col">
					<a href="/gas/o3/list.do?pageNo=0">1</a>&nbsp;&nbsp; 
					<a href="/gas/o3/list.do?pageNo=1">2</a>&nbsp;&nbsp; 
					<a href="/gas/o3/list.do?pageNo=2">3</a>&nbsp;&nbsp; 
					<a href="/gas/o3/list.do?pageNo=3">4</a>&nbsp;&nbsp; 
					<a href="/gas/o3/list.do?pageNo=4">5</a>&nbsp;&nbsp; 
					<a href="/gas/o3/list.do?pageNo=5">6</a>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
	
			<div id="pricing" class="pricing">	
				<div class="box" >
					  <h3>현재 O3 모니터링</h3>
              			<h4><%=  currentO3.getPpm() %><span>ppm</span></h4><br/>
             		  <h3>평균 O3</h3>
             		  <% 
	             		  for (int i=0; i<allSize ;i++){
	             			 sum += Double.parseDouble(o3ListAll.get(i).getPpm());
	             		  }
             			  avg = sum / allSize;
             		 %>
              		 <h4><%= String.format("%.2f", avg) %><span> ppm </span></h4>
              		 <div class="btn-wrap">
                				<a href="/gas/o3/list.do?pageNo=0" class="btn-buy" id="confirm">Now</a>
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
				labels: ['${o3ListAll.get(65).time}'.substring(5,16),
					'${o3ListAll.get(60).time}'.substring(10,16),
					'${o3ListAll.get(55).time}'.substring(10,16),
					'${o3ListAll.get(50).time}'.substring(10,16),
					'${o3ListAll.get(45).time}'.substring(10,16),
					'${o3ListAll.get(40).time}'.substring(10,16),
					'${o3ListAll.get(30).time}'.substring(10,16),
					'${o3ListAll.get(25).time}'.substring(10,16),
					'${o3ListAll.get(20).time}'.substring(10,16),
					'${o3ListAll.get(15).time}'.substring(10,16),
					'${o3ListAll.get(10).time}'.substring(10,16),
					'${o3ListAll.get(5).time}'.substring(10,16),
					'${o3ListAll.get(0).time}'.substring(10,16),
					],
							
				datasets: [{ 
					label: '농도 [ppm]', 
					backgroundColor: colors[2], 
					borderColor: colors[0], 
					data: ['${o3ListAll.get(65).ppm}',
						'${o3ListAll.get(60).ppm}',
						'${o3ListAll.get(55).ppm}',
						'${o3ListAll.get(50).ppm}',
						'${o3ListAll.get(45).ppm}',
						'${o3ListAll.get(40).ppm}',
						'${o3ListAll.get(35).ppm}',
						'${o3ListAll.get(30).ppm}',
						'${o3ListAll.get(25).ppm}',
						'${o3ListAll.get(20).ppm}',
						'${o3ListAll.get(15).ppm}',
						'${o3ListAll.get(10).ppm}',
						'${o3ListAll.get(5).ppm}',
						'${o3ListAll.get(0).ppm}'],
						}]
			},
			options:{}
			
		});
	} 
	
	</script>
	
</body>
</html>