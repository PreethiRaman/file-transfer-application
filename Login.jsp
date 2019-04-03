 

<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style_1.css">
    </head>
    <body>
        <form action="User-Action.jsp" method="post">
            <h2>User Login</h2>
            <p>
                <label for="Email" class="floatLabel">User Name</label>
                <input id="Email" name="username" type="text">
            </p>
            <p>
                <label for="password" class="floatLabel">Password</label>
                <input id="text" name="password" type="password">
            </p>
            <p>
                <input type="submit" value="Login" id="submit">
            </p>
            <p align="center"><a href="Logout.jsp" style="font-size: 16px;text-decoration: none;">Home</a></p>
            <p align="center"><a  style="font-size: 16px;text-decoration: none;" href="Register.jsp">Create New Account..?</a></p>
        </form>
        
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



        <script  src="js/index.js"></script>




    </body>

</html>
