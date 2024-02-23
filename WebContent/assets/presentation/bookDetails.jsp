<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/bookDetails.css">
    <link rel="stylesheet" href="../css/index.css">
    <title>Document</title>
</head>
<%
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String imgUrl = request.getParameter("img-url");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String edition = request.getParameter("edition");
    String description = request.getParameter("description");
    String stock = request.getParameter("stock");
%>
<script src="../js/bookDetails.js"></script>
<body>
    <span class="d-none" id="user-email"><%= (String)session.getAttribute("email") %></span>
    <section class="details-nav">
        <section style="background: #000080;
        z-index: 10;">
            <div class="nav-ribbon d-flex justify-content-end container">
                <div class="ribbon-span" >
                    <%  if(session.getAttribute("email")==null){ %>
                        <span class="position-relative" onclick="window.location.href='login.jsp'"><i class="fa-solid fa-user"></i>&nbspSign In
                            <div class="position-absolute">
                                <span class="d-flex"><i class="fa-regular fa-user"></i><%= name %></span>
                                <span class="d-flex"><i class="fa-regular fa-user"></i><%= name %></span>
                                <span class="d-flex"><i class="fa-regular fa-user"></i><%= name %></span>
                                <a href="logout.jsp">LOGOUT</a>
                            </div>
                        </span>
                    <%  }
                        else{ %>
                            <span><%= (String)session.getAttribute("email") %><i class="fa-solid fa-caret-down"></i></span>
                        <% }
                    %> 

                </div>
                <div class="ribbon-span" style="margin-left: 1vw;">
                    <span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
                    <span class="count-cart">0</span>
                </div>
            </div>
        </section>
        <section class="nav position-relative">
            <div class="small-nav d-flex justify-content-between" style="align-items: center;">
                <img src="../bookStoreLogo.png" alt="logo" />
                <p style="text-overflow: ellipsis;
                margin: 0;
                width: 100%;
                font-size: 2vw;
                text-align: center;
                color: #000080;
                font-weight: 600;"><%= name %></p>
                <span class="d-flex" style="align-items: center;
                font-size: 3vw;
                font-weight: bold;
                color: #000080;"><i class="fa-solid fa-indian-rupee-sign"></i>&nbsp<%= price %></span>
            </div>
            <span class="stock position-absolute">Available Stocks: <span id="stock"><%= stock %></span></span>
        </section>
    </section>
    <section class="details d-flex position-absolute">
        <div class="d-flex flex-column col-3">
            <div class="product-img">
                <img src="../../<%= imgUrl %>" alt="">
            </div>
            <div class="book-name d-flex justify-content-between">
                <span><%= name %></span><span style="font-size: 1vw; color: grey;">Edition <%= edition %></span>
            </div>
            <div class="aut-pub">
                <span>by&nbsp</span><span class="ap"><%= author %></span>
            </div>
            <div class="aut-pub">
                <span class="ap"><%= description %></span><span>(Publisher)</span>
            </div>
            <div class="purchase">
                <div class="buy-cart row justify-content-between">
                    <button class="col-12" onclick="proceedPurchase()">Buy Now</button>
                    <button class="col-12" onclick="proceedPurchase()">Add to Cart</button>
                </div>
                <div class="quantity d-flex justify-content-between">
                    <span>Quantity</span>
                    <div class="q-in">
                        <i class="fa-solid fa-minus" onclick="quantity(2)" style="cursor: pointer;"></i>
                        <input type="number" name="quantity" id="quantity" value="1">
                        <i class="fa-solid fa-plus" onclick="quantity(1)" style="cursor: pointer;"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="description">
            <p>
                <%= publisher %>
            </p>
        </div>
    </section>
</body>
</html>