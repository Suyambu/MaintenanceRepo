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
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>
                </div>
                <div class="signup-form">
                   <form action="registerUser" modelAttribute="user" class="register-form" id="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="first_name" class="required">User name</label>
                                   <input type="text" name="username"  id="first_name" />
                                </div>
                                <div class="form-input">
                                    <label for="last_name" class="required">Last name</label>
                                    <input type="text" name="last_name" id="last_name" />
                                </div>
                                <div class="form-input">
                                    <label for="company" class="required">Company</label>
                                    <input type="text" name="company" id="company" />
                                </div>
                                
                            </div>
                            <div class="form-group">
                            <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="text" name="email" id="email" />
                                </div>
                                <div class="form-input">
                                    <label for="phone_number" class="required">Password</label>
                                  <input type="password" name="password" id="phone_number" />
                                </div>
                                <div class="form-select">
                                    <div class="label-flex">
                                        <label for="meal_preference">Contract Type</label>
                                        <a href="#" class="form-link">Contract detail</a>
                                    </div>
                                    <div class="select-list">
                                        <select name="meal_preference" id="meal_preference">
                                            <option value="Vegetarian">Whole_Contract</option>
                                            <option value="Kosher">Workers_Contract</option>
                                        </select>
                                    </div>
                                </div>
                               
                              
                        <div class="form-submit">
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                           
                        </div>
                    	</form>
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