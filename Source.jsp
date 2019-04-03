<%
    try
    {
        String admin=session.getAttribute("admin").toString();
    }
    catch(Exception ex)
    {
        response.sendRedirect("Error-Page.jsp");
    }
%> 
<!DOCTYPE html>
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

<body style="background: beige;">
	 

	<!-- contact -->
	<section class="contact py-5">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title-w3 text-bl text-center font-weight-bold">Send Your File to Receiver (for Users)</h3>
			<p class="title-sub mb-sm-5 mb-4 text-center">Upload File</p>
			<!-- mail -->
			<div class="row mail-w3l-agile pt-xl-4">
				 
				<div class="col-md-6 agileinfo_mail_grid_right mt-md-0 mt-5" style="border-style: groove;margin-left: 289px;border-color: aquamarine;border-radius: 8px;">
					<form action="Source-Action.jsp" method="post" enctype="multipart/form-data">
						<div class="form-group">
                                                    <label>Choose File</label>
							<input type="file" name="file" class="form-control" placeholder="Name" required="">
						</div>
						<button type="submit" class="btn">Upload</button>
					</form>
                                    <br><br><br>
                                        <p align="center"><a href="Admin-Home.jsp">Admin Home</a></p>
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