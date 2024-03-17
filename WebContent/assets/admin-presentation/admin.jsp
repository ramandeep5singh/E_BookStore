<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/addBook.css">
    <link rel="stylesheet" href="css/adminOrders.css" >
    <script src="js/admin.js"></script>
    <script src="js/addBook.js"></script>
    <title>Document</title>
</head>
<body class="d-md-flex d-none" style="height: 100vh;">
    <section class="admin-nav col-3">
        <jsp:include page="adminNav.html" />
    </section>
    <section id="l11" class="admin-view col-9" style="overflow: auto;">
        <jsp:include page="dashboard.jsp" />
    </section>
    <section id="l22" class="col-9" style="overflow: auto; display: none;">
        <jsp:include page="addBook.html" />
    </section>
    <section id="l33" class="col-9" style="overflow: auto; display: none;">
        <jsp:include page="adminOrders.jsp" />
    </section>
    <section id="l44" class="col-9" style="overflow: auto; display: none;">
        <jsp:include page="acknowledge.jsp" />
    </section>
    <section id="l55" class="col-9" style="overflow: auto; display: none;">
        <jsp:include page="delivered.jsp" />
    </section>
</body>
</html>