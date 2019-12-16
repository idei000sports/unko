if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });
}

// アプリインストールバナーが表示される直前で処理を中断
window.addEventListener('beforeinstallprompt', function(event) {
  event.preventDefault();
  defferedPrompt = event;
  return false;
})

// ボタンが押されたとか等のイベントを監視して、そのタイミングで中断していたアプリインストールバナー表示を発火
function doSomething() {
  console.log('Button is pressed! Show install banner.');
  if (defferedPrompt) {
    defferedPrompt.prompt();
    defferedPrompt.userChoice.then(function(choiceResult) {
      if (choiceResult.outcome === 'dismissed') {
        console.log('User canncelled');
      } else {

      }
    });
    defferedPrompt = null;
  }
}
	
window.onload = function(){
	document.getElementById('pwa_install').addEventListener('click', doSomething);
};