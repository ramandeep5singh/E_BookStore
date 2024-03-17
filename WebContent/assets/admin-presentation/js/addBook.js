function placeholderOut(element){
    let elementId = document.getElementById(element.id+"1");

    elementId.style.transform = "";
    elementId.style.left = "10%";
    elementId.style.top = "25%";
    elementId.style.zIndex = "10";
    elementId.style.color = "#000080";
    elementId.style.fontWeight = "bold"; 
    elementId.style.fontSize = "1.5vw";
    elementId.style.letterSpacing = "6px";    


}
function placeholderIn(element){
    let input = document.getElementById(element.id);
    let elementId = document.getElementById(element.id+"1");

    if(input.value == ""){ 
        elementId.style.transform = "translatey(-50%)";
        elementId.style.left = "15%";
        elementId.style.top = "50%";
        elementId.style.color = "grey";
        elementId.style.fontWeight = "";
        elementId.style.fontSize = "";
        elementId.style.letterSpacing = ""; 
    }
}
function textAreaPlaceholderOut(element){
    let elementId = document.getElementById(element.id+"1");
    
    elementId.style.transform = "";
    elementId.style.left = "10%";
    elementId.style.top = "2%";
    elementId.style.zIndex = "10";
    elementId.style.color = "#000080";
    elementId.style.fontWeight = "bold"; 
    elementId.style.fontSize = "1.5vw";
    elementId.style.letterSpacing = "6px";
}
function textAreaPlaceholderIn(element){
    let input = document.getElementById(element.id);
    let elementId = document.getElementById(element.id+"1");

    if(input.value == ""){ 
        elementId.style.transform = "translatey(-50%)";
        elementId.style.left = "15%";
        elementId.style.top = "15%";
        elementId.style.color = "grey";
        elementId.style.fontWeight = "";
        elementId.style.fontSize = "";
        elementId.style.letterSpacing = ""; 
    }
}

function quantity(x){
    let quantity = document.getElementById("quantity");
    let count = parseInt(quantity.value);

    if(x==1){
        count++;
        quantity.value = count;
    }
    else{
        if(quantity.value == 1){
            alert("Invalid!!");
        }
        else{
            count--;
            quantity.value = count;
        }
    }
}
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById("file").addEventListener('change', function() {
        let file = this.files[0];
        let chooseFileLabel = document.getElementById('choose-file-label');

        if (file) {
            chooseFileLabel.innerText = file.name;
        } else {
            chooseFileLabel.innerText = "Choose File";
        }
    });
});