<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/admin-presentation/css/admin.css">
    <script src="assets/admin-presentation/js/admin.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="home d-flex">
        <div class="admin-action col-md-6 col-12">
            <div class="action">
                <button><i class="fa-solid fa-plus" onclick="addCard(1)"></i>&nbspAdd</button>
            </div>
        </div>
        <div class="admin-action col-md-6 col-12">
            <div class="action">
                <button onclick="window.location.href = 'assets/admin-presentation/adminOrders.jsp'"><i class="fa-solid fa-sort"></i>&nbspOrders</button>
            </div>
        </div>
    </div>
</body>
</html>