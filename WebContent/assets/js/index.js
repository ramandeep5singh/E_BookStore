window.addEventListener("scroll",function(){
	var scrollPosition = window.scrollY;

	if(scrollPosition >= 200){
		downNav(1);
	}
	else{
		downNav(2);
	}
});
function downNav(x){
	let scrollNav = document.getElementById("scroll-nav");

	if(x==1){
		console.log("scrolled");
		scrollNav.style.top = "0";
		scrollNav.style.position = "fixed";
		scrollNav.style.transition = "top 0.5s ease-in-out";
	}
	else{
		scrollNav.style.top = "-15vw";
		scrollNav.style.position = "absolute";
		scrollNav.style.transition = "top 0.5s ease-in-out";
	}
}