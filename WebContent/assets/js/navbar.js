let check = 0;
function showCategories(){
    if(check==0){
        document.getElementById("category-drop").style.display = "block";
        console.log(check);
        check++;
    }
    else{
        document.getElementById("category-drop").style.display = "none";
        console.log(check);
        check--;
    }
}
function showContent(x){
    let carousel = document.getElementById("book-carousel");
    let carouselSlide = document.getElementById("carousel-slide");
    let java = document.getElementById("java-books");
    let python = document.getElementById("python-books");
    let cpp = document.getElementById("cpp-books");
    let c = document.getElementById("c-books");

    let homeUnder = document.getElementById("home-under");
    let javaUnder = document.getElementById("java-under");
    let pythonUnder = document.getElementById("python-under");
    let cppUnder = document.getElementById("cpp-under");
    let cUnder = document.getElementById("c-under");

    document.getElementById("category-drop").style.display = "none";
    check=0;

    switch(x){
        case 1:
            carousel.style.display = "block";
            carouselSlide.style.display = "flex";
            carouselSlide.style.justifyContent = "center";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.backgroundColor = "white";
            homeUnder.style.color = "#000080";
            javaUnder.style.backgroundColor = "";
            javaUnder.style.color = "";
            pythonUnder.style.backgroundColor = "";
            pythonUnder.style.color = "";
            cppUnder.style.backgroundColor = "";
            cppUnder.style.color = "";
            cUnder.style.backgroundColor = "";
            cUnder.style.color = "";
            break;

        case 2:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "block";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.backgroundColor = "";
            homeUnder.style.color = "";
            javaUnder.style.backgroundColor = "white";
            javaUnder.style.color = "#000080";
            pythonUnder.style.backgroundColor = "";
            pythonUnder.style.color = "";
            cppUnder.style.backgroundColor = "";
            cppUnder.style.color = "";
            cUnder.style.backgroundColor = "";
            cUnder.style.color = "";
            break;

        case 3:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "block";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.backgroundColor = "";
            homeUnder.style.color = "";
            javaUnder.style.backgroundColor = "";
            javaUnder.style.color = "";
            pythonUnder.style.backgroundColor = "white";
            pythonUnder.style.color = "#000080";
            cppUnder.style.backgroundColor = "";
            cppUnder.style.color = "";
            cUnder.style.backgroundColor = "";
            cUnder.style.color = "";
            break;

        case 4:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "block";
            c.style.display = "none";

            homeUnder.style.backgroundColor = "";
            homeUnder.style.color = "";
            javaUnder.style.backgroundColor = "";
            javaUnder.style.color = "";
            pythonUnder.style.backgroundColor = "";
            pythonUnder.style.color = "";
            cppUnder.style.backgroundColor = "white";
            cppUnder.style.color = "#000080";
            cUnder.style.backgroundColor = "";
            cUnder.style.color = "";
            break;
        
        case 5:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "block";

            homeUnder.style.backgroundColor = "";
            homeUnder.style.color = "";
            javaUnder.style.backgroundColor = "";
            javaUnder.style.color = "";
            pythonUnder.style.backgroundColor = "";
            pythonUnder.style.color = "";
            cppUnder.style.backgroundColor = "";
            cppUnder.style.color = "";
            cUnder.style.backgroundColor = "white";
            cUnder.style.color = "#000080";
            break;
    }
}