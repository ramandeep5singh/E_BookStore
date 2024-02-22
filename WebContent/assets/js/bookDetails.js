let count = 1;

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
function proceedPurchase(){
    let userEmail = document.getElementById("user-email").textContent;

    if(userEmail == "null"){
        window.location.href = "../../login.jsp";
    }
    else{
        console.log(userEmail);
        alert("ordered successfully!!");
    }
}