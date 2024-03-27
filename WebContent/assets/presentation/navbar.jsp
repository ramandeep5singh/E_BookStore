<%@ page import="java.io.File" %>
  
   <% Cookie[] cookies = request.getCookies();
    
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
    <div class="small-nav d-flex justify-content-between position-relative">
        <div class="logo-categories d-flex justify-content-between">
            <img src="assets/bookStoreLogo.png" alt="logo" />
            <div class="categories position-relative">
                <span onclick="showCategories()">
                    CATEGORIES&nbsp<i class="fa-solid fa-caret-down"></i>
                </span>
                <span onclick="window.location.href='assets/presentation/userOrders.jsp'">
                    MY ORDERS
                </span>
                <ul id="category-drop" class="position-absolute category-drop">
                    <li onclick="showContent(1)" style="margin-top: 0;">
                        <a id="home-under" class="position-relative" style="background-color: white;
                        color: #000080;">Home</a>
                    </li>
                    <li onclick="showContent(2)">
                        <a id="java-under" class="position-relative">Java</a>
                    </li>
                    <li onclick="showContent(3)">
                        <a id="python-under" class="position-relative">Python</a>
                    </li>
                    <li onclick="showContent(4)">
                        <a id="cpp-under" class="position-relative">C++</a>
                    </li>
                    <li onclick="showContent(5)" style="margin-bottom: 0;">
                        <a id="c-under" class="position-relative">C</a>
                    </li>
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