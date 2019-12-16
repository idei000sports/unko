window.onload = function(){
	console.log("osikko");
	let obj2 = document.getElementById("pwainstall");
	console.log("あ～ん" + obj2);
obj2.addEventListener("click",function(){

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });
}


},false);	
};


