let cont=document.getElementById("topjs");

window.onscroll=function(){
    if(document.documentElement.scrollTop>700){
        cont.style.display="block"  
        cont.style.transition="1s esae-in-out"
    }else{
        cont.style.display="none"
    }
}
cont.addEventListener("click",function(){
    window.scroll({
        top:0,
        left:0,
        
        behavior:"smooth"
    })
})
cont.onclick=function(){
    window.scroll({
        top:0,
        left:0,
        
        behavior:"smooth"
    })
}
window.onload=function(){
    var wait=document.getElementById("wit")
    setTimeout(function(){
        wait.style.display="none"
        wait.style.overflow="hidden"
        document.body.style.overflow="auto"
    },5000);
}
var ichhar=document.getElementById("ichhar")
var clos=document.getElementById("close");
clos.onclick=function(){
    let lop=ichhar.style.top="-100%"
    document.body.appendChild(lop)
}



var setting=document.getElementById("serce-seting")
var allsetting=document.getElementById("seting")

setting.onclick=function(){
    let col=allsetting.style.left="0px"
    document.body.appendChild(col)
}

var settinAut=document.getElementById("xmark")
settinAut.onclick=function(){
    let col=allsetting.style.left="-320px"
    document.body.appendChild(col)
}
/** follows */

var seve=document.querySelector("#Saved")
var conl=document.getElementById("Savedklp")
seve.onclick=function(){
    conl.style.display="block"
}