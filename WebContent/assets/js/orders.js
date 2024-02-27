function placeholderOut(element){
    let elementId = document.getElementById(element.id+"1");

    elementId.style.transform = "";
    elementId.style.left = "0";
    elementId.style.top = "-2px";
    elementId.style.color = "#000080";
    elementId.style.fontWeight = "bold";    
}
function placeholderIn(element){
    let input = document.getElementById(element.id);
    let elementId = document.getElementById(element.id+"1");

    if(input.value == ""){ 
        elementId.style.transform = "translatey(-50%)";
        elementId.style.left = "7px";
        elementId.style.top = "50%";
        elementId.style.color = "grey";
        elementId.style.fontWeight = "";
    }
}
function change(x){
    let addressForm = document.getElementById("address-form");
    let addressSelected = document.getElementById("address-selected");
    let cancelAddress = document.getElementById("cancel-address");

    if(x==1){
        addressForm.style.display = "block";
        addressSelected.style.display = "none";
        cancelAddress.style.display = "block";
    }
    else{
        addressForm.style.display = "none";
        addressSelected.style.display = "block";
        cancelAddress.style.display = "none";
    }
}
function quantity(x){
    let quantity = document.getElementById("quantity");
    let maxQuant = document.getElementById("stock").textContent;

    if(x==1){
        count++;
        if(count>maxQuant){
            alert("Out of stock!!");
        }
        else{
            quantity.value = count;
        }
    }
    else{
        count--;
        if(count==0){
            alert("purchase atleast one item!!");
        }
        else{
            quantity.value = count;
        }
    }
}
function showSummary(){
    let orderSummary = document.getElementById("order-summary");
    let addressSummary = document.getElementById("address-summary");

    orderSummary.style.display = "none";
    orderSummary.style.display = "flex";
    document.getElementById("address-confirm").style.display = "none";
}
 /*AJAX FORM SUBMISSION*/
document.getElementById("ajax-form").addEventListener("submit",function(event){
    event.preventDefault();

    let formData = new FormData(this);

    let xhr = new XMLHttpRequest();
    xhr.open("POST","login");
    xhr.onload = function(){
        if(xhr.status === 200){
            window.location.reload();
        }
        else{
            alert("Wrong Credentials");
        }
    };
    xhr.send(formData);
});