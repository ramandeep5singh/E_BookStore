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
        <%  if(userName==null){ %>
            <div class="ribbon-span" style="margin-left: 1vw;">
                <span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
                <span class="count-cart">0</span>
            </div>
        <%  }
            else if(!userName.equals("admin")){ %>
                <div class="ribbon-span" style="margin-left: 1vw;">
                    <span><i class="fa-solid fa-cart-shopping"></i>&nbspCart</span>
                    <span class="count-cart">0</span>
                </div>
        <%  } %>
    </div>
</section>
<section class="nav position-relative">
    <div class="small-nav d-flex justify-content-between position-relative">
        <div class="logo-categories d-flex">
            <img src="assets/bookStoreLogo.png" alt="logo" />
            <div class="categories">
                <ul class="d-flex" style="margin: 0;">
                    <li id="home-under" onclick="showContent(1)">
                        <a class="position-relative">Home
                            <div id="home-under1" class="category-bottom position-absolute" style="width: 100%;"></div>
                        </a>
                    </li>
                    <li id="java-under" onclick="showContent(2)">
                        <a class="position-relative">Java
                            <div class="category-bottom position-absolute"></div>
                        </a>
                    </li>
                    <li id="python-under" onclick="showContent(3)">
                        <a class="position-relative">Python
                            <div class="category-bottom position-absolute"></div>
                        </a>
                    </li>
                    <li id="cpp-under" onclick="showContent(4)">
                        <a class="position-relative">C++
                            <div class="category-bottom position-absolute"></div>
                        </a>
                    </li>
                    <li id="c-under" onclick="showContent(5)" style="padding: 0 2px;">
                        <a class="position-relative">C
                            <div class="category-bottom position-absolute"></div>
                        </a>
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