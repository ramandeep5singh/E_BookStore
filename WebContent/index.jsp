<%@ page import="java.util.Map, bookPack.Book" %>
<jsp:useBean id="books" class="displayBeanPack.displayBooksBean"></jsp:useBean>
<%
	Map<Integer,Book> h = books.getBooks();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/index.css">
    <title>E_BookStore</title>
</head>
<script src="assets/js/index.js"></script>
<body style="margin: 0;">
	<section style="background: #000080;
	z-index: 10;">
		<div class="nav-ribbon d-flex justify-content-end container">
	   		<div class="ribbon-span" >
	   			<span onclick="window.location.href='login.jsp'"><i class="fa-solid fa-user"></i>&nbspSign In</span>
	   		</div>
	   		<div class="ribbon-span" style="margin-left: 1vw;">
	   			<span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
	   			<span class="count-cart">0</span>
	   		</div>
		</div>
	</section>
    <section class="nav position-relative">
        <div class="small-nav d-flex justify-content-between position-relative">
            <div class="logo-categories d-flex">
            	<img src="assets/bookStoreLogo.png" alt="logo" />
            	<div class="categories">
            		<ul class="d-flex" style="margin: 0;">
            			<li>Java<div class="category-bottom position-absolute"></div></li>
            			<li>Python<div class="category-bottom position-absolute"></div></li>
            			<li>C++<div class="category-bottom position-absolute"></div></li>
            			<li style="padding: 0 2px;">C<div class="category-bottom position-absolute"></div></li>
            		</ul>
            	</div>
            </div>
            <div class="search">
            	<div class="d-flex" style="width: 100%;">
            		<div class="search-input">
	            		<input type="text" name="search" placeholder="Search by Name, Title or Author" />
	            	</div>
	            	<div class="search-icon">
	            		<i class="fa-solid fa-magnifying-glass"></i>
	            	</div>
            	</div>
            </div>
        </div>
    </section>
    <section class="books">
        <div class="books-contain row">
            <%
	            for(Map.Entry<Integer,Book> entry : h.entrySet()){
	            	Integer key = entry.getKey();
	            	Book book = entry.getValue();
            %>
	           	<div class="book d-flex flex-column col-md-4 col-sm-6">
	                <img src="<%= book.getImgUrl() %>" alt="" style="align-self:center;">
	                <span><%= book.getName() %></span>
	                <span>Rs. <%= book.getPrice() %></span>
	                <div class="buy-check row">
	                    <div class="book-button col-md-6 col-sm-12 col-6">
	                        <button onclick="checkExistence()">Buy Now</button>
	                    </div>
	                    <div class="book-button col-md-6 col-sm-12 col-6">
	                        <button onclick="return checkExistence()">Add to Cart</button>
	                    </div>
	                </div>
	                <a href="">More Info&nbsp<i class="fa-solid fa-arrow-right"></i></a>
	            </div>
            <%
	            }
            %> 
        </div>
    </section>
</body>
</html>