document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('startBtn');

  btn.addEventListener('click', () => {
    
    localStorage.removeItem("audioTime");

   
    const iframe = document.createElement('iframe');
    iframe.src = 'player.html';
    iframe.style.display = 'none';
    iframe.allow = 'autoplay';
    document.body.appendChild(iframe);

  
    setTimeout(() => {
      window.location.href = 'login.php';
    }, 300);
  });
});

