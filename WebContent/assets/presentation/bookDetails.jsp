<%@ page import="java.io.File" %>
<%  
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
%>
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
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String imgUrl = request.getParameter("img-url");
    String type = request.getParameter("type");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String edition = request.getParameter("edition");
    String description = request.getParameter("description");
    String stock = request.getParameter("stock");

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
<style>
    .profile-card{
        display: none;
        z-index: 10;
        background-color: white;
        color: #000080;
        top: -1vw;
        left: -5vw;
        width: auto;
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
<script src="../js/bookDetails.js"></script>
<script>
    function profileCard(x){
        let card = document.getElementById("profile-card")

        if(x==1){
            card.style.display = "block";
        }
        else{
            card.style.display = "none";
        }
    }
</script>
<body>
    <span class="d-none" id="user-email"><%= email %></span>
    <div id="profile-card" class="position-absolute profile-card">
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
    <section class="details-nav">
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
                <span class="ap"><%= publisher %></span><span>(Publisher)</span>
            </div>
            <div class="purchase">
                <div class="buy-cart row justify-content-between">
                    <form style="padding: 0;"  class="col-12" action="orders.jsp" method="get">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="hidden" name="img" value="<%= imgUrl %>">
                        <input type="hidden" name="name" value="<%= name %>">
                        <input type="hidden" name="price" value="<%= price %>">
                        <input type="hidden" name="stock" value="<%= stock %>">
                        <button type="submit" style="width: 100%;">Buy Now</button>
                    </form>
                    <form style="padding: 0;"  class="col-12" action="../../cart" method="get">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="hidden" name="name" value="<%= name %>">
                        <input type="hidden" name="email" value="<%= email %>">
                        <input type="hidden" name="price" value="<%= price %>">
                        <input type="hidden" name="img-url" value="<%= imgUrl %>">
                        <input type="hidden" name="type" value="<%= type %>">
                        <input type="hidden" name="author" value="<%= author %>">
                        <input type="hidden" name="publisher" value="<%= publisher %>">
                        <input type="hidden" name="description" value="<%= description %>">
                        <input type="hidden" name="edition" value="<%= edition %>">
                        <input type="hidden" name="stock" value="<%= stock %>">
                        <button type="submit" style="width: 100%;">Add to Cart</button>
                    </form>
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
                <%= description %>
            </p>
        </div>
    </section>
</body>
</html>