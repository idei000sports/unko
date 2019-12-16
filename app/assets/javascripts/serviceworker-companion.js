window.onload = function(){
	console.log("osikko");
document.getElementById("pwainstall").addEventListener("click",function(){

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });
}


},false);	
};


