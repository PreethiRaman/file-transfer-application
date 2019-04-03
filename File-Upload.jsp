<%-- 
    Document   : File-Upload
    Created on : Feb 9, 2019, 3:53:19 PM
    Author     : David
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<html lang="zxx">

<head>
	<title>IP Spoofing</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Befit Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Bootstrap-Core-CSS -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Nunito+Sans:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext,vietnamese"
	 rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	 rel="stylesheet">
	<!-- //Web-Fonts -->
</head>

<body>
	 

	<!-- contact -->
	<section class="contact py-5">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title-w3 text-bl text-center font-weight-bold">Users Upload Files</h3>
			<p class="title-sub mb-sm-5 mb-4 text-center">Users Upload File</p>
			<!-- mail -->
			<div class="row mail-w3l-agile pt-xl-4">
				 
				<div class="col-md-6 agileinfo_mail_grid_right mt-md-0 mt-5" style="margin-left: 289px;">
					<form action="File-Upload-Action.jsp" method="post" enctype="multipart/form-data">
						<div class="form-group">
                                                    <label>Choose File</label>
							<input type="file" name="file" class="form-control" placeholder="Name" required="">
						</div>
						<div class="form-group">
                                                    <%
                                                        Random r=new Random();
                                                        String userid=session.getAttribute("userid").toString();
                                                        String username=session.getAttribute("username").toString();
                                                        String am_pm;
                                                        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                                                        Calendar c= Calendar.getInstance();
                                                        String start="";
                                                        start=format.format(c.getTime());
                                                        java.text.DateFormat df = new java.text.SimpleDateFormat("dd-MMM-yyyy");
                                                        Calendar cal = Calendar.getInstance();
                                                        java.text.DateFormat tim = new java.text.SimpleDateFormat("HH:mm:ss");
                                                        Calendar cal2 = Calendar.getInstance();
                                                        if(cal2.get(Calendar.AM_PM) == 0)
                                                        am_pm = "AM";
                                                        else
                                                        am_pm = "PM";

                                                        String Date=df.format(cal.getTime());
                                                        String st =tim.format(cal2.getTime());
                                                        String Time = st +" "+ am_pm;
                                                    %>
                                                    <label>File Key</label>
                                                    <input type="text" name="filekey" class="form-control" placeholder="Name" value="<%=r.nextInt(100000)%>">
						</div>
						<div class="form-group">
                                                    <label>Owner Name</label>
                                                    <input type="text" name="username" class="form-control" placeholder="Name" value="<%=username%>">
						</div>                                            
                                                <div class="form-group">
                                                    <label>Owner ID</label>
							<input type="text" name="userid" class="form-control" placeholder="Name" value="<%=userid%>">
						</div>
                                                <div class="form-group">
                                                    <label>Date</label>
							<input type="text" name="date" class="form-control" placeholder="Name" value="<%=Date%>">
						</div>
                                                <div class="form-group">
                                                    <label>Time</label>
							<input type="text" name="time" class="form-control" placeholder="Name" value="<%=Time%>">
						</div>
                                            <button type="submit" class="btn">Upload</button>
					</form>
                                    <br><br><br>
                                        <p align="center"><a href="User-Home.jsp">User Home</a></p>
				</div>
			</div>
		</div>
	</section>
	 
	<!-- //copyright -->

	<!-- move top icon -->
	<a href="#home" class="move-top text-center"></a>
	<!-- //move top icon -->

</body>

</html>