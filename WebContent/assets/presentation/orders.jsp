<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/orders.css">
    <title>E_BookStore</title>
    <script src="../js/orders.js"></script>
</head>
<%
    String id = request.getParameter("id");
    
    Cookie[] cookies = request.getCookies();
    
    String email = "";

    if(cookies!=null){
        for(Cookie cookie : cookies){ 
            if("email".equals(cookie.getName())){
                email = cookie.getValue();
            }
        }
    }
%>
<body>
    <section style="background: #000080;
    z-index: 10;
    width: 100%;">
        <div class="nav-ribbon d-flex justify-content-end container">
            <div class="ribbon-span position-relative">
                <span onclick="window.location.href='login.jsp'"><i class="fa-solid fa-user"></i>&nbspSign In</span>    
            </div>
            <div class="ribbon-span" style="margin-left: 1vw;">
                <span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
                <span class="count-cart">0</span>
            </div>
        </div>
    </section>
    <section class="row" style="width: 100%;">
        <div class="col-md-8 col-12">
            <div class="order-card">
                <div class="card-ribbon position-relative">
                    <span>1</span>
                    <span>LOGIN OR SIGNUP</span>
                    <%  if(email!=""){ %>
                            <span style="color: green;"><i class="fa-solid fa-check"></i></span>
                        <% }
                    %>
                </div>
                <div class="card-content position-relative">
                    <%  
                        if(email!=""){ %>
                            <span class="position-absolute" style="left: 10px;
                            font-weight: 600;
                            letter-spacing: 2px;
                            color: #000080;"><%= email %></span>
                        <% }
                        else{ %>
                            <form id="ajax-form" method="post">
                                <div class="login-signup d-flex justify-content-evenly" style="padding: 1vw;">
                                    <div class="position-relative">
                                        <span class="position-absolute" id="email1">Enter Email ID</span>
                                        <input type="email" name="email" id="email" 
                                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                                    </div>
                                    <div class="position-relative">
                                        <span class="position-absolute" style="top: 50%;
                                        transform: translatey(-50%);
                                        left: 7px;
                                        z-index: -1;
                                        color: grey;" id="password1">Enter Password</span>
                                        <input type="password" name="password" id="password" 
                                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                                    </div>
                                </div>
                                <div class="login-signup-button d-flex justify-content-center">
                                    <button type="submit">CONTINUE</button>
                                </div>
                            </form>
                        <% }
                    %>    
                </div>
            </div>
            <div class="order-card">
                <div class="card-ribbon">
                    <span>2</span>
                    <span>ADDRESS SUMMARY</span>
                    <span style="color: green;
                    display: none;"><i class="fa-solid fa-check"></i></span>
                </div>
                <div id="address-summary" class="card-content position-relative">
                    <span class="position-absolute" style="left: 10px;
                    font-weight: 600;
                    letter-spacing: 2px;
                    color: #000080;
                    display: none;" id="address-selected">5G/32 NIT FARIDABAD, HARYANA 121001 
                    <button class="change-button" onclick="change(1)">CHANGE</button>
                    <button class="change-button" id="address-confirm" onclick="showSummary()">CONFIRM</button></span>
                    <form action="updateAddress" method="post" id="address-form" style="display: none;">
                        <div class="login-signup d-flex justify-content-evenly" style="padding: 1vw;">
                            <div class="position-relative">
                                <span class="position-absolute" id="address11">Address Line 1</span>
                                <input type="text" name="address1" id="address1" 
                                onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                            </div>
                            <div class="position-relative">
                                <span class="position-absolute" style="top: 50%;
                                transform: translatey(-50%);
                                left: 7px;
                                z-index: -1;
                                color: grey;" id="address21">Address Line2</span>
                                <input type="text" name="address2" id="address2" 
                                onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                            </div>
                        </div>
                        <div class="login-signup-button d-flex justify-content-center">
                            <button type="submit">UPDATE</button>
                        </div>
                    </form>
                    <button class="change-button" onclick="change(2)" id="cancel-address" 
                    style="display: none;">CANCEL</button>
                </div>
            </div>
            <div class="order-card">
                <div class="card-ribbon">
                    <span>3</span>
                    <span>ORDER SUMMARY</span>
                    <span style="color: green;
                    display: none;"
                    id="order-summary-tick"><i class="fa-solid fa-check"></i></span>
                </div>
                <div id="order-summary" class="card-content" style="padding: 1vw; display: none;">
                    <div class="book-selected">
                        <div class="img">
                            <img src="../../books/images/Head_First.jpg" alt="">
                        </div>
                        <div class="q-in d-flex justify-content-center">
                            <i class="fa-solid fa-minus" onclick="quantity(2)" style="cursor: pointer;"></i>
                            <input type="number" name="quantity" id="quantity" value="1">
                            <i class="fa-solid fa-plus" onclick="quantity(1)" style="cursor: pointer;"></i>
                        </div>
                    </div>
                    <div class="img-desc position-relative">
                        <div class="name d-flex justify-content-between">
                            <span>Head First Java</span>
                            <span class="stocks">Available Stocks: 
                                <span style="background: transparent;color: #000080;
                                font-size: 1.25vw;
                                font-weight: 400;" id="stock">10</span>
                            </span>
                        </div>
                        <div class="price">
                            <span><i class="fa-solid fa-indian-rupee-sign"></i>200</span>
                        </div>
                        <div class="confirm d-flex justify-content-center position-absolute">
                            <button class="change-button" style="margin: 0;" onclick="showConfirm()">CONFIRM</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="order-card">
                <div class="card-ribbon">
                    <span>4</span>
                    <span>CONFIRM ORDER</span>
                    <span style="color: green;
                    display: none;"><i class="fa-solid fa-check"></i></span>
                </div>
                <div class="card-content" style="padding: 2vw;
                display: none;"> <!--d-flex justify-content-evenly-->
                    <div class="payment-method">
                        <input type="radio" name="online" id=""><span>&nbspPay Online</span>
                    </div>
                    <div class="payment-method">
                        <input type="radio" name="cash" id=""><span>&nbspCash on Delivery</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-12">
            <div class="total">
                <div class="items d-flex justify-content-between">
                    <span>ITEMS&nbsp<span>1</span>:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign"></i>200</span>
                </div>
                <div class="delivery-charge d-flex justify-content-between">
                    <span>Delivery Charges:</span>
                    <span>Free</span>
                </div>
                <div class="items d-flex justify-content-between">
                    <span>TOTAL:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign"></i>200</span>
                </div>
            </div>
            <p><i class="fa-solid fa-square-check" 
                style="padding-right: 3px;"></i>
                Safe and secure payments. Easy Returns. 100% Authentic products.
            </p>
        </div>
    </section>
</body>
</html>