<%@ page import="OrderPack.AdminBook,java.util.TreeMap,java.util.Map" %>
<jsp:useBean id="bean" class="OrderPack.AdminOrders" ></jsp:useBean>
<%
    TreeMap<String,AdminBook> t = bean.getDelivered();
    int itemTotal = 0;
    int itemPrice = 0;
    int delivery = 0;
%>
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
                            <img src="../../books/images/Head_First.jpg" alt="">
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
                                        font-weight: 400;" id="stock">'<%= b.getType() %>'</span></span>
                                </div>
                            </div>
                            <div class="price">
                                <span><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></span>
                            </div>
                        </div>
                        <div class="confirm d-flex justify-content-center">
                            <span>Delivered Successfully </span>
                        </div>
                    </div>
                </div>
            </div>
        <% }
    %>
</div>