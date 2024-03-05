<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/admin-presentation/css/addBook.css">
    <script src="assets/admin-presentation/js/addBook.js"></script>
    <title>Document</title>
</head>
<body>
    <section style="background-color: #00000066;
    top: 0;">
        <div id="add-book-form" class="add-book-form d-flex justify-content-center">
            <div class="form position-relative">
                <p class="position-absolute" onclick="addCard(2)"><i class="fa-solid fa-x"></i></p>
                <h1 class="position-sticky">Add New Book</h1>
                <form class="d-flex flex-column" action="addBook" method="post" enctype="multipart/form-data">
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="name1">
                            Name
                        </span>
                        <input type="text" name="name" id="name" 
                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="author1">
                            Author
                        </span>
                        <input type="text" name="author" id="author" 
                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="publisher1">
                            Publisher
                        </span>
                        <input type="text" name="publisher" id="publisher" 
                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="edition1">
                            Edition
                        </span>
                        <input type="text" name="edition" id="edition" 
                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="description1" style="top: 15%;">
                            Description
                        </span>
                        <textarea name="description" id="description" cols="30" rows="10"
                        onfocus="textAreaPlaceholderOut(this)" onblur="textAreaPlaceholderIn(this)"
                        style="padding: 3vw 1vw; "></textarea>
                    </div>
                    <div class="radio-type d-flex">
                        <div class="type">
                            <input type="radio" name="type" id="java" value="java">
                            <label for="java">Java</label>
                        </div>
                        <div class="type">
                            <input type="radio" name="type" id="python" value="python">
                            <label for="python">Python</label>
                        </div>
                        <div class="type">
                            <input type="radio" name="type" id="cpp" value="cpp">
                            <label for="cpp">C++</label>
                        </div>
                        <div class="type">
                            <input type="radio" name="type" id="c" value="c">
                            <label for="c">C</label>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="price1">
                            Price
                        </span>
                        <input type="number" name="price" id="price" 
                        onfocus="placeholderOut(this)" onblur="placeholderIn(this)">
                    </div>
                    <div class="q-in d-flex justify-content-center">
                        <i class="fa-solid fa-minus" onclick="quantity(2)" style="cursor: pointer;"></i>
                        <input type="number" name="quantity" id="quantity" value="1">
                        <i class="fa-solid fa-plus" onclick="quantity(1)" style="cursor: pointer;"></i>
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <span class="position-absolute" id="price1">
                            Upload
                        </span>
                        <input type="file" name="file" id="file">
                    </div>
                    <div class="d-flex justify-content-center form-input position-relative">
                        <button type="submit">SUBMIT</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>