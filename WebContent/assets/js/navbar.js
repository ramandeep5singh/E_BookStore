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
    let carousel = document.getElementById("carousel");
    let java = document.getElementById("java-books");
    let python = document.getElementById("python-books");
    let cpp = document.getElementById("cpp-books");
    let c = document.getElementById("c-books");

    document.getElementById("category-drop").style.display = "none";
    check=0;

    switch(x){
        case 1:
            carousel.style.display = "block";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";
            break;

        case 2:
            carousel.style.display = "none";
            java.style.display = "block";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "none";
            break;

        case 3:
            carousel.style.display = "none";
            java.style.display = "none";
            python.style.display = "block";
            cpp.style.display = "none";
            c.style.display = "none";
            break;

        case 4:
            carousel.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "block";
            c.style.display = "none";
            break;
        
        case 5:
            carousel.style.display = "none";
            java.style.display = "none";
            python.style.display = "none";
            cpp.style.display = "none";
            c.style.display = "block";
            break;
    }
}