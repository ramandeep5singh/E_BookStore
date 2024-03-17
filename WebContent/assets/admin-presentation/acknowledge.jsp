<div id="order-summary" class="card-content d-flex flex-column" 
style="padding: 1vw 3vw;
height: 100%;
overflow: auto;">
    <div style="background-color: #8080803d;
    padding: 1vw;
    border-radius: 1vw;
    margin-bottom: 2vw;">
        <span class="order-email">ramandeep@gmail.com</span>
        <div class="cart-item d-flex">
            <div class="book-selected">
                <div class="img">
                    <img src="../../books/images/Head_First.jpg" alt="">
                </div>
                <div class="q-in d-flex justify-content-center">
                    <span>Quantity: 3</span>
                </div>
            </div>
            <div class="img-desc d-flex flex-column justify-content-between">
                <div>
                    <div class="name d-flex justify-content-between">
                        <span>Head First Java</span>
                        <div class="stock-type d-flex flex-column">
                            <span class="stocks" style="color: #000080;
                            font-size: initial;
                            font-weight: normal;">Acknowledgement Date: 
                                <span style="background: transparent;
                                color: #000080;
                                font-size: 1.25vw;
                                font-weight: 400;" id="stock">'16/03/2024'</span>
                            </span>
                        </div>
                    </div>
                    <div class="price">
                        <span><i class="fa-solid fa-indian-rupee-sign"></i>400</span>
                    </div>
                </div>
                <div class="confirm d-flex justify-content-center">
                    <form style="padding: 0;" action="orders.jsp" method="get">
                        <input type="hidden" name="id" value="<%= bookId %>">
                        <input type="hidden" name="img" value="<%= imgUrl %>">
                        <input type="hidden" name="name" value="<%= name %>">
                        <input type="hidden" name="price" value="<%= price %>">
                        <input type="hidden" name="stock" value="<%= stock %>">
                        <button type="submit" style="width: 100%;">Delivered</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>