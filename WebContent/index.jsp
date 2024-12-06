<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<%  
    Cookie[] cookies = request.getCookies();
    
    String email = "";
    String userName = "";
    String phone = "";
    String address = "";

    if(session!=null){
        userName = (String)session.getAttribute("name");
        phone = (String)session.getAttribute("phone");
        address = (String)session.getAttribute("address");
    }

    if(cookies!=null){
        for(Cookie cookie : cookies){ 
            if("email".equals(cookie.getName())){
                email = cookie.getValue();
            }
        }
    }
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
    <script src="assets/js/index.js"></script>
    <script src="assets/js/navbar.js"></script>
    <script src="assets/js/booksDisp.js"></script>
    <script language="JavaScript">
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
        function profileCard(x){
            let card = document.getElementById("profile-card")

            if(x==1){
                card.style.display = "block";
            }
            else{
                card.style.display = "none";
            }
        }
    </script>
    <title>E_BookStore</title>
</head>
<style>
    .profile-card{
        display: none;
        position: absolute;
        z-index: 10;
        background-color: white;
        color: #000080;
        width: auto;
        right: 16vw;
        padding: 1.5vw;
        border: 0.2vw solid #000080;
    }
    .profile-card p{
        top: 0;
        left: 0;
        text-align: end;
        width: 100%;
        margin: 0;
        color: red;
        cursor: auto;
    }
    .profile-card p>i{
        cursor: pointer;
        padding-right: 1vw;
        padding-top: 0.5vw;
    }
    .profile-card span{
        justify-content: space-between;
        align-items: center;
        font-size: 1.2vw;
        padding: 1vw 0;
    }
    .profile-card span>i{
        font-size: 2vw;
    }
    .logout a{
        text-decoration: none;
        font-weight: bold;
        letter-spacing: 2px;
        color: white;
        background: #000080;
        padding: 0.25vw 0.5vw;
        border-radius: 0.5vw;
        border: 2px solid #000080;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
    }
    .logout a:hover{
        background-color: white;
        color: #000080;
    }
</style>
<body style="margin: 0;">
    <div id="profile-card" class="profile-card position-absolute">
        <p style="top: 0;
        left: 0;" class="position-absolute"><i onclick="profileCard(2)" class="fa-solid fa-xmark"></i></p>
        <span class="d-flex"><i class="fa-regular fa-user"></i><%= userName %></span>
        <span class="d-flex"><i class="fa-solid fa-phone"></i><%= phone %></span>
        <span class="d-flex"><i class="fa-solid fa-location-dot"></i></i><%= address %></span>
        <div class="logout d-flex justify-content-center">
            <a href="logout.jsp">SIGNOUT</a>
        </div>
        <a class="d-none" href="update.jsp">Update</a>
    </div>
	<!-- <section id="scroll-nav" class="scroll-nav">
        <jsp:include page="assets/presentation/navbar.jsp" />
    </section> -->
	<section class="position-absolute" style="width: 100%; top: 0; height: 100%;">
		<jsp:include page="assets/presentation/navbar.jsp" />
        <div class="position-relative">
	<%  if(userName==null || !userName.equals("admin")){ %> 
        <div class="position-relative">
            <jsp:include page="assets/presentation/booksCarousel.jsp" />
            <jsp:include page="assets/presentation/booksDisp.jsp" />
        </div>
        
	<%  }
        else{ %>
        <div class="position-relative" style="height: 74%;">
            <jsp:include page="assets/admin-presentation/admin.jsp" />
            <jsp:include page="assets/presentation/booksDisp.jsp" />
        </div>
    <%  } %>
	</section>
</body>
</html>