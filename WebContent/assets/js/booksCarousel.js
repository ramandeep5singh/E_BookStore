window.onload = function() {
    setInterval(changeSlide,4000);
};
let slide = 2;
function changeSlide(){
    let s1 = document.getElementById("s1");
    let s2 = document.getElementById("s2");
    let s3 = document.getElementById("s3");

    let sb1 = document.getElementById("sb1");
    let sb2 = document.getElementById("sb2");
    let sb3 = document.getElementById("sb3");

    switch(slide){
        case 1:
            s1.style.display = "flex";
            s2.style.display = "none";
            s3.style.display = "none";

            sb1.style.backgroundColor = "black";
            sb2.style.backgroundColor = "grey";
            sb3.style.backgroundColor = "grey";

            slide++;
            break;
            
        case 2:
            s1.style.display = "none";
            s2.style.display = "flex";
            s3.style.display = "none";

            sb1.style.backgroundColor = "grey";
            sb2.style.backgroundColor = "black";
            sb3.style.backgroundColor = "grey";

            slide++;
            break;

        case 3:
            s1.style.display = "none";
            s2.style.display = "none";
            s3.style.display = "flex";

            sb1.style.backgroundColor = "grey";
            sb2.style.backgroundColor = "grey";
            sb3.style.backgroundColor = "black";

            slide=1;
            break;
    }
}