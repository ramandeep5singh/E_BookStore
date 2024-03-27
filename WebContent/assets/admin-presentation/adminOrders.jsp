<%@ page import="OrderPack.AdminBook,java.util.TreeMap,java.util.Map" %>
<jsp:useBean id="bean" class="OrderPack.AdminOrders" ></jsp:useBean>
<%
    TreeMap<String,AdminBook> t = bean.getOrders();
    int itemTotal = 0;
    int itemPrice = 0;
    int delivery = 0;
%>
<section class="d-flex" style="height: 100vh;
width: 100%;">
    <div id="order-summary" class="card-content d-flex flex-column" 
    style="padding: 1vw 3vw;
    height: 100%;
    overflow: auto;">
        <%  for(Map.Entry<String,AdminBook> entry : t.entrySet()){
                itemTotal++;
                String key = entry.getKey();
                AdminBook b = entry.getValue();
                itemPrice += b.getPrice(); %>
                <div style="background-color: #8080803d;
                padding: 1vw;
                border-radius: 1vw;
                margin-bottom: 2vw;">
                    <span class="order-email"><%= key %></span>
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
                                        font-weight: normal;">Available Stock: 
                                            <span style="background: transparent;
                                            color: #000080;
                                            font-size: 1.25vw;
                                            font-weight: 400;" id="stock"><%= b.getStock() %></span>
                                        </span>
                                        <span>type:
                                            <span style="background: transparent;
                                            color: #000080;
                                            font-size: 1.25vw;
                                            font-weight: 400;" id="stock">'<%= b.getType() %>'</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="price">
                                    <span><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></span>
                                </div>
                            </div>
                            <div class="confirm d-flex justify-content-center">
                                <form style="padding: 0;" action="../../acknowledge" method="get">
                                    <input type="hidden" name="id" value="<%= b.getOrderId() %>">
                                    <input type="hidden" name="status" value="1">
                                    <button type="submit" style="width: 100%;">Acknowledge</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <% }
        %>
    </div>  
    <div class="" style="background-color: #84dbffd1;
    width: 65%;">
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
                <span>
                    <i class="fa-solid fa-indian-rupee-sign" id="total-bill"></i>
                    <%= delivery+itemPrice %>
                </span>
            </div>
        </div>
        <!-- <p style="padding: 1vw;"><i class="fa-solid fa-square-check" 
            style="padding-right: 3px;"></i>
            Safe and secure payments. Easy Returns. 100% Authentic products.
        </p> -->
        <div class="acknowledge-all d-flex justify-content-center">
            <button>Acknowledge All</button>
        </div>
    </div>
</section>