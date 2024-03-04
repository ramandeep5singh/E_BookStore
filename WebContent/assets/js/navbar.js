function showContent(x){
    let carousel = document.getElementById("book-carousel");
    let carouselSlide = document.getElementById("carousel-slide");
    let java = document.getElementById("java-books");
    let python = document.getElementById("python-books");
    let cpp = document.getElementById("cpp-books");
    let c = document.getElementById("c-books");

    let homeUnder = document.getElementById("home-under");
    let homeUnder1 = document.getElementById("home-under1");
    let javaUnder = document.getElementById("java-under");
    let pythonUnder = document.getElementById("python-under");
    let cppUnder = document.getElementById("cpp-under");
    let cUnder = document.getElementById("c-under");

    switch(x){
        case 1:
            carousel.style.display = "block";
            carouselSlide.style.display = "flex";
            carouselSlide.style.justifyContent = "center";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.borderBottom = "3px solid red";
            homeUnder1.style.borderBottom = "none";
            javaUnder.style.borderBottom = "none";
            pythonUnder.style.borderBottom = "none";
            cppUnder.style.borderBottom = "none";
            cUnder.style.borderBottom = "none";
            break;

        case 2:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "block";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.borderBottom = "none";
            homeUnder1.style.borderBottom = "none";
            javaUnder.style.borderBottom = "3px solid red";
            pythonUnder.style.borderBottom = "none";
            cppUnder.style.borderBottom = "none";
            cUnder.style.borderBottom = "none";
            break;

        case 3:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "block";
            cpp.style.display = "none";
            c.style.display = "none";

            homeUnder.style.borderBottom = "none";
            homeUnder1.style.borderBottom = "none";
            javaUnder.style.borderBottom = "none";
            pythonUnder.style.borderBottom = "3px solid red";
            cppUnder.style.borderBottom = "none";
            cUnder.style.borderBottom = "none";
            break;

        case 4:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "block";
            c.style.display = "none";

            homeUnder.style.borderBottom = "none";
            homeUnder1.style.borderBottom = "none";
            javaUnder.style.borderBottom = "none";
            pythonUnder.style.borderBottom = "none";
            cppUnder.style.borderBottom = "3px solid red";
            cUnder.style.borderBottom = "none";
            break;
        
        case 5:
            carousel.style.display = "none";
            carouselSlide.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "block";

            homeUnder.style.borderBottom = "none";
            homeUnder1.style.borderBottom = "none";
            javaUnder.style.borderBottom = "none";
            pythonUnder.style.borderBottom = "none";
            cppUnder.style.borderBottom = "none";
            cUnder.style.borderBottom = "3px solid red";
            break;
    }
}