<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/orders.css">
    <title>E_BookStore</title>
</head>
<body>
    <section class="d-flex" style="height: 100vh;
    width: 100%;">
        <div id="order-summary" class="card-content d-flex col-md-8 col-12" 
        style="padding: 3vw;
        height: fit-content;">
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
                    <span class="stocks">Available Stock: 
                        <span style="background: transparent;color: #000080;
                        font-size: 1.25vw;
                        font-weight: 400;" id="stock">10</span>
                    </span>
                </div>
                <div class="price">
                    <span><i class="fa-solid fa-indian-rupee-sign"></i>500</span>
                </div>
                <div class="confirm d-flex justify-content-center position-absolute">
                    <button class="change-button" style="margin: 0;" onclick="showConfirm()">Order</button>
                </div>
            </div>
        </div>  
        <div class="col-md-4 col-12" style="background-color: #84dbffd1;">
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
            <p style="padding: 1vw;"><i class="fa-solid fa-square-check" 
                style="padding-right: 3px;"></i>
                Safe and secure payments. Easy Returns. 100% Authentic products.
            </p>
        </div>
    </section>
</body>
</html>