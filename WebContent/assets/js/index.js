function appearProfileCard(x){
    if(x==1){
        document.getElementById("menu-content").style.display = "block";
    }
    else{
        document.getElementById("menu-content").style.display = "none";
    }
}
function checkExistence(){
	let hiddenIdentifier = document.getElementById("hidden-identifier").value;
	
	if(hiddenIdentifier==""){
		window.alert("You need to login first!!");
	}
	else{
		console.log("else portion");
	}
}