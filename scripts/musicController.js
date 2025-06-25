const audio = document.getElementById('mainAudio');


if (localStorage.getItem("audioTime")) {
  audio.currentTime = localStorage.getItem("audioTime");
}


setInterval(() => {
  localStorage.setItem("audioTime", audio.currentTime);
}, 1000);


audio.volume = 0.5;
