<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/loginPage.css">
    <title>Register to E_BookStore</title>
</head>
<script src="assets/js/credentials.js"></script>
<body>
    <div class="logo position-fixed">
        <h1>E_BookStore</h1>
    </div>
    <section class="login-card d-flex justify-content-center">
        <div class="card">
            <h3 class="">Register</h3>
            <div class="login">
                <form class="position-relative" action="register" method="post" onsubmit="return checkregistration()">
                    <div class="form-input d-flex flex-column justify-content-between">
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="text" name="name" id="name" placeholder="Enter Name" onblur="checkInput(1)">&nbsp<i id="name-icon" class="fa-solid fa-user"></i>
                        </div>
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="number" name="phone" id="phone" placeholder="Enter Phone Number" onblur="checkInput(2)">&nbsp<i id="phone-icon" class="fa-solid fa-phone"></i>
                        </div>
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="email" name="email" id="email" placeholder="Enter Email ID" onblur="checkInput(3)">&nbsp<i id="email-icon" class="fa-solid fa-envelope"></i>
                        </div>
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="text" name="address1" id="address1" placeholder="Address Line 1" onblur="checkInput(4)">&nbsp<i id="address-icon1" class="fa-solid fa-location-dot"></i>
                        </div>
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="text" name="address2" id="address2" placeholder="Address Line 2" onblur="checkInput(5)">&nbsp<i id="address-icon2" class="fa-solid fa-location-dot"></i>
                        </div>
                        <div style="padding-top: 2vw;" class="d-flex justify-content-center">
                            <input type="password" name="password" id="password" placeholder="Enter Password" onblur="checkInput(6)">&nbsp<i id="password-icon" class="fa-solid fa-lock"></i>
                        </div>
                        <div style="padding: 2vw 0;" class="d-flex justify-content-center">
                            <input type="password" name="confirm-password" id="c-password" placeholder="Confirm Password" onblur="checkInput(7)">&nbsp<i id="c-password-icon" class="fa-solid fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-button d-flex justify-content-center">
                        <button type="submit">Register</button>
                    </div>
                </form>
                <!-- <div class="new-user d-flex justify-content-between">
                    <div class="lr-new"></div>
                    <span>Already have Account?</span>
                    <div class="lr-new"></div>
                </div>
                <div class="create-account d-flex justify-content-center">
                    <a href="login.html">Login</a>
                </div> -->
            </div>
        </div>
    </section>
</body>
