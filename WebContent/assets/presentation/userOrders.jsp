<%@ page import="OrderPack.UserBook,java.util.TreeMap,java.util.Map" %>
<jsp:useBean id="bean" class="OrderPack.UserOrders" ></jsp:useBean>
<%
    Cookie[] cookies = request.getCookies();

    String email = "";

    if(cookies!=null){
        for(Cookie cookie : cookies){ 
            if("email".equals(cookie.getName())){
                email = cookie.getValue();
            }
        }
    }
    
    TreeMap<Integer,UserBook> t = bean.getOrders(email);
    int itemTotal = 0;
    int itemPrice = 0;
    int delivery = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/orders.css">
    <script src="../js/userOrders.js"></script>
    <title>E_BookStore</title>
</head>
<body>
    <section class="d-flex" style="height: 100vh;
    width: 100%;">
        <div id="order-summary" class="card-content d-flex flex-column col-md-8 col-12" 
        style="padding: 3vw;
        height: 100%;
        overflow: auto;">
            <%  for(Map.Entry<Integer,UserBook> entry : t.entrySet()){
                itemTotal++;
                Integer key = entry.getKey();
                UserBook b = entry.getValue();
                itemPrice += b.getPrice(); %>
                <div style="background-color: #8080803d;
                padding: 1vw;
                border-radius: 1vw;
                margin-bottom: 2vw;">
                    <div class="cart-item d-flex">
                        <div class="book-selected">
                            <div class="img">
                                <img src="../../<%= b.getImg_url() %>" alt="">
                            </div>
                            <div class="q-in d-flex justify-content-center">
                                <span>Quantity: <%= b.getQuantity() %></span>
                            </div>
                        </div>
                        <div class="img-desc d-flex flex-column justify-content-between">
                            <div>
                                <div class="name d-flex justify-content-between">
                                    <span><%= b.getName() %></span>
                                    <div class="stock-type d-flex flex-column">
                                        <span class="stocks" style="color: #000080;
                                        font-size: initial;
                                        font-weight: normal;">Status:&nbsp 
                                            <%  if(b.getStatus() == 1){ %>
                                                <span style="background: transparent;
                                                color: red;
                                                font-size: 1.25vw;
                                                font-weight: 600;" id="stock">'UnderProcess'</span>
                                            <%  }
                                                else if(b.getStatus() == 2){ %>
                                                    <span style="background: transparent;
                                                    color: yellow;
                                                    font-size: 1.25vw;
                                                    font-weight: 600;" id="stock">'Acknowledged'</span>
                                            <%  } 
                                                else{ %>
                                                    <span style="background: transparent;
                                                    color: green;
                                                    font-size: 1.25vw;
                                                    font-weight: 600;" id="stock">'Dispatched'</span>
                                            <%  } %>
                                        </span>
                                        <span class="stocks" style="color: #000080;
                                        font-size: initial;
                                        font-weight: normal;">payment:&nbsp 
                                            <%  if(b.getPayment() == 1){ %>
                                                <span style="background: transparent;
                                                color: red;
                                                font-size: 1.25vw;
                                                font-weight: 600;" id="stock">'CASH'</span>
                                            <%  }
                                                else if(b.getPayment() == 2){ %>
                                                    <span style="background: transparent;
                                                    color: green;
                                                    font-size: 1.25vw;
                                                    font-weight: 600;" id="stock">'Online'</span>
                                            <%  } %>
                                        </span>
                                    </div>
                                </div>
                                <div class="price">
                                    <span><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></span>
                                </div>
                            </div>
                            <%  if(b.getStatus()==1){ %>
                                <div class="confirm d-flex justify-content-center">
                                    <form style="padding: 0;" action="../../cancelOrder" method="get">
                                        <input type="hidden" name="id" value="<%= b.getOrderId() %>">
                                        <button type="submit" style="width: 100%;">Cancel</button>
                                    </form>
                                </div>
                            <%  } %>
                        </div>
                    </div>
                </div>
            <%  } %>
        </div>  
        <div class="col-md-4 col-12" style="background-color: #84dbffd1;">
            <div class="total">
                <div class="items d-flex justify-content-between">
                    <span>ITEMS&nbsp<span id="item-count"><%= itemTotal %></span>:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign"></i><%= itemPrice %></span>
                </div>
                <div class="delivery-charge d-flex justify-content-between">
                    <span>Delivery Charges:</span>
                    <span>Free</span>
                </div>
                <div class="items d-flex justify-content-between">
                    <span>TOTAL:</span>
                    <span><i class="fa-solid fa-indian-rupee-sign" id="total-bill"></i><%= delivery+itemPrice %></span>
                </div>
            </div>
            <p style="padding: 1vw;"><i class="fa-solid fa-square-check" 
                style="padding-right: 3px;"></i>
                Safe and secure payments. Easy Returns. 100% Authentic products.
            </p>
        </div>
    </section>
</body>
</html>