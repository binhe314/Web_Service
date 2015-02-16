<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="twitter4j.Twitter"%>
<%@ page import="databeans.History" %>
<%@ page import="formbeans.SearchForm"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>All about the 57th Grammy's</title>
<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.js"></script>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>

<!-- Custom Theme files -->
<link href="./css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 









</script>

<!-- draw chart to show change of search number -->
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		var data = new google.visualization.DataTable();

		// Declare columns
	 	data.addColumn('string', 'Date');
		data.addColumn('number', 'Number of Search');
 
 /* data.addColumn('string', 'Date');
	data.addColumn('datetime', 'Number of Search'); */
		// Add data.
		 data.addRows([
		<c:forEach var="history" items="${historyChart}" varStatus="status">
			 ['${history.stringDate}', ${history.searchNum}] ${status.last?'':', '}
		</c:forEach>
		]);
		
		<%--  data.addRows([
		<% History historyChart[]=(History[])request.getAttribute("historyChart"); 		
		for(int i=0;i< historyChart.length-1;i++){%>		
			[<%=historyChart[i].getStringDate()%>, <%=historyChart[i].getSearchNum()%>], 	              
			              
		<%}%>
			['Mar 19', 15]
		              ]);  --%>
		
		 /* data.addRows([
		              ['Mike', {v:new Date(2008,1,28), f:'February 28, 2008'}], // Example of specifying actual and formatted values.
		              ['Bob', new Date(2007,5,1)],                              // More typically this would be done using a
		              ['Alice', new Date(2006,7,16)],                           // formatter.
		              ['Frank', new Date(2007,11,28)],
		              ['Floyd', new Date(2005,3,13)],
		              ['Fritz', new Date(2011,6,1)]
		            ]); */
		 
		var options = {
			width : 700,
			height : 400,
			hAxis : {
				title : 'Date',
				gridlines : {
					count : 7
				}

			},
			vAxis : {
				title : 'Number of Search'
			}
		};

		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart2'));

		chart.draw(data, options);
	}
</script>


<!----webfonts--->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600'
	rel='stylesheet' type='text/css'>
<!---//webfonts--->
</head>
<body>
	<!-- container -->
	<div class="header top-header">
		<div class="container">
			<!-- header -->
			<!-- logo -->
			<div class="logo">
				<a href="index.jsp"><img src="./images/logo.png" title="musicz" /></a>
			</div>
			<!-- logo -->
			<!-- top-nav -->
			<div class="top-nav">
				<span class="menu"> </span>
				<ul>
					<li class="active"><a href="index.jsp">Home<span> </span></a></li>
					<li><a href="awards.jsp">Awards</a></li>
					<tag:notloggedin>
						<li><a href="signin"><img
								src="./images/Sign-in-with-Twitter-darker.png" /></a></li>
					</tag:notloggedin>
					<tag:loggedin>
						<li><a href="#">${name}</a></li>
						<li><a href="./logout">logout</a></li>
					</tag:loggedin>
					<div class="clearfix"></div>
				</ul>
			</div>
			<div class="clearfix"></div>
			<!-- top-nav -->
			<!-- script-for-menu -->
			<script>
				$(document).ready(function() {
					$("span.menu").click(function() {
						$(".top-nav ul").slideToggle(200);
					});
				});
			</script>
			<!-- script-for-menu -->
		</div>
		<!-- header -->
	</div>
	<!-- categories -->
	<div class="categories c-cate">
		<div class="container">
			<div class="categories-left">
				<ul class="options">
					<a href="search.do?celebrity=bruno_mars">#Bruno Mars</a> &nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=taylor_swift">#Taylor
							Swift</a>&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=iggy_azalea">#Iggy Azalea</a>&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=sam_smith">#Sam Smith</a>
			
				</ul>
			</div>
			<div class="categories-right">
				<form action="search.do" method="POST">
					<input type="text" placeholder="Search here" name="celebrity"
						value="${form.celebrity}" required> <input type="submit"
						name="action" value="Search" />
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- categories -->
	<!-- content -->
	<div class="content">
		<div class="container">
			<!-- content-left -->
			<div class="col-md-8 content-left">
				<!-- artical-single-page -->
				<div class="artical-details">
					<h2>
						<a href="#">${form.celebrity }</a>
					</h2>
					<!-- artical-details-info -->
					<div class="artical-details-info">
						<div class="artical-details-info-left">

							<div class="grid">
								<div class="imgholder">
									<a href="${photo}"> <img src="${photo}"></a>
								</div>

							</div>

						</div>
						<div class="artical-details-info-right">

							<p>
								<strong>Followers: </strong> ${artist.followersCount }
							</p>
							<p>
								<strong>Origin:</strong>${ artist.location}
							</p>
							<p>
								<strong>Years active:</strong> ${artist.createdAt }
							</p>
							<div class="dicription">
								<p>
									<strong>Description :</strong>${artist.description }</p>
							</div>
						</div>
						<div class="clearfix"></div>

					</div>
					<!-- artical-details-info -->
				</div>
				<!-- related-articals -->
				<div class="related-articals">
					<h2>How popular in past 7 days?</h2>
					<!-- related-albums -->
					<div class="related-albums">
						<div id="owl-demo1"
							style="border: 1px solid #fff; text-align: center; border-collapse: collapse; text-align: center;">
							<div id="chart2"></div>
							
						</div>
					</div>
				</div>
				<div class="related-articals">
					<h2>Pictures</h2>
					<div class="related-albums">
						<div id="owl-demo1"
							style="border: 1px solid #fff; text-align: center; border-collapse: collapse;">
							<c:forEach items="${flickrs}" var="flickr">
								<a href="${flickr}"> <img src="${flickr}"></a>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-4 content-right">
				<div class="artical-details">
					
						<h3>Talk to this artist !</h3>

						
						
						<a class="twitter-timeline"
							href="https://twitter.com/${twitterName}"
							data-widget-id="566328412265283584" data-screen-name="${twitterName }" data-theme="dark">Tweets
							by ${twitterName}</a>
						<script>
							!function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
										.test(d.location) ? 'http' : 'https';
								if (!d.getElementById(id)) {
									js = d.createElement(s);
									js.id = id;
									js.src = p
											+ "://platform.twitter.com/widgets.js";
									fjs.parentNode.insertBefore(js, fjs);
								}
							}(document, "script", "twitter-wjs");
						</script>
						<br><br>
					<h2>Make your tweets!</h2>
					<p style="color: #d7d7d7;"><li><a href="#">${name}</a></li>
							</p>
						<form action="./post"  method="post" enctype="multipart/form-data">
						<table>
								
									<tr>
										<td>Image: </td>
										<td colspan="2"><input type="file" name="file" value="${filename}"/></td>
										
									</tr>
									
								</table>
							<textarea cols="40" rows="5" name="text"
								style="background-color: #d7d7d7"></textarea>
							<br> <input type="submit" name="post" value="Post" />
							<input type="hidden" name="celebrity" value="${form.celebrity}" />
						</form>
						<tag:notloggedin>
						<a href="signin"><img
							src="./images/Sign-in-with-Twitter-darker.png" /></a>
					</tag:notloggedin>
					<tag:loggedin>
						<a href="./logout">logout</a>
					</tag:loggedin>
					
				</div>
			</div>
		</div>
		<!-- related-albums -->
	</div>
	<!-- related-articals -->
	<!-- artical-single-page -->
	</div>
	<!-- content -->
	<!-- copy-right -->
	<div class="copy-right">
		<div class="container">
			<p>
				Design by <a href="#">Donuts</a>
			</p>
		</div>
	</div>
	<!-- copy-right -->
	<!-- container -->
</body>
</html>




