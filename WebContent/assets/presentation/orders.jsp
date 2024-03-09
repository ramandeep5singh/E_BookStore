<%@ page import="java.io.File" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies
%>
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
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
    <style>
        .profile-card{
            display: none;
            position: absolute;
            z-index: 10;
            background-color: white;
            color: #000080;
            width: auto;
            right: 16vw;
            padding: 1.5vw;
            border: 0.2vw solid #000080;
        }
        .profile-card p{
            top: 0;
            left: 0;
            text-align: end;
            width: 100%;
            margin: 0;
            color: red;
            cursor: auto;
        }
        .profile-card p>i{
            cursor: pointer;
            padding-right: 1vw;
            padding-top: 0.5vw;
        }
        .profile-card span{
            justify-content: space-between;
            align-items: center;
            font-size: 1.2vw;
            padding: 1vw 0;
        }
        .profile-card span>i{
            font-size: 2vw;
        }
        .logout a{
            text-decoration: none;
            font-weight: bold;
            letter-spacing: 2px;
            color: white;
            background: #000080;
            padding: 0.25vw 0.5vw;
            border-radius: 0.5vw;
            border: 2px solid #000080;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        }
        .logout a:hover{
            background-color: white;
            color: #000080;
        }
    </style>
</head>
<%
    String id = request.getParameter("id");
    String bookName = request.getParameter("name");
    String imgUrl = request.getParameter("img");
    String price = request.getParameter("price");
    String stock = request.getParameter("stock");
    
    Cookie[] cookies = request.getCookies();
    
    String email = "";
    String userName = (String)session.getAttribute("name");
    String phone = (String)session.getAttribute("phone");
    String address = (String)session.getAttribute("address");

    if(cookies!=null){
        for(Cookie cookie : cookies){ 
            if("email".equals(cookie.getName())){
                email = cookie.getValue();
            }
        }
    }

    int cartCount = 0;

    if(email!=""){
        String path = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\E_BookStore\\WebContent\\books\\cart\\"+email;
        File folder = new File(path);
        File[] files = folder.listFiles();

        if(files!=null){
            cartCount = files.length;
        }
    }
%>
<body>
    <div id="profile-card" class="profile-card position-absolute">
        <p style="top: 0;
        left: 0;" class="position-absolute"><i onclick="profileCard(2)" class="fa-solid fa-xmark"></i></p>
        <span class="d-flex"><i class="fa-regular fa-user"></i><%= userName %></span>
        <span class="d-flex"><i class="fa-solid fa-phone"></i><%= phone %></span>
        <span class="d-flex"><i class="fa-solid fa-location-dot"></i></i><%= address %></span>
        <div class="logout d-flex justify-content-center">
            <a href="logout.jsp">SIGNOUT</a>
        </div>
        <a class="d-none" href="update.jsp">Update</a>
    </div>  
    <section style="background: #000080;
    z-index: 10;">
        <div class="nav-ribbon d-flex justify-content-end container">
            <div class="ribbon-span position-relative">
            <%  if(userName==null){ %>
                <span onclick="window.location.href='login.jsp'"><i class="fa-solid fa-user"></i>&nbspSign In</span>
            <%  }
                else if(userName.equals("admin")){ %>
                    <span style="font-weight: bold;" class="position-relative" onclick="profileCard(1)"><%= userName %></span>
            <%  } 
                else{ %>
                    <span class="position-relative" onclick="profileCard(1)"><%= userName %>&nbsp<i class="fa-solid fa-caret-down"></i></span>
            <%  } %>   
            </div>
            <%  if(userName!=null && !userName.equals("admin")){ %>
                <div class="ribbon-span" style="margin-left: 1vw;" 
                onclick="window.location.href='assets/presentation/cart.jsp?email=<%= email %>'">
                    <span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
                    <span class="count-cart"><%= cartCount %></span>
                </div>
            <%  } %>
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
                            <form id="ajax-form" action="../../ajaxlogin" method="post">
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
                    <%  if(email!=""){ %>
                            <span style="color: green;"><i class="fa-solid fa-check"></i></span>
                    <%  }
                    %>
                </div>
                <div id="address-summary" class="card-content position-relative">
                    <% if(address!=null){ %>
                        <span class="position-absolute" style="left: 10px;
                        font-weight: 600;
                        letter-spacing: 2px;
                        color: #000080;" id="address-selected"><%= address %>
                        <button class="change-button" id="address-change" onclick="change(1)">CHANGE</button>
                        <button class="change-button" id="address-confirm" onclick="showSummary()">CONFIRM</button></span>
                        <form action="../../updateAddress" method="post" id="address-form" style="display: none;">
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
                                <input type="hidden" name="email" value="<%= email %>">
                                <button type="submit">UPDATE</button>
                            </div>
                        </form>
                        <button class="change-button" onclick="change(2)" id="cancel-address" 
                        style="display: none;">CANCEL</button>
                    <% }
                    %>
                </div>
            </div>
            <div class="order-card">
                <div class="card-ribbon d-flex">
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
                            <span><%= bookName %></span>
                            <span class="stocks">Available Stock: 
                                <span style="background: transparent;color: #000080;
                                font-size: 1.25vw;
                                font-weight: 400;" id="stock"><%= stock %></span>
                            </span>
                        </div>
                        <div class="price">
                            <span><i class="fa-solid fa-indian-rupee-sign"></i><%= price %></span>
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
                <div id="payment-mode" class="card-content" style="padding: 2vw;
                display: none;"> <!--d-flex justify-content-evenly-->
                    <div class="payment-method">
                        <input type="radio" name="online" id=""><span>&nbspPay Online</span>
                    </div>
                    <div class="payment-method">
                        <input type="radio" name="cash" id=""><span>&nbspCash on Delivery</span>
                    </div>
                    <div class="payment-method">
                        <form action="../../placeOrder" method="get">
                            <input type="hidden" name="id" value="<%= id %>">
                            <input type="hidden" name="email" value="<%= email %>">
                            <input type="hidden" name="status" value="1">
                            <input type="hidden" name="quantity1" value="1">
                            <button type="submit" class="change-button" style="margin: 0;">Buy Now</button>
                        </form>
                        <form action="../../placeOrder" method="get">
                            <input type="hidden" name="id" value="<%= id %>">
                            <input type="hidden" name="email" value="<%= email %>">
                            <input type="hidden" name="status" value="0">
                            <input type="hidden" name="quantity2" value="1">
                            <button type="submit" class="change-button" style="margin: 0;">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-12">
            <div class="total">
                <div class="items d-flex justify-content-between">
                    <span>ITEMS&nbsp<span id="item-count">1</span>:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign"></i><%= price %></span>
                </div>
                <div class="delivery-charge d-flex justify-content-between">
                    <span>Delivery Charges:</span>
                    <span>Free</span>
                </div>
                <div class="items d-flex justify-content-between">
                    <span>TOTAL:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign" id="total-bill"></i>200</span>
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