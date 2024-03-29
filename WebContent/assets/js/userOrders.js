window.onload = function(){
    let status = document.getElementById("status").value;
    if(status!=1){
        document.getElementById("cancelOrder").disabled;
    }
}