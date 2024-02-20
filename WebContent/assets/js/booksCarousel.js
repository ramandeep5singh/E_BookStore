let active1 = document.getElementById("active-1");
let active2 = document.getElementById("active-2");
let active3 = document.getElementById("active-3");

let activeSlide1 = document.getElementById("active-slide-1");
let activeSlide2 = document.getElementById("active-slide-2");
let activeSlide3 = document.getElementById("active-slide-3");

function activeBlock(x){
    let active1 = document.getElementById("active-1");
    let active2 = document.getElementById("active-2");
    let active3 = document.getElementById("active-3");

    let activeSlide1 = document.getElementById("active-slide-1");
    let activeSlide2 = document.getElementById("active-slide-2");
    let activeSlide3 = document.getElementById("active-slide-3");

    switch(x){
        case 1:
            activeSlide1.style.backgroundColor = "#000080";
            activeSlide2.style.backgroundColor = "#0000806e";
            activeSlide3.style.backgroundColor = "#0000806e";

            active1.style.width = "";
            active1.style.height = "";
            active1.style.transform = "translate(-50%, -50%)";
            active1.style.transformOrigin = "";
            active1.style.left = "50%";
            active1.style.top = "50%";
            active1.style.right = "";

            active2.style.right = "0";
            active2.style.top = "0";
            active2.style.left = "";
            active2.style.width = "25%";
            active2.style.height = "100%";
            active2.style.transform = "perspective(50vw) rotateY(-30deg)";
            active2.style.transformOrigin = "right";

            active3.style.display = "none";
            break;

        case 2:
            activeSlide1.style.backgroundColor = "#0000806e";
            activeSlide2.style.backgroundColor = "#000080";
            activeSlide3.style.backgroundColor = "#0000806e";

            active1.style.display = "flex";
            active1.style.left = "0";
            active1.style.top = "0";
            active1.style.width = "25%";
            active1.style.height = "100%";
            active1.style.transform = "perspective(50vw) rotateY(30deg)";
            active1.style.transformOrigin = "left";

            active2.style.width = "";
            active2.style.height = "";
            active2.style.transform = "translate(-50%, -50%)";
            active2.style.transformOrigin = "";
            active2.style.left = "50%";
            active2.style.top = "50%";
            active2.style.right = "";

            active3.style.display = "flex";
            active3.style.right = "0";
            active3.style.top = "0";
            active3.style.left = "";
            active3.style.width = "25%";
            active3.style.height = "100%";
            active3.style.transform = "perspective(50vw) rotateY(-30deg)";
            active3.style.transformOrigin = "right";

            break;

        case 3:
            activeSlide1.style.backgroundColor = "#0000806e";
            activeSlide2.style.backgroundColor = "#0000806e";
            activeSlide3.style.backgroundColor = "#000080";

            active1.style.display = "none";

            active2.style.position = "absolute";
            active2.style.left = "0";
            active2.style.top = "0";
            active2.style.width = "25%";
            active2.style.height = "100%";
            active2.style.transform = "perspective(50vw) rotateY(30deg)";
            active2.style.transformOrigin = "left";

            active3.style.width = "";
            active3.style.height = "";
            active3.style.transform = "translate(-50%, -50%)";
            active3.style.transformOrigin = "";
            active3.style.left = "50%";
            active3.style.top = "50%";
            active3.style.right = "";

            break;
    }
}