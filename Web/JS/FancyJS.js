"use strict";

document.addEventListener("DOMContentLoaded", init);

function init(){
  let inputs = document.querySelectorAll(".fancy-input input");
  for(let i of inputs){
    i.addEventListener("focus", function(){ scaleLabel(this, false);});
    i.addEventListener("blur", function(){ scaleLabel(this, true);});
    scaleLabel(i, true);
  }
}

function scaleLabel(element, isBlur){
  if(isBlur){
    if(element.value === ""){
      element.parentNode.querySelector("label").classList.add("placeHolder");
    }
  }
  else{
    element.parentNode.querySelector("label").classList.remove("placeHolder");
  }
}
