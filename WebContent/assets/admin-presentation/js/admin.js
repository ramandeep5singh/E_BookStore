function addCard(x){
    let addBook = document.getElementById("add-book");

    if(x==1){
        addBook.style.display = "block";
    }
    else{
        addBook.style.display = "none";   
    }
}
function activeAdminTask(x){
    let i=1;

    while(true){
        let element = document.getElementById("l"+i);
        let element1 = document.getElementById("l"+i+""+i);
        if(element == null && element1 ==null){
            break;
        }
        else if(element.id == x.id){
            x.style.backgroundColor = "#000080";
            x.style.color = "white";

            element1.style.display = "block";
            i++;
            continue;
        }
        element.style.backgroundColor = "";
        element.style.color = "";
        element1.style.display = "none";
        i++;
    }
}

let c = 0;
function showLogout(){
    if(c==0){
        c=1;
        document.getElementById("logout-button").style.display = "block";
    }
    else{
        c=0;
        document.getElementById("logout-button").style.display = "none";
    }
}
