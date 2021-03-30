<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="view/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="view/vendor/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="view/css/style.css">
</head>
<body>

    <div class="main">

        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="view/images/cns.jpg" alt="">
                    <div class="signup-img-content">
                        <h2>Login now </h2>
                        <p>Welcome back !</p>
                    </div>
                </div>
                <div class="signup-form">
                   <form action="${pageContext.request.contextPath}/login" modelAttribute="user" class="register-form" id="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="first_name" class="required">User name</label>
                                  <input type="text" class="form-control" id = "email" name="username" style = "width:100% !important;margin:auto"/>
                                </div>
                                <div class="form-input">
                                    <label for="last_name" class="required">Password</label>
                                <input type="password" class="form-control"id="pwd" name="password" style = "width:100% !important;margin:auto"/>
                                </div>
                               </div>
                               </div>
                              
                               
                              
                        <div class="form-submit" style = "text-align: left !important;">
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                           
                        </div>
                    	</form>
                    	
                    	<p style="color:black !important;"> Don't have an account, click <a href="/register">here</a> to signup..<p>
                </div>
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="view/vendor/jquery/jquery.min.js"></script>
    <script src="view/vendor/nouislider/nouislider.min.js"></script>
    <script src="view/vendor/wnumb/wNumb.js"></script>
    <script src="view/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="view/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="view/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>