<%@ page import="java.util.Map, bookPack.Book" %>
<jsp:useBean id="books" class="displayBeanPack.displayBooksBean"></jsp:useBean>
<%
	Map<Integer,Book> java = books.getJavaBooks();
	Map<Integer,Book> python = books.getPythonBooks();
	Map<Integer,Book> cpp = books.getCppBooks();
	Map<Integer,Book> c = books.getCBooks();
%>
<section class="books">
    <section id="java">
        <p class="subject-heading">JAVA</p>
        <div id="java" class="books-contain row">
            <%
                for(Map.Entry<Integer,Book> entry : java.entrySet()){
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
    <section id="python">
        <p class="subject-heading">PYTHON</p>
        <div class="books-contain row">
            <%
                for(Map.Entry<Integer,Book> entry : python.entrySet()){
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
    <section id="cpp">
        <p class="subject-heading">CPP</p>
        <div class="books-contain row">
            <%
                for(Map.Entry<Integer,Book> entry : cpp.entrySet()){
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
    <section id="c">
        <span class="subject-heading">C</span>
        <div class="books-contain row">
            <%
                for(Map.Entry<Integer,Book> entry : c.entrySet()){
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
</section>