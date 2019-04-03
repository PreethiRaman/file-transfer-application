<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  
  
  
      <link rel="stylesheet" href="css/style_1.css">

  
</head>

<body>

  	

<form action="Register-Action.jsp" method="post">
  <h2>New Users Registration</h2>
		<p>
			<label for="Email" class="floatLabel">User Name</label>
			<input id="Email" name="username" type="text">
		</p>
                <p>
			<label for="password" class="floatLabel">Password</label>
			<input id="password" name="password" type="password">
			<span>Enter a password longer than 8 characters</span>
		</p>
                <p>
			<label for="confirm_password" class="floatLabel">Confirm Password</label>
			<input id="confirm_password" name="confirm_password" type="password">
			<span>Your passwords do not match</span>
		</p>
                <p>
			<label for="Email" class="floatLabel">Mobile Number</label>
			<input id="Email" name="mobile" type="text">
		</p>
                <p>
			<label for="Email" class="floatLabel">Email</label>
			<input id="Email" name="email" type="text">
		</p>
		
		<p>
			<label class="floatLabel">Address</label>
                        <textarea id="password" name="address" style="margin: 0px; width: 395px; height: 113px;"></textarea>
		</p>
		<p>
			<input type="submit" value="Create My Account" id="submit">
		</p>
	</form>
    <p align="center"><a href="Logout.jsp">Home</a></p>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>
