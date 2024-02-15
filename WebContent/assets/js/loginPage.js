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
                
                document.getElementById("new-user?").style.display = "block";
            }
        }
    })

    if(flag==0){
        alert("Nothing Selected!!");
    }
}

function checkInput(x){
    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");
    let password = document.getElementById("password");
    let cPassword = document.getElementById("c-password");

    let nameIcon = document.getElementById("name-icon");
    let phoneIcon = document.getElementById("phone-icon");
    let emailIcon = document.getElementById("email-icon");
    let passwordIcon = document.getElementById("password-icon");
    let cPasswordIcon = document.getElementById("c-password-icon");

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    switch(x){
        case 1:
            if(name.value == ""){
                name.style.boxShadow = "0px 0px 10px 1px red";
                nameIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                name.style.boxShadow = "0px 0px 10px 1px green";
                nameIcon.style.boxShadow = "0px 0px 10px 1px green"; 
            }
            break;
        
        case 2:
            if(phone.value == "" || phone.value.length!=10){
                phone.style.boxShadow = "0px 0px 10px 1px red";
                phoneIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                phone.style.boxShadow = "0px 0px 10px 1px green";
                phoneIcon.style.boxShadow = "0px 0px 10px 1px green"; 
            }
            break;

        case 3:
            if(email.value == "" || !(emailPattern.test(email.value))){
                email.style.boxShadow = "0px 0px 10px 1px red";
                emailIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                email.style.boxShadow = "0px 0px 10px 1px green";
                emailIcon.style.boxShadow = "0px 0px 10px 1px green"; 
            }
            break;

        case 4:
            if(password.value == ""){
                password.style.boxShadow = "0px 0px 10px 1px red";
                passwordIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                password.style.boxShadow = "0px 0px 10px 1px green";
                passwordIcon.style.boxShadow = "0px 0px 10px 1px green"; 
            }
            break;
        
        case 5:
            if(cPassword.value == "" || cPassword.value != password.value){
                cPassword.style.boxShadow = "0px 0px 10px 1px red";
                cPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                cPassword.style.boxShadow = "0px 0px 10px 1px green";
                cPasswordIcon.style.boxShadow = "0px 0px 10px 1px green"; 
            }
            break;
    }
}

function checkLoginInput(x){
    let adminInput = document.getElementById("admin-input");
    let aPassword = document.getElementById("a-password");
    let customerInput = document.getElementById("customer-input");
    let cPassword = document.getElementById("c-password");

    let adminIcon = document.getElementById("admin-icon");
    let aPasswordIcon = document.getElementById("a-password-icon");
    let customerIcon = document.getElementById("customer-icon");
    let cPasswordIcon = document.getElementById("c-password-icon");

    switch(x){
        case '11':
            if(adminInput.value == ""){
                adminInput.style.boxShadow = "0px 0px 10px 1px red";
                adminIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                adminInput.style.boxShadow = "0px 0px 10px 1px green";
                adminIcon.style.boxShadow = "0px 0px 10px 1px green";
            }
            break;

        case '12':
            if(aPassword.value == ""){
                aPassword.style.boxShadow = "0px 0px 10px 1px red";
                aPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                aPassword.style.boxShadow = "0px 0px 10px 1px green";
                aPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";
            }
            break;

        case '21':
            if(customerInput.value == ""){
                customerInput.style.boxShadow = "0px 0px 10px 1px red";
                customerIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                customerInput.style.boxShadow = "0px 0px 10px 1px green";
                customerIcon.style.boxShadow = "0px 0px 10px 1px green";
            }
            break;

        case '22':
            if(cPassword.value == ""){
                cPassword.style.boxShadow = "0px 0px 10px 1px red";
                cPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
            }
            else{
                cPassword.style.boxShadow = "0px 0px 10px 1px green";
                cPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";
            }
            break;
    }
}

function checkAdminInputs(){
    let adminInput = document.getElementById("admin-input");
    let aPassword = document.getElementById("a-password");
    let adminIcon = document.getElementById("admin-icon");
    let aPasswordIcon = document.getElementById("a-password-icon");

    let flag = 0;

    if(adminInput.value == "" && aPassword.value != ""){
        adminInput.style.boxShadow = "0px 0px 10px 1px red";
        aPassword.style.boxShadow = "0px 0px 10px 1px green";
        adminIcon.style.boxShadow = "0px 0px 10px 1px red";
        aPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";
    }
    else if(adminInput.value != "" && aPassword.value == ""){
        adminInput.style.boxShadow = "0px 0px 10px 1px green";
        aPassword.style.boxShadow = "0px 0px 10px 1px red";
        adminIcon.style.boxShadow = "0px 0px 10px 1px green";
        aPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
    }
    else if(adminInput.value == "" && aPassword.value == ""){
        adminInput.style.boxShadow = "0px 0px 10px 1px red";
        aPassword.style.boxShadow = "0px 0px 10px 1px red";
        adminIcon.style.boxShadow = "0px 0px 10px 1px red";
        aPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
    }
    else{
        adminInput.style.boxShadow = "0px 0px 10px 1px green";
        aPassword.style.boxShadow = "0px 0px 10px 1px green";
        adminIcon.style.boxShadow = "0px 0px 10px 1px green";
        aPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";

        flag = 1;
    }

    if(flag==1){
        return true;
    }

    return false;
}

function checkCustomerInputs(){
    let customerInput = document.getElementById("customer-input");
    let cPassword = document.getElementById("c-password");
    let customerIcon = document.getElementById("customer-icon");
    let cPasswordIcon = document.getElementById("c-password-icon");

    let flag = 0;

    if(customerInput.value == "" && cPassword.value != ""){
        customerInput.style.boxShadow = "0px 0px 10px 1px red";
        cPassword.style.boxShadow = "0px 0px 10px 1px green";
        customerIcon.style.boxShadow = "0px 0px 10px 1px red";
        cPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";
    }
    else if(customerInput.value != "" && cPassword.value == ""){
        customerInput.style.boxShadow = "0px 0px 10px 1px green";
        cPassword.style.boxShadow = "0px 0px 10px 1px red";
        customerIcon.style.boxShadow = "0px 0px 10px 1px green";
        cPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
    }
    else if(customerInput.value == "" && cPassword.value == ""){
        customerInput.style.boxShadow = "0px 0px 10px 1px red";
        cPassword.style.boxShadow = "0px 0px 10px 1px red";
        customerIcon.style.boxShadow = "0px 0px 10px 1px red";
        cPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";
    }
    else{
        customerInput.style.boxShadow = "0px 0px 10px 1px green";
        cPasswordPassword.style.boxShadow = "0px 0px 10px 1px green";
        customerIcon.style.boxShadow = "0px 0px 10px 1px green";
        cPasswordIcon.style.boxShadow = "0px 0px 10px 1px green";

        flag = 1;
    }

    if(flag==1){
        return true;
    }

    return false;
}

function checkregistration(){
    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");
    let password = document.getElementById("password");
    let cPassword = document.getElementById("c-password");

    let nameIcon = document.getElementById("name-icon");
    let phoneIcon = document.getElementById("phone-icon");
    let emailIcon = document.getElementById("email-icon");
    let passwordIcon = document.getElementById("password-icon");
    let cPasswordIcon = document.getElementById("c-password-icon");

    if(name.value == "" || phone.value == "" || email.value == "" || password.value == "" || cPassword.value == ""){
        name.style.boxShadow = "0px 0px 10px 1px red";
        phone.style.boxShadow = "0px 0px 10px 1px red";
        email.style.boxShadow = "0px 0px 10px 1px red";
        password.style.boxShadow = "0px 0px 10px 1px red";
        cPassword.style.boxShadow = "0px 0px 10px 1px red";

        nameIcon.style.boxShadow = "0px 0px 10px 1px red";
        phoneIcon.style.boxShadow = "0px 0px 10px 1px red";
        emailIcon.style.boxShadow = "0px 0px 10px 1px red";
        passwordIcon.style.boxShadow = "0px 0px 10px 1px red";
        cPasswordIcon.style.boxShadow = "0px 0px 10px 1px red";

        return false;
    }
    else{
        name.style.boxShadow = "0px 0px 10px 1px green";
        phone.style.boxShadow = "0px 0px 10px 1px green";
        email.style.boxShadow = "0px 0px 10px 1px green";
        password.style.boxShadow = "0px 0px 10px 1px green";
        cPassword.style.boxShadow = "0px 0px 10px 1px green";

        return true;
    }
}