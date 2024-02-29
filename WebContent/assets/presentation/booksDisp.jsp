<%@ page import="java.util.Map, bookPack.Book" %>
<jsp:useBean id="books" class="displayBeanPack.DisplayBooksBean"></jsp:useBean>
<%
	Map<Integer,Book> java = books.getJavaBooks();
	Map<Integer,Book> python = books.getPythonBooks();
	Map<Integer,Book> cpp = books.getCppBooks();
	Map<Integer,Book> c = books.getCBooks();
%>
<section class="books">
    <section class="category-section" id="java">
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
                    <!-- <div class="buy-check row">
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="checkExistence()">Buy Now</button>
                        </div>
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="return checkExistence()">Add to Cart</button>
                        </div>
                    </div> -->
                    <form action="assets/presentation/bookDetails.jsp" method="get" style="display: flex;
                    justify-content: center;">
                        <input type="hidden" name="id" value="<%= key %>">
                        <input type="hidden" name="name" value="<%= book.getName() %>">
                        <input type="hidden" name="price" value="<%= book.getPrice() %>">
                        <input type="hidden" name="img-url" value="<%= book.getImgUrl() %>">
                        <input type="hidden" name="author" value="<%= book.getAuthor() %>">
                        <input type="hidden" name="publisher" value="<%= book.getPublisher() %>">
                        <input type="hidden" name="description" value="<%= book.getDescription() %>">
                        <input type="hidden" name="edition" value="<%= book.getEdition() %>">
                        <input type="hidden" name="stock" value="<%= book.getStock() %>">
                        <button type="submit" style="color: #000080;
                        border: none;
                        outline: none;
                        background: transparent;">More Info&nbsp<i class="fa-solid fa-arrow-right"></i></button>
                    </form>
                </div>
            <%
                }
            %> 
        </div>
    </section>
    <section class="category-section" id="python">
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
                    <!-- <div class="buy-check row">
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="checkExistence()">Buy Now</button>
                        </div>
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="return checkExistence()">Add to Cart</button>
                        </div>
                    </div> -->
                    <form action="assets/presentation/bookDetails.jsp" method="get" style="display: flex;
                    justify-content: center;">
                        <input type="hidden" name="id" value="<%= key %>">
                        <input type="hidden" name="name" value="<%= book.getName() %>">
                        <input type="hidden" name="price" value="<%= book.getPrice() %>">
                        <input type="hidden" name="img-url" value="<%= book.getImgUrl() %>">
                        <input type="hidden" name="author" value="<%= book.getAuthor() %>">
                        <input type="hidden" name="publisher" value="<%= book.getPublisher() %>">
                        <input type="hidden" name="description" value="<%= book.getDescription() %>">
                        <input type="hidden" name="edition" value="<%= book.getEdition() %>">
                        <input type="hidden" name="stock" value="<%= book.getStock() %>">
                        <button type="submit" style="color: #000080;
                        border: none;
                        outline: none;
                        background: transparent;">More Info&nbsp<i class="fa-solid fa-arrow-right"></i></button>
                    </form>
                </div>
            <%
                }
            %> 
        </div>
    </section>
    <section class="category-section" id="cpp">
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
                    <!-- <div class="buy-check row">
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="checkExistence()">Buy Now</button>
                        </div>
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="return checkExistence()">Add to Cart</button>
                        </div>
                    </div> -->
                    <form action="assets/presentation/bookDetails.jsp" method="get" style="display: flex;
                    justify-content: center;">
                        <input type="hidden" name="id" value="<%= key %>">
                        <input type="hidden" name="name" value="<%= book.getName() %>">
                        <input type="hidden" name="price" value="<%= book.getPrice() %>">
                        <input type="hidden" name="img-url" value="<%= book.getImgUrl() %>">
                        <input type="hidden" name="author" value="<%= book.getAuthor() %>">
                        <input type="hidden" name="publisher" value="<%= book.getPublisher() %>">
                        <input type="hidden" name="description" value="<%= book.getDescription() %>">
                        <input type="hidden" name="edition" value="<%= book.getEdition() %>">
                        <input type="hidden" name="stock" value="<%= book.getStock() %>">
                        <button type="submit" style="color: #000080;
                        border: none;
                        outline: none;
                        background: transparent;">More Info&nbsp<i class="fa-solid fa-arrow-right"></i></button>
                    </form>
                </div>
            <%
                }
            %> 
        </div>
    </section>
    <section class="category-section" id="c">
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
                    <!-- <div class="buy-check row">
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="checkExistence()">Buy Now</button>
                        </div>
                        <div class="book-button col-md-6 col-sm-12 col-6">
                            <button onclick="return checkExistence()">Add to Cart</button>
                        </div>
                    </div> -->
                    <form action="assets/presentation/bookDetails.jsp" method="get" style="display: flex;
                    justify-content: center;">
                        <input type="hidden" name="id" value="<%= key %>">
                        <input type="hidden" name="name" value="<%= book.getName() %>">
                        <input type="hidden" name="price" value="<%= book.getPrice() %>">
                        <input type="hidden" name="img-url" value="<%= book.getImgUrl() %>">
                        <input type="hidden" name="author" value="<%= book.getAuthor() %>">
                        <input type="hidden" name="publisher" value="<%= book.getPublisher() %>">
                        <input type="hidden" name="description" value="<%= book.getDescription() %>">
                        <input type="hidden" name="edition" value="<%= book.getEdition() %>">
                        <input type="hidden" name="stock" value="<%= book.getStock() %>">
                        <button type="submit" style="color: #000080;
                        border: none;
                        outline: none;
                        background: transparent;">More Info&nbsp<i class="fa-solid fa-arrow-right"></i></button>
                    </form>
                </div>
            <%
                }
            %>
        </div>
    </section>
</section>