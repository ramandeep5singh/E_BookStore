function showLogin(){
    let type = document.querySelectorAll('input[name=access-type]');
    let flag = 0;

    type.forEach(function(type) {
        if(type.checked){
            if(type.value=="admin"){
                flag = 1;

                document.getElementById("admin-user").style.display = "none";
                document.getElementById("next-button").style.display = "none";

                document.getElementById("admin-login").style.display = "block";
                document.getElementById("customer-login").style.display = "none";
            }
            else if(type.value=="customer"){
                flag = 1;

                document.getElementById("admin-user").style.display = "none";
                document.getElementById("next-button").style.display = "none";

                document.getElementById("admin-login").style.display = "none";
                document.getElementById("customer-login").style.display = "block"; 
            }
        }
    })

    if(flag==0){
        alert("Nothing Selected!!");
    }
}