let sections = document.querySelectorAll(".category-section");

window.addEventListener('scroll',function(){
    sections.forEach(function(section){
        let rect = section.getBoundingClientRect();

        console.log(section.id);
        if(rect.top<=270 && rect.bottom>=270){
            activeCategory(section);
        }
    });
});

function activeCategory(section){
    let sectionId = section.id;
    console.log(sectionId);

    switch(sectionId){
        case "java":
            document.getElementById("java-under").style.width = "100%";
            document.getElementById("python-under").style.width = "0";
            document.getElementById("cpp-under").style.width = "0";
            document.getElementById("c-under").style.width = "0";

            break;

        case "python":
            document.getElementById("java-under").style.width = "0";
            document.getElementById("python-under").style.width = "100%";
            document.getElementById("cpp-under").style.width = "0";
            document.getElementById("c-under").style.width = "0";

            break;

        case "cpp":
            document.getElementById("java-under").style.width = "0";
            document.getElementById("python-under").style.width = "0";
            document.getElementById("cpp-under").style.width = "100%";
            document.getElementById("c-under").style.width = "0";

            break;

        case "c":
            document.getElementById("java-under").style.width = "0";
            document.getElementById("python-under").style.width = "0";
            document.getElementById("cpp-under").style.width = "0";
            document.getElementById("c-under").style.width = "100%";

            break;
    }
}